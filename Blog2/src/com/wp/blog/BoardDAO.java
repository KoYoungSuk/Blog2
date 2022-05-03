package com.wp.blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	public Connection conn = null;
	   private String jdbc_driver;
	   private String db_url;
	   private String db_id;
	   private String db_pw;
	   
	public BoardDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	   public int insertBoard(BoardDO boarddo) throws ClassNotFoundException, SQLException
	   {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null;
	       String sql = "insert into board (serial, title, content2, savedate, modifydate, userid, anonymous, clicks) values (?,?,?,?,?,?,?,?)";
	       psm = conn.prepareStatement(sql);
	       psm.setInt(1, boarddo.getSerialnumber());
		   psm.setString(2, boarddo.getTitle());
		   psm.setString(3, boarddo.getContent1());
		   psm.setTimestamp(4, boarddo.getSavedate());
		   psm.setTimestamp(5, boarddo.getModifydate());
		   psm.setString(6, boarddo.getUserid());
		   psm.setString(7, boarddo.getAnonymous());
		   psm.setInt(8, boarddo.getClicks());
		   result = psm.executeUpdate();
		   disconnectDB();
		   return result;
	   }
	   
	   public List<BoardDO> getBoardList() throws ClassNotFoundException, SQLException
	   {
		   ArrayList<BoardDO> boardlist = null;
		   
		   connectDB();
		   ResultSet rs = null;
		   Statement sm = null;
		   sm = conn.createStatement();
		   String sql = "select * from board order by serial";
		   rs = sm.executeQuery(sql);
		   if(rs.isBeforeFirst())
		   {
			   boardlist = new ArrayList<BoardDO>();
			   while(rs.next())
			   {
				   BoardDO boarddo = new BoardDO();
				   boarddo.setSerialnumber(rs.getInt("serial"));
				   boarddo.setTitle(rs.getString("title"));
				   boarddo.setContent1(rs.getString("content2"));
				   boarddo.setSavedate(rs.getTimestamp("savedate"));
				   boarddo.setModifydate(rs.getTimestamp("modifydate"));
				   boarddo.setAnonymous(rs.getString("anonymous"));
				   boarddo.setClicks(rs.getInt("clicks"));
				   boardlist.add(boarddo);
			   }
		   }
		   rs.close();
		   disconnectDB();
		   return boardlist;
	   }
	   public List<String> getBoardByNum(int number, boolean br) throws ClassNotFoundException, SQLException
	   {
		   List<String> boardlist = null;
		   connectDB();
		   ResultSet rs = null;
		   PreparedStatement psm = null;
		   String sql = "select * from board where serial=?";
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, number);
		   rs = psm.executeQuery();
		   boardlist = new ArrayList<String>();
		   if(rs.next())
		   {
			   boardlist.add(number + "");
			   boardlist.add(rs.getString("userid"));
			   boardlist.add(rs.getString("title"));
			   if(br) {  //true 
				   boardlist.add(rs.getString("content2").replace("\r\n", "<br>"));
			   }
			   else {  //false
				   boardlist.add(rs.getString("content2"));
			   }
			   boardlist.add(rs.getString("savedate"));
			   boardlist.add(rs.getString("modifydate"));
			   boardlist.add(rs.getString("anonymous"));
			   boardlist.add(rs.getInt("clicks") + "");
		   }
		   return boardlist;
	   } 
	   public int DeleteBoard(int number) throws ClassNotFoundException, SQLException
	   {
		   connectDB();
		   int result = 0;
		   PreparedStatement psm = null; 
		   String sql = "delete from board where serial = ?";
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, number);
		   result = psm.executeUpdate();
		   disconnectDB();
		   return result;
	   }
	   
	   //Update Board Information By serialnumber 
	   public int UpdateBoard(BoardDO boarddo, Boolean clicks) throws ClassNotFoundException, SQLException
	   {
		   connectDB();
		   int result = 0; 
		   PreparedStatement psm = null;
		   String sql = "";
		   if(!clicks) { //false 
			   sql = "update board set title=?, content2=?, modifydate=?, userid=?, anonymous=? where serial=?";
			   psm = conn.prepareStatement(sql);
			   psm.setString(1, boarddo.getTitle());
			   psm.setString(2, boarddo.getContent1());
			   psm.setTimestamp(3, boarddo.getModifydate());
			   psm.setString(4, boarddo.getUserid());
			   psm.setString(5, boarddo.getAnonymous());
			   psm.setInt(6, boarddo.getSerialnumber());
		   }
		   else {   //true 
			   sql = "update board set clicks=? where serial=?";
			   psm = conn.prepareStatement(sql);
			   psm.setInt(1, boarddo.getClicks());
			   psm.setInt(2, boarddo.getSerialnumber());
		   }
		   //String sql = String.format("update board set title='%s',content2='%s', modifydate='%s', userid='%s', anonymous='%s' where serial=%d" , title, content2, modifydate, userid, access,number);
		   result = psm.executeUpdate();
		   disconnectDB();
		   return result;
	   }
	   
	   public int MaxBoardNumber() throws ClassNotFoundException, SQLException {
		   connectDB();
		   int maxboardnumber = 0;
		   ResultSet rs = null;
		   Statement sm = null;
		   sm = conn.createStatement();
		   String sql = "select max(serial) from board";
		   rs = sm.executeQuery(sql);
		   while(rs.next()) {
			   maxboardnumber = Integer.parseInt((String) rs.getObject(0));
		   }
		   disconnectDB();
		   return maxboardnumber;
	   }
}
