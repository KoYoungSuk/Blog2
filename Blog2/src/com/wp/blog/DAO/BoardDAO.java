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

import com.wp.blog.DTO.BoardDO;
import com.wp.blog.DTO.VideoDO;

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
		   psm.close();
		   disconnectDB();
		   return result;
	   }
	   
	   public List<BoardDO> getBoardList(Boolean desc) throws ClassNotFoundException, SQLException
	   {
		   ArrayList<BoardDO> boardlist = null;
		   String sql = null;
		   connectDB();
		   ResultSet rs = null;
		   Statement sm = null;
		   sm = conn.createStatement();
		   if(desc) {
			   sql = "select * from board order by serial desc";
		   }
		   else {
			   sql = "select * from board order by serial";
		   }
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
		   sm.close();
		   rs.close();
		   disconnectDB();
		   return boardlist;
	   }
	   
	   public Map<String, String> getBoardByNum(int number, boolean br, boolean clicks) throws ClassNotFoundException, SQLException
	   {
		   Map<String, String> boardlist = null;
		   connectDB();
		   ResultSet rs = null;
		   PreparedStatement psm = null;
		   String sql = "select * from board where serial=?"; 
		   psm = conn.prepareStatement(sql);
		   psm.setInt(1, number);
		   rs = psm.executeQuery();
		   boardlist = new HashMap<String, String>();
		   if(rs.next())
		   {
			   boardlist.put("number", number + "");
			   boardlist.put("userid", rs.getString("userid"));
			   boardlist.put("title", rs.getString("title"));
			   if(br) {  //true 
				   boardlist.put("content", rs.getString("content2").replace(System.getProperty("line.separator"), "<br>"));
			   }
			   else {  //false
				   boardlist.put("content", rs.getString("content2"));
			   }
			   boardlist.put("savedate", rs.getString("savedate"));
			   boardlist.put("modifydate", rs.getString("modifydate"));
			   boardlist.put("anonymous", rs.getString("anonymous"));
			   boardlist.put("clicks", (rs.getInt("clicks") + 1) + ""); //조회수 1씩 올리기 
		   }
		   psm.close();
		   rs.close();
		   disconnectDB();
		   if(clicks) { //올린 조회수로 메모장을 업데이트한다. 
			   BoardDO boarddo = new BoardDO(number, null, null, null, null, null, null, Integer.parseInt(boardlist.get("clicks")));
			   UpdateBoard(boarddo, true);
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
		   psm.close();
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
		   
		   if(clicks) { //조회수만 업데이트 
			   sql = "update board set clicks=? where serial=?";
			   psm = conn.prepareStatement(sql);
			   psm.setInt(1, boarddo.getClicks());
			   psm.setInt(2, boarddo.getSerialnumber());
		   }
		   else {
			   sql = "update board set title=?, content2=?, modifydate=?, userid=?, anonymous=? where serial=?";
			   psm = conn.prepareStatement(sql);
			   psm.setString(1, boarddo.getTitle());
			   psm.setString(2, boarddo.getContent1());
			   psm.setTimestamp(3, boarddo.getModifydate());
			   psm.setString(4, boarddo.getUserid());
			   psm.setString(5, boarddo.getAnonymous());
			   psm.setInt(6, boarddo.getSerialnumber());
		   }
		   //String sql = String.format("update board set title='%s',content2='%s', modifydate='%s', userid='%s', anonymous='%s' where serial=%d" , title, content2, modifydate, userid, access,number);
		   result = psm.executeUpdate();
		   psm.close();
		   disconnectDB();
		   return result;
	   }
	   
	   //Last Number of Board
	   public int MaxBoardNumber() throws ClassNotFoundException, SQLException {  
		   
		  connectDB();
		  ResultSet rs = null;
		  Statement sm = null;
		  sm = conn.createStatement();
		  String sql = "select max(serial) maxnumber from board";
		  rs = sm.executeQuery(sql);
		  int maxnumber = 0;
		  if(rs.isBeforeFirst())
		   {
			   while(rs.next())
			   {
				   maxnumber = rs.getInt("maxnumber");
			   }
		   }
		  sm.close();
		  rs.close();
		  disconnectDB();
		  return maxnumber;
	   }
	   
	   public int getBoardCount(String access) throws ClassNotFoundException, SQLException {
		   connectDB();
		   ResultSet rs = null;
	       Statement sm = null;
	       String sql = "";
	       sm = conn.createStatement();
		   if(access.equals("admin")) { //관리자 모드: 전체 
			   sql = "select count(*) countnumber from board";
		   }
		   else if(access.equals("member")) { //회원 모드: 관리자가 아닌 것들만 
			   sql = "select count(*) countnumber from board where anonymous != 'admin'";
		   }
		   else { //비회원 모드: 비회원만 
			   sql = "select count(*) countnumber from board where anonymous = 'anonymous'";
		   }
		   rs = sm.executeQuery(sql);
		   int countnumber = 0;
		   if(rs.isBeforeFirst())
		   {
			  while(rs.next())
		      {
				 countnumber = rs.getInt("countnumber");
			  }
		   }
		   sm.close();
		   rs.close();
		   disconnectDB();
		   return countnumber;
	   }
	   
	   public int getBoardNumber(String title) throws ClassNotFoundException, SQLException{
		   connectDB();
		   int number = 0;
		   String sql = "select serial from board where title LIKE '% ? %'";
		   ResultSet rs = null;
		   PreparedStatement psm = null;	   
		   psm = conn.prepareStatement(sql);
		   psm.setString(1, title);
		   rs = psm.executeQuery();
		   if(rs.isBeforeFirst()) {
			   while(rs.next()) {
				   number = rs.getInt("serial");
			   }
		   }
		   psm.close();
		   rs.close();
		   disconnectDB();
		   return number;
	   }
	   
	   public List<BoardDO> SearchBoardList(String word, Boolean desc) throws ClassNotFoundException, SQLException
	   {
		   ArrayList<BoardDO> boardlist = null;
		   String sql = null;
		   connectDB();
		   ResultSet rs = null;
		   Statement sm = null;
		   sm = conn.createStatement();
		   if(desc) {
			   sql = "select * from board where title like '%" + word + "%' order by serial desc";
		   }
		   else {
			   sql = "select * from board where title like '%" + word + "%' order by serial";
		   }
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
		   sm.close();
		   rs.close();
		   disconnectDB();
		   return boardlist;
	   }
}
