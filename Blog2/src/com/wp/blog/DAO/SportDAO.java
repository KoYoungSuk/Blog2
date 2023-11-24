package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.wp.blog.DTO.SportDO;

public class SportDAO {
	public Connection conn = null;
	private String jdbc_driver;
	private String db_url;
	private String db_id;
	private String db_pw;
	   
	  public SportDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	   
	  public int insertSport(SportDO sportdo) throws ClassNotFoundException, SQLException {
		  connectDB();
		  String sql = "insert into sport values (?,?,?,?)";
		  PreparedStatement psm = null;
		  psm = conn.prepareStatement(sql);
		  psm.setString(1, sportdo.getTitle());
		  psm.setInt(2, sportdo.getCalories());
		  psm.setInt(3, sportdo.getDistance());
		  psm.setTimestamp(4, sportdo.getSavedate());
		  int result = psm.executeUpdate();
		  psm.close(); 
		  disconnectDB();
		  return result; 
	  }
	  
	 public int updateSport(SportDO sportdo) throws ClassNotFoundException, SQLException{
		 connectDB();
		 String sql = "update sport set distance=?, calories=? where title=?";
		 PreparedStatement psm = null;
		 psm = conn.prepareStatement(sql);
		 psm.setInt(1, sportdo.getDistance());
		 psm.setInt(2, sportdo.getCalories());
		 psm.setString(3, sportdo.getTitle());
		 int result = psm.executeUpdate();
		 psm.close();
		 disconnectDB();
		 return result; 
	 }
	 
	 public int deleteSport(String date) throws ClassNotFoundException, SQLException {
		 connectDB();
		 String sql = "delete from sport where title=?";
		 PreparedStatement psm = null;
		 psm = conn.prepareStatement(sql);
		 psm.setString(1, date);
		 int result = psm.executeUpdate();
		 psm.close();
		 disconnectDB();
		 return result; 
	 }
	 
	 public Map<String, String> getSportList(String title) throws ClassNotFoundException, SQLException{
		 connectDB();
		 String sql = "select * from sport where title=?";
		 Map<String, String> sportlist = new HashMap<String, String>(); 
		 PreparedStatement psm = null;
		 psm = conn.prepareStatement(sql);
		 psm.setString(1, title);
		 ResultSet rs = psm.executeQuery();
		 if(rs.next()) {
			 sportlist.put("title", rs.getString("title")); 
			 sportlist.put("calories", rs.getInt("calories") + "");
			 sportlist.put("distance", rs.getInt("distance") + "");
			 sportlist.put("savedate", rs.getString("savedate")); 
		 }
		 rs.close();
		 psm.close();
		 disconnectDB();
		 return sportlist; 
	 }
	 
}
