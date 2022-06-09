package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {

   private Connection conn = null;
   public DAO(Connection conn) {
	   this.conn = conn;
   }
   public List<Object> processheader(String sql, Boolean ibool, String identifier) throws ClassNotFoundException, SQLException { //스키마는 속성과 제약조건 등 데이터를 저장하는 기준을 저장한다.(헤더) 
	   PreparedStatement psm = conn.prepareStatement(sql);
       if(ibool) {
		   psm.setObject(1, identifier);
	   }
	   ResultSet rs = psm.executeQuery();
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
	   psm.close();
	   rs.close();
	   return header;
   }
    
   public List<List<Object>> processColumn(String sql, Boolean bool, String value) throws ClassNotFoundException, SQLException{
                                        //인스턴스는 내용이 저장된다. 
	   PreparedStatement psm = conn.prepareStatement(sql);
	   if(bool) {
		   psm.setObject(1, value);
	   }
	   ResultSet rs = psm.executeQuery();
	   ResultSetMetaData rsmd = rs.getMetaData();
	   int columncount = rsmd.getColumnCount();
	   List<List<Object>> tablelist = new ArrayList<List<Object>>();
	    while(rs.next()) {
		   List<Object> columns = new ArrayList<Object>();
		   for(int j=1; j<=columncount; j++) {
			   columns.add(rs.getObject(j));
		   }
		   tablelist.add(columns);
	    }
	   psm.close();
	   rs.close();
	   return tablelist; 
   }
   
   public int iudDB(String sql) throws SQLException { //iud: insert, update, delete 
	   Statement sm = conn.createStatement();
	   int result = sm.executeUpdate(sql);
	   sm.close();
	   return result;
   }
   
   public void ddl(String sql) throws SQLException {  //DDL(Create, Drop, Alter) 
	   Statement sm = conn.createStatement();
	   sm.execute(sql);
	   sm.close();
   }
   public List<List<Object>> processColumnEasy(String tablename, String name, String value) throws ClassNotFoundException, SQLException{
	   String sql = null;
	   List<List<Object>> tablelist = null;
	   if(name != null && value != null) {
		   sql = "select * from " + tablename + " where " + name + "=?";
		   System.out.println(sql);
		   tablelist = processColumn(sql, true, value);
	   }
	   else {
		   sql = "select * from " + tablename;
		   System.out.println(sql);
		   tablelist = processColumn(sql, false, null);
	   }
	   return tablelist;
   }
   public List<Object> processHeaderEasy(String tablename, String name, String value) throws ClassNotFoundException, SQLException{
	   String sql = null;
	   List<Object> headerlist = null;
	   if(name != null && value != null) {
		   sql = "select * from " + tablename + " where " + name + "=?";
		   headerlist = processheader(sql, true, value);
	   }
	   else {
		   sql = "select * from " + tablename;
		   headerlist = processheader(sql, false, null);
	   }
	   return headerlist;
   }
   public int deleteTable(String tablename, String name, String value) throws ClassNotFoundException, SQLException{
	   String sql = "delete from " + tablename + " where " + name + "=?";
	   PreparedStatement psm = conn.prepareStatement(sql);
	   psm.setObject(1, value);
	   int result = psm.executeUpdate();
	   psm.close();
	   return result;
   }
}
