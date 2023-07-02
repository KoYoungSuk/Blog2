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

import com.wp.blog.DTO.DailyDO;

public class DailyDAO {
	public Connection conn = null;
	private String jdbc_driver;
	private String db_url;
	private String db_id;
	private String db_pw;
	   
	public DailyDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	
	public int insertDailyInfo(DailyDO dailydo) throws ClassNotFoundException, SQLException
	{
		int result = 0;
	    connectDB();
	    String sql = "insert into daily values (?,?,?,?,?,?)";
	    PreparedStatement psm = null;
	    psm = conn.prepareStatement(sql);
	    psm.setString(1, dailydo.getTitle());
	    psm.setString(2, dailydo.getContent());
	    psm.setString(3, dailydo.getStatus());
	    psm.setString(4, dailydo.getNote());
	    psm.setTimestamp(5, dailydo.getWritedate());
	    psm.setTimestamp(6, dailydo.getModifydate());
	    result = psm.executeUpdate();
	    psm.close(); 
	    disconnectDB(); 
	    return result; 
	}
	
	public int updateDailyInfo(DailyDO dailydo) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		connectDB();
		String sql = "update daily set content = ?, status = ?, modifydate = ? where title = ?";
		PreparedStatement psm = null;
		psm = conn.prepareStatement(sql);
		psm.setString(1, dailydo.getContent());
		psm.setString(2, dailydo.getStatus());
		psm.setTimestamp(3, dailydo.getModifydate()); 
		psm.setString(4, dailydo.getTitle()); 
		result = psm.executeUpdate();
		psm.close(); 
		disconnectDB(); 
		return result; 
	}
	
	public int deleteDailyInfo(String title) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		connectDB();
		String sql = "delete from daily where title = ?";
		PreparedStatement psm = null;
		psm = conn.prepareStatement(sql);
		psm.setString(1, title);
		result = psm.executeUpdate();
		psm.close();  
		disconnectDB();
		return result; 
	}
	
	public List<DailyDO> getDailyInfoList() throws ClassNotFoundException, SQLException 
	{
		List<DailyDO> dailylist = null;
		connectDB();
		String sql = "select * from daily order by title";
		Statement sm = null;
		ResultSet rs = null;
		sm = conn.createStatement();
		rs = sm.executeQuery(sql); 
		if(rs.isBeforeFirst())
		{
			dailylist = new ArrayList<DailyDO>();
			while(rs.next())
			{
				DailyDO dailydo = new DailyDO();
				dailydo.setTitle(rs.getString("title"));
				dailydo.setContent(rs.getString("content"));
				dailydo.setStatus(rs.getString("status"));
				dailydo.setNote(rs.getString("note"));
				dailydo.setWritedate(rs.getTimestamp("writedate"));
				dailydo.setModifydate(rs.getTimestamp("modifydate"));
				dailylist.add(dailydo); 
			}
		}
		sm.close(); 
		rs.close(); 
		disconnectDB();
		return dailylist; 
	}
	  
	public Map<String, String> getDetailDailyList(String title, boolean br) throws ClassNotFoundException, SQLException
	{
		Map<String, String> detaildailylist = new HashMap<String,String>(); 
		connectDB();
		String sql = "select * from daily where title=?";
		PreparedStatement psm = conn.prepareStatement(sql);
		psm.setString(1, title);
		ResultSet rs = psm.executeQuery();
		if(rs.next())
		{
			detaildailylist.put("title", rs.getString("title"));
			if(br) //true: br -> HTML Tag 
			{
				detaildailylist.put("content", rs.getString("content").replace(System.getProperty("line.separator"), "<br>")); 
			}
			else //false: NO HTML 
			{
				detaildailylist.put("content", rs.getString("content")); 
			}
			detaildailylist.put("status", rs.getString("status"));
			detaildailylist.put("note", rs.getString("note"));
			detaildailylist.put("writedate", rs.getTimestamp("writedate").toString());
			detaildailylist.put("modifydate", rs.getTimestamp("modifydate").toString()); 
		}
		psm.close(); 
		rs.close();
		disconnectDB();
		return detaildailylist; 
	}
	
	public List<DailyDO> searchDailyListByWord(String word) throws ClassNotFoundException, SQLException
	{
		List<DailyDO> dailylist = null;
		connectDB();
		String sql = "select * from daily where title like ? order by title "; 
		PreparedStatement psm = null;
		ResultSet rs = null;
		psm = conn.prepareStatement(sql);
		psm.setString(1, "%" + word + "%"); 
		rs = psm.executeQuery(); 
		if(rs.isBeforeFirst())
		{
			dailylist = new ArrayList<DailyDO>();
			while(rs.next())
			{
				DailyDO dailydo = new DailyDO();
				dailydo.setTitle(rs.getString("title"));
				dailydo.setContent(rs.getString("content"));
				dailydo.setStatus(rs.getString("status"));
				dailydo.setNote(rs.getString("note"));
				dailydo.setWritedate(rs.getTimestamp("writedate"));
				dailydo.setModifydate(rs.getTimestamp("modifydate"));
				dailylist.add(dailydo); 
			}
		}
		psm.close(); 
		rs.close(); 
		disconnectDB();
		return dailylist; 
	}
}
