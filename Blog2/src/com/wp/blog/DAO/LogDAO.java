package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.wp.blog.DTO.LogDO;

public class LogDAO {
	public Connection conn = null;
	   private String jdbc_driver;
	   private String db_url;
	   private String db_id;
	   private String db_pw;
	   
	public LogDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	public int insertLog(LogDO logdo) throws ClassNotFoundException, SQLException
	{
		connectDB();
		PreparedStatement psm = null;
		String sql = "insert into loglist (logno, ltime, comip, comnm, os, exenm) values (?,?,?,?,?,?) "; 
        psm = conn.prepareStatement(sql);
        psm.setInt(1, logdo.getLogno());
        psm.setTimestamp(2, logdo.getLtime());
        psm.setString(3, logdo.getComip());
        psm.setString(4, logdo.getComnm());
        psm.setString(5, logdo.getOs());
        psm.setString(6, logdo.getExenm());  
        int result = psm.executeUpdate();
 	    psm.close();
 	    disconnectDB();
 	    return result;
	}
	
	public int getMaxLogno() throws ClassNotFoundException, SQLException
	{
		connectDB();
		ResultSet rs = null; 
		Statement sm = null;
		sm = conn.createStatement(); 
		int maxnumber = 0;
		String sql = "select max(logno) maxnumber from loglist";
		rs = sm.executeQuery(sql);
		if(rs.next())
		{
			 maxnumber = Integer.parseInt(rs.getString("maxnumber"));
		}
		rs.close();
		sm.close();
		disconnectDB();
		return maxnumber; 
	}
}
