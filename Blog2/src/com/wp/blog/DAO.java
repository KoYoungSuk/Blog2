package com.wp.blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {

   private Connection conn = null;
   private String jdbc_driver;
   private String db_url;
   private String db_id;
   private String db_pw;
   public DAO() {
	   
   }
   public DAO(String jdbc_driver, String db_url, String db_id, String db_pw) {
	   this.jdbc_driver = jdbc_driver;
	   this.db_url = db_url;
	   this.db_id = db_id;
	   this.db_pw = db_pw;
   }
   public void connectDB() throws SQLException, ClassNotFoundException
   {
	   Class.forName(jdbc_driver);
	   conn = DriverManager.getConnection(db_url, db_id, db_pw);
   }
   public void disconnectDB() throws SQLException
   {
	   if(conn != null)
	   {
		   conn.close();
		   conn = null;
	   }
   }
   public List<Object> processheader(String sql) throws ClassNotFoundException, SQLException {
	   
	   connectDB(); 
	   Statement sm = conn.createStatement();
	   ResultSet rs = sm.executeQuery(sql);
	   ResultSetMetaData rsmd = rs.getMetaData();
	   int columncount = rsmd.getColumnCount();
	   int i=0;
	   List<Object> header = new ArrayList<Object>();
	   while(rs.next()) {
		 for(int j=1; j<=columncount; j++) {
		   if(i == 0) {
			   header.add(rsmd.getColumnName(j));
		   }
		 }
		 break;
	   }
	   rs.close();
	   disconnectDB();
	   return header;
   }
   
   public List<List<Object>> processColumn(String sql) throws ClassNotFoundException, SQLException{
	   
	   connectDB(); 
	   Statement sm = conn.createStatement();
	   ResultSet rs = sm.executeQuery(sql);
	   ResultSetMetaData rsmd = rs.getMetaData();
	   int columncount = rsmd.getColumnCount();
	   List<List<Object>> tablelist = new ArrayList<List<Object>>();
	   int i=0;
	   List<Object> header = new ArrayList<Object>();
	    while(rs.next()) {
		   List<Object> columns = new ArrayList<Object>();
		   for(int j=1; j<=columncount; j++) {
			   if(i == 0) {
			      header.add(rsmd.getColumnName(j));
			   }
			   columns.add(rs.getObject(j));
		   }
		   i++;
		   tablelist.add(columns);
	    }
	   rs.close();
	   disconnectDB();
	   return tablelist; 
   }
   
   public List<List<Object>> processColumnEasy(String tablename) throws ClassNotFoundException, SQLException{
	   String sql = "select * from " + tablename;
	   List<List<Object>> tablelist = processColumn(sql);
	   return tablelist;
   }
   public List<Object> processHeaderEasy(String tablename) throws ClassNotFoundException, SQLException{
	   String sql = "select * from " + tablename;
	   List<Object> header = processheader(sql);
	   return header;
   }
}
