package com.wp.blog.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wp.blog.DTO.PDFDTO;

public class PDFDAO {
	public Connection conn = null;
	private String jdbc_driver;
	private String db_url;
	private String db_id;
	private String db_pw;
	   
	public PDFDAO(String jdbc_driver, String db_url, String db_id, String db_pw)
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
	 
	 public int insertPDF(PDFDTO pdfdto) throws ClassNotFoundException, SQLException {
		 connectDB();
		 String sql = "insert into pdf values (?,?,?)"; 
		 int result = 0;
		 PreparedStatement psm = null;
		 psm = conn.prepareStatement(sql);
		 psm.setString(1, pdfdto.getFilename());
		 psm.setTimestamp(2, pdfdto.getSavedate());
		 psm.setTimestamp(3, pdfdto.getModifydate());
		 result = psm.executeUpdate();
		 psm.close();
		 disconnectDB();
		 return result; 
	 }
	 
	 public int deletePDF(String filename) throws ClassNotFoundException, SQLException{
		 connectDB();
		 String sql = "delete from pdf where filename=?";
		 int result = 0;
		 PreparedStatement psm = null;
		 psm = conn.prepareStatement(sql);
		 psm.setString(1, filename);
		 result = psm.executeUpdate();
		 psm.close();
		 disconnectDB();
		 return result; 
	 }
	 
	 public List<PDFDTO> getPDFList() throws ClassNotFoundException, SQLException{
		 connectDB();
		 String sql = "select * from pdf order by filename";
		 List<PDFDTO> pdflist = new ArrayList<PDFDTO>();
		 Statement sm = null;
		 ResultSet rs = null;
		 sm = conn.createStatement();
		 rs = sm.executeQuery(sql);
		 if(rs.isBeforeFirst()) {
			 pdflist = new ArrayList<PDFDTO>();
			 while(rs.next()) {
				 PDFDTO pdfdto = new PDFDTO();
				 pdfdto.setFilename(rs.getString("filename"));
				 pdfdto.setSavedate(rs.getTimestamp("savedate"));
				 pdfdto.setModifydate(rs.getTimestamp("modifydate"));
				 pdflist.add(pdfdto);
			 }
		 }
		 rs.close();
		 sm.close();
		 disconnectDB();
		 return pdflist; 
	 }
}
