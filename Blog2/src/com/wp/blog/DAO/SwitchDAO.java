package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.wp.blog.DTO.SwitchDO;

public class SwitchDAO {
	public Connection conn = null;
	private String jdbc_driver;
	private String db_url;
	private String db_id;
	private String db_pw;
	   
	public SwitchDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
	{
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
	  
	   public int insertSwitch(SwitchDO switchdo) throws ClassNotFoundException, SQLException
	   {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null;
	       String sql = "insert into switchtable (num, status, savedate, ex) values (?,?,?,?)";
	       psm = conn.prepareStatement(sql);
	       psm.setInt(1, switchdo.getNum());
		   psm.setString(2, switchdo.getStatus());
		   psm.setTimestamp(3, switchdo.getSavedate());
		   psm.setString(4, switchdo.getEx());
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result;
	   }
	   
	   public int getMaxNum() throws ClassNotFoundException, SQLException
	   {
		   connectDB();
		   int maxnum = 0;
		   String sql = "select max(num) as maxnum from switchtable";
		   Statement sm = null;
		   ResultSet rs = null;
		   sm = conn.createStatement();
		   rs = sm.executeQuery(sql);
		   
		   if(rs.next())
		   {
			   maxnum = rs.getInt("maxnum");   
		   }
		   disconnectDB(); 
		   return maxnum; 
	   }
	   
	   
	   
}
