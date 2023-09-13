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

import com.wp.blog.DTO.InfoDO;

public class InfoDAO {
	   private Connection conn  = null;
	   private String jdbc_driver;
	   private String db_url;
	   private String db_id;
	   private String db_pw;
	   public InfoDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	   
	   public int insertInfo(InfoDO infodo) throws SQLException, ClassNotFoundException
	   {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null;
		   String sql = "insert into businfo (title, content, savedate, modifydate) values (?,?,?,?)";
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, infodo.getTitle());
		   psm.setString(2, infodo.getContent());
		   psm.setTimestamp(3, infodo.getSavedate());
		   psm.setTimestamp(4, infodo.getModifydate());
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result;
	   }
	   
	   public int updateInfo(InfoDO infodo) throws ClassNotFoundException, SQLException {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null;
		   String sql = "update businfo set content=?, modifydate=? where title = ?";
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, infodo.getContent());
		   psm.setTimestamp(2, infodo.getModifydate());
		   psm.setString(3, infodo.getTitle());
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result;
	   }
	   
	   public int deleteInfo(String title) throws ClassNotFoundException, SQLException {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null;
		   String sql = "delete from businfo where title = ?";
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, title);
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result; 
	   }
	   
	   public List<InfoDO> getInfoList() throws ClassNotFoundException, SQLException {
		   
		   List<InfoDO> infolist = null;
		   connectDB();
		   String sql = "select * from businfo order by title"; 
		   Statement sm = conn.createStatement();
		   ResultSet rs = sm.executeQuery(sql);
		   if(rs.isBeforeFirst())
		   {
			   infolist = new ArrayList<InfoDO>(); //ArrayList 초기화 
			   while(rs.next())
			   {
				   InfoDO infodo = new InfoDO(); //InfoDO 초기화 
				   infodo.setTitle(rs.getString("title"));
				   infodo.setContent(rs.getString("content"));
				   infodo.setSavedate(rs.getTimestamp("savedate"));
				   infodo.setModifydate(rs.getTimestamp("modifydate"));
				   infolist.add(infodo); //데이터베이스에서 불러온 값들이 더이상 나오지 않을때까지 반복한다. 
			   }
		   }
		   sm.close();
		   rs.close();
		   disconnectDB();
		   return infolist;
	   }
	   
	   public Map<String, String> getInfoListByTitle(String title, Boolean br) throws ClassNotFoundException, SQLException {
		   Map<String, String> infolist = new HashMap<String, String>();
		   connectDB();
		   PreparedStatement psm = null;
		   String sql = "select * from businfo where title= ?";
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, title);
		   ResultSet rs = psm.executeQuery();
		   if(rs.next()) {
			   infolist.put("title", rs.getString("title"));
			   if(br) { //br를 HTML 태그로 고치기 
				   infolist.put("content", rs.getString("content").replace(System.getProperty("line.separator"), "<br>"));
			   }
			   else {
				   infolist.put("content", rs.getString("content"));
			   }
			   infolist.put("savedate", rs.getTimestamp("savedate").toString());
			   if(rs.getTimestamp("modifydate") == null) {
				   infolist.put("modifydate", "NULL");
			   }
			   else {
				   infolist.put("modifydate", rs.getTimestamp("modifydate").toString());
			   }
		   }
		   psm.close();
		   rs.close();
		   disconnectDB();
		   return infolist;
	   }
	   
	   
	   public List<InfoDO> searchInfoListByTitle(String word) throws ClassNotFoundException, SQLException{
		   List<InfoDO> infolist = null;
		   connectDB();
		   String sql = "select * from businfo where content like ? order by title"; 
	      
		   PreparedStatement psm = null;
		   
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, '%' + word + '%'); 
		   ResultSet rs = psm.executeQuery();
		   if(rs.isBeforeFirst())
		   {
			   infolist = new ArrayList<InfoDO>();
			   while(rs.next())
			   {
				   InfoDO infodo = new InfoDO(); //InfoDO 초기화 
				   infodo.setTitle(rs.getString("title"));
				   infodo.setContent(rs.getString("content"));
				   infodo.setSavedate(rs.getTimestamp("savedate"));
				   infodo.setModifydate(rs.getTimestamp("modifydate"));
				   infolist.add(infodo); //데이터베이스에서 불러온 값들이 더이상 나오지 않을때까지 반복한다. 
			   }
		   }
		   psm.close();
		   rs.close();
		   disconnectDB();
		   return infolist;
		}
}
