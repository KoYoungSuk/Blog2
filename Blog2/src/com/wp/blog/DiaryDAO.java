package com.wp.blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DiaryDAO {
   private Connection conn  = null;
   private String jdbc_driver;
   private String db_url;
   private String db_id;
   private String db_pw;
   public DiaryDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
   public int insertDiary(DiaryDO diarydo) throws ClassNotFoundException, SQLException {
	   
	   connectDB();
	   int result = 0;
	   PreparedStatement psm = null;
	   String sql = "insert into diary (title, context, savedate, modifydate) values (?,?,?,?)";
	   psm = conn.prepareStatement(sql);
	   psm.setString(1, diarydo.getTitle());
	   psm.setString(2, diarydo.getContext());
	   psm.setTimestamp(3, diarydo.getSavedate());
	   psm.setTimestamp(4, diarydo.getModifydate());
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result;
   }
   
   public int updateDiary(DiaryDO diarydo) throws ClassNotFoundException, SQLException {
	   connectDB();
	   int result = 0;
	   PreparedStatement psm = null;
	   String sql = "update diary set context=? modifydate=? where title=?";
	   psm = conn.prepareStatement(sql);
	   psm.setString(1, diarydo.getContext());
	   psm.setTimestamp(2, diarydo.getModifydate());
	   psm.setString(3, diarydo.getTitle());
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result;
   }
   
   public int deleteDiary(String title) throws ClassNotFoundException, SQLException {
	   connectDB();
	   int result = 0;
	   PreparedStatement psm = null;
	   String sql = "delete from board where title = '" + title + "'";
	   psm = conn.prepareStatement(sql);
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result; 
   }
   public List<DiaryDO> getDiaryList() throws ClassNotFoundException, SQLException {
	   
	   List<DiaryDO> diarylist = null;
	   connectDB();
	   String sql = "select * from diary order by title";
	   
	   Statement sm = conn.createStatement();
	   ResultSet rs = sm.executeQuery(sql);
	   if(rs.isBeforeFirst())
	   {
		   diarylist = new ArrayList<DiaryDO>();
		   while(rs.next())
		   {
			   DiaryDO diarydo = new DiaryDO();
			   diarydo.setTitle(rs.getString("title"));
			   diarydo.setContext(rs.getString("context"));
			   diarydo.setSavedate(rs.getTimestamp("savedate"));
			   diarydo.setModifydate(rs.getTimestamp("modifydate"));
			   diarylist.add(diarydo);
		   }
	   }
	   rs.close();
	   disconnectDB();
	   return diarylist;
   }
   
   public List<String> getDiaryListByTitle(String title) throws ClassNotFoundException, SQLException {
	   List<String> diarylist = new ArrayList<String>();
	   connectDB();
	   String sql = "select * from diary where title='" + title + "'";
	   Statement sm = conn.createStatement();
	   ResultSet rs = sm.executeQuery(sql);
	   if(rs.next()) {
		   diarylist.add(rs.getString("title"));
		   diarylist.add(rs.getString("context"));
		   diarylist.add(rs.getTimestamp("savedate").toString());
		   if(rs.getTimestamp("modifydate") == null) {
			   diarylist.add("NULL");
		   }
		   else {
			   diarylist.add(rs.getTimestamp("modifydate").toString());
		   }
	   }
	   rs.close();
	   disconnectDB();
	   return diarylist;
   }
}
