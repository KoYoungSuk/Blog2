package com.wp.blog;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class MemberDAO {
   public Connection conn = null;
   private String jdbc_driver;
   private String db_url;
   private String db_id;
   private String db_pw;
   
   public MemberDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
   //Insert Member(Sign up)
   public int insertMembers(MemberDO memberdo) throws ClassNotFoundException, SQLException
   {
	   connectDB();
	   int result = 0;
	   PreparedStatement psm = null;
       String sql = "insert into member (id, password, firstname, lastname, birthday, joindate) values (?,?,?,?,?,?)";
       psm = conn.prepareStatement(sql);
	   psm.setString(1, memberdo.getId());
	   psm.setString(2, memberdo.getPassword());
	   psm.setString(3, memberdo.getFirstname());
	   psm.setString(4, memberdo.getLastname());
	   psm.setString(5, memberdo.getBirthday());
	   psm.setTimestamp(6, memberdo.getJoindate());
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result;
   }
   
   //Get MemberList
   public List<MemberDO> getMemberList() throws ClassNotFoundException, SQLException
   {
	   ArrayList<MemberDO> memberlist = null;
	   connectDB();
	   ResultSet rs = null;
	   Statement sm = null;
	   sm = conn.createStatement();
	   String sql = "select * from member order by id";
	   rs = sm.executeQuery(sql);
	   if(rs.isBeforeFirst())
	   {
		   memberlist = new ArrayList<MemberDO>();
		   while(rs.next())
		   {
			   MemberDO memberdo = new MemberDO();
			   memberdo.setId(rs.getString("id"));
			   memberdo.setPassword(rs.getString("password"));
			   memberdo.setFirstname(rs.getString("firstname"));
			   memberdo.setLastname(rs.getString("lastname"));
			   memberdo.setBirthday(rs.getString("birthday"));
			   memberdo.setJoindate(rs.getTimestamp("joindate"));
			   memberlist.add(memberdo);
		   }
	   }
	   rs.close();
	   disconnectDB();
	   return memberlist;
   }
   
   
   public Map<String, String> getMemberById(String id) throws ClassNotFoundException, SQLException
   {
	   Map<String, String> memberlist = null;
	   connectDB();
	   ResultSet rs = null;
	   PreparedStatement psm = null;
	   String sql = "select * from member where id =?";
	   psm = conn.prepareStatement(sql);
	   psm.setString(1, id);
	   rs = psm.executeQuery();
	   memberlist = new HashMap<String, String>();
	   if(rs.next())
	   {
		   memberlist.put("id", id);
		   memberlist.put("password", rs.getString("password"));
		   memberlist.put("firstname", rs.getString("firstname"));
		   memberlist.put("lastname", rs.getString("lastname"));
		   memberlist.put("birthday", rs.getString("birthday"));
		   memberlist.put("joindate", rs.getTimestamp("joindate").toString());
	   }
	   return memberlist;
   } 
   
   //Delete Member By ID
   public int DeleteMember(String id) throws ClassNotFoundException, SQLException
   {
	   connectDB();
	   int result = 0;
	   PreparedStatement psm = null; 
	   String sql = "delete from member where id =?";
	   psm = conn.prepareStatement(sql);
	   psm.setString(1, id);
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result;
   }
   
   //Update Member Information By ID 
   public int UpdateMember(MemberDO memberdo) throws ClassNotFoundException, SQLException
   {
	   connectDB();
	   int result = 0; 
	   PreparedStatement psm = null;
	   String sql = "update member set password=?, firstname=?, lastname=?, birthday=? where id=?";
	   //String sql = String.format("update member set password='%s', firstname='%s', lastname='%s', birthday='%s' where id='%s'" , password, firstname, lastname, birthday, id);
	   psm = conn.prepareStatement(sql);
	   psm.setString(1, memberdo.getPassword());
	   psm.setString(2, memberdo.getFirstname());
	   psm.setString(3, memberdo.getLastname());
	   psm.setString(4, memberdo.getBirthday());
	   psm.setString(5, memberdo.getId());
	   result = psm.executeUpdate();
	   disconnectDB();
	   return result;
   }
   
}
