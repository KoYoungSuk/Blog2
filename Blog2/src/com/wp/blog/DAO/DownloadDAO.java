package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wp.blog.DTO.DownloadDO;

public class DownloadDAO {
	private Connection conn  = null;
	   private String jdbc_driver;
	   private String db_url;
	   private String db_id;
	   private String db_pw;
	   public DownloadDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
	   {
		   this.jdbc_driver = jdbc_driver;
		   this.db_url = db_url;
		   this.db_id = db_id;
		   this.db_pw = db_pw;
	   }
	   public void connectDB() throws ClassNotFoundException, SQLException {
		   Class.forName(jdbc_driver);
		   conn = DriverManager.getConnection(db_url, db_id, db_pw);
	   }
	   public void disconnectDB() throws SQLException {
		   if(conn != null) {
			   conn.close();
			   conn = null;
		   }
	   }
	   
	   public int uploadTable(DownloadDO downloaddo) throws ClassNotFoundException, SQLException {
		   connectDB();
		   String sql = "insert into download values (?,?,?,?,?,?)"; 
		   int result = 0;
		   PreparedStatement psm = null;
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, downloaddo.getNum());
		   psm.setString(2, downloaddo.getTitle());
		   psm.setString(3, downloaddo.getContent());
		   psm.setString(4, downloaddo.getFilename());
		   psm.setTimestamp(5, downloaddo.getSavedate());
		   psm.setTimestamp(6, downloaddo.getModifydate());
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result; 
	   }
	   
	   public int updateTable(DownloadDO downloaddo) throws ClassNotFoundException, SQLException{
		   connectDB();
		   String sql = null; 
		   int result = 0; 
		   if(downloaddo.getFilename() != null) {
			   sql = "update download set title=?, content=?, filename=?, modifydate=? where num=?"; 
		   }
		   else {
			   sql = "update download set title=?, content=?, modifydate=? where num=?"; 
		   }
		   PreparedStatement psm = null;
		   psm = conn.prepareStatement(sql);
		   if(sql.equals("update download set title=?, content=?, filename=?, modifydate=? where num=?")) {
			   psm.setString(1, downloaddo.getTitle());
			   psm.setString(2, downloaddo.getContent());
			   psm.setString(3, downloaddo.getFilename());
			   psm.setTimestamp(4, downloaddo.getModifydate());
			   psm.setInt(5, downloaddo.getNum());
		   }
		   else if(sql.equals("update download set title=?, content=?, modifydate=? where num=?")) {
			   psm.setString(1, downloaddo.getTitle());
			   psm.setString(2, downloaddo.getContent());
			   psm.setTimestamp(3, downloaddo.getModifydate());
			   psm.setInt(4, downloaddo.getNum());
		   }
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result; 
	   }
	   
	   public int deleteTable(int num) throws ClassNotFoundException, SQLException {
		   connectDB();
		   String sql = "delete from download where num = ?";
		   int result = 0;
		   PreparedStatement psm = null;
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, num);
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result; 
	   }
	   
	   public List<DownloadDO> getTotaldownloadTable() throws ClassNotFoundException, SQLException {
		   connectDB();
		   String sql = "select * from download order by num";
		   List<DownloadDO> downloadtablelist = null; 
		   Statement sm = null;
		   ResultSet rs = null; 
		   sm = conn.createStatement();
		   rs = sm.executeQuery(sql);
		   downloadtablelist = new ArrayList<DownloadDO>();
		   if(rs.isBeforeFirst()) {
			   while(rs.next()) {
				   DownloadDO downloaddo = new DownloadDO();
				   downloaddo.setNum(rs.getInt("num"));
				   downloaddo.setTitle(rs.getString("title"));
				   downloaddo.setContent(rs.getString("content"));
				   downloaddo.setFilename(rs.getString("filename"));
				   downloaddo.setSavedate(rs.getTimestamp("savedate"));
				   downloaddo.setModifydate(rs.getTimestamp("modifydate"));
				   downloadtablelist.add(downloaddo); 
			   }
		   }
		   rs.close();
		   sm.close();
		   disconnectDB();
		   return downloadtablelist; 
	   }
	   
	   public Map<String, String> getDownloadTableByNum(int num, Boolean br) throws ClassNotFoundException, SQLException{
		   connectDB();
		   Map<String, String> downloadtablelist = new HashMap<String, String>(); 
		   String sql = "select * from download where num = ?";
		   PreparedStatement psm = null;
		   ResultSet rs = null;
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, num);
		   rs = psm.executeQuery();
		   if(rs.next()) {
			   downloadtablelist.put("num", rs.getInt("num") + "");
			   downloadtablelist.put("title", rs.getString("title")); 
			   if(br) {
				   downloadtablelist.put("content", rs.getString("content").replace(System.getProperty("line.separator"), "<br>"));
			   }
			   else {
				   downloadtablelist.put("content", rs.getString("content")); 
			   }
			   
			   downloadtablelist.put("filename", rs.getString("filename"));
			   downloadtablelist.put("savedate", rs.getTimestamp("savedate").toString());
			   downloadtablelist.put("modifydate", rs.getTimestamp("modifydate").toString()); 
		   }
		   rs.close();
		   psm.close();
		   disconnectDB();
		   return downloadtablelist; 
	   }
	   
	   public int getCountNum() throws ClassNotFoundException, SQLException{
		   connectDB();
		   String sql = "select count(*) as countnum from download";
		   int count = 0;
		   Statement sm = null;
		   ResultSet rs = null;
		   sm = conn.createStatement();
		   rs = sm.executeQuery(sql);
		   if(rs.next()) {
			   count = rs.getInt("countnum"); 
		   }
		   rs.close();
		   sm.close();
		   disconnectDB();
		   return count; 
	   }
	   
	   public int getMaxnum() throws ClassNotFoundException, SQLException{
		   connectDB();
		   String sql = "select max(num) as maxnum from download";
		   int maxnum = 0;
		   Statement sm = null;
		   ResultSet rs = null;
		   sm = conn.createStatement();
		   rs = sm.executeQuery(sql);
		   if(rs.next()) {
			   maxnum = rs.getInt("maxnum"); 
		   }
		   rs.close();
		   sm.close();
		   disconnectDB();
		   return maxnum; 
	   }
}
