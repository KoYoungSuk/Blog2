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

import com.wp.blog.DTO.ProductDO;

public class ProductDAO {
   
	private Connection conn = null;
	private String jdbc_driver;
	private String db_url;
	private String db_id;
	private String db_pw;
	public ProductDAO(String jdbc_driver, String db_url, String db_id, String db_pw) {
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
		   if(conn != null)
		   {
			   conn.close();
			   conn = null;
		   }
	}
	public int insertProduct(ProductDO productdo) throws ClassNotFoundException, SQLException {
		connectDB();
		int result = 0;
		PreparedStatement psm = null;
		String sql = "insert into product (product_no, product_name, buy_date, buy_date_used, purpose) values (?,?,?,?,?)";
		psm = conn.prepareStatement(sql);
		psm.setString(1, productdo.getProduct_no());
		psm.setString(2, productdo.getProduct_name());
		psm.setString(3, productdo.getBuy_date());
		psm.setString(4, productdo.getBuy_date_used());
		psm.setString(5, productdo.getPurpose());
		result = psm.executeUpdate();
		psm.close();
		disconnectDB();
		return result;
	}
	
	public int updateProduct(ProductDO productdo) throws ClassNotFoundException, SQLException {
		connectDB();
		int result = 0;
		PreparedStatement psm = null;
		String sql = "update product set product_name = ?, buy_date = ?, buy_date_used = ?, purpose = ? where product_no = ?";
		psm = conn.prepareStatement(sql);
		psm.setString(1, productdo.getProduct_name());
		psm.setString(2, productdo.getBuy_date());
		psm.setString(3, productdo.getBuy_date_used());
		psm.setString(4, productdo.getPurpose());
		psm.setString(5, productdo.getProduct_no());
		result = psm.executeUpdate();
		psm.close();
		disconnectDB();
		return result;
	}
	
	public int deleteProduct(String product_no) throws ClassNotFoundException, SQLException {
		connectDB();
		int result = 0;
		PreparedStatement psm = null;
		String sql = "delete from product where product_no = ?";
		psm = conn.prepareStatement(sql);
		psm.setString(1, product_no);
		result = psm.executeUpdate();
		psm.close();
		disconnectDB();
		return result; 
	}
    public List<ProductDO> getProductTotalList() throws ClassNotFoundException, SQLException {
    	List<ProductDO> productlist = new ArrayList<ProductDO>();
    	String sql = null;
    	connectDB();
    	Statement sm = null;
    	ResultSet rs = null;
    	sm = conn.createStatement();
    	sql = "select * from product order by product_no"; 
    	rs = sm.executeQuery(sql);
    	if(rs.isBeforeFirst()) {
    		while(rs.next()) {
    			ProductDO productdo = new ProductDO();
    			productdo.setProduct_no(rs.getString("product_no"));
    			productdo.setProduct_name(rs.getString("product_name"));
    			productdo.setBuy_date(rs.getString("buy_date"));
    			productdo.setBuy_date_used(rs.getString("buy_date_used"));
    			productdo.setPurpose(rs.getString("purpose"));
    			productlist.add(productdo);
    		}
    	}
    	sm.close();
    	rs.close();
    	disconnectDB();
    	return productlist;
    }
    
    //Search by buy_date 
    public List<ProductDO> getProductTotalList(String buy_date) throws ClassNotFoundException, SQLException {
    	List<ProductDO> productlist = new ArrayList<ProductDO>();
    	String sql = null;
    	connectDB();
    	PreparedStatement psm = null;
    	ResultSet rs = null;
    	sql = "select * from product where product_no like ?";
    	psm = conn.prepareStatement(sql);
    	psm.setString(1, "%" + buy_date + "%");
    	rs = psm.executeQuery();
    	if(rs.isBeforeFirst()) {
    		while(rs.next()) {
    			ProductDO productdo = new ProductDO();
    			productdo.setProduct_no(rs.getString("product_no"));
    			productdo.setProduct_name(rs.getString("product_name"));
    			productdo.setBuy_date(rs.getString("buy_date"));
    			productdo.setBuy_date_used(rs.getString("buy_date_used"));
    			productdo.setPurpose(rs.getString("purpose"));
    			productlist.add(productdo);
    		}
    	}
    	psm.close();
    	rs.close();
    	disconnectDB();
    	return productlist;
    }
    public Map<String, String> getProductListByNumber(String product_no) throws ClassNotFoundException, SQLException{
    	Map<String, String> productlist = new HashMap<String, String> ();
    	connectDB();
    	PreparedStatement psm = null;
    	ResultSet rs = null;
    	String sql = "select * from product where product_no = ?";
    	psm = conn.prepareStatement(sql);
    	psm.setString(1, product_no);
    	rs = psm.executeQuery();
    	if(rs.next()) {
    		productlist.put("product_no", rs.getString("product_no"));
    		productlist.put("product_name", rs.getString("product_name"));
    		productlist.put("buy_date", rs.getString("buy_date"));
    		productlist.put("buy_date_used", rs.getString("buy_date_used"));
    		productlist.put("purpose", rs.getString("purpose"));
    	}
    	psm.close();
    	rs.close();
    	disconnectDB();
    	return productlist;
    }
    
    public int getProductNumber() throws ClassNotFoundException, SQLException{
    	connectDB();
        Statement sm = null;
        ResultSet rs = null;
        sm = conn.createStatement();
        String sql = "select count(*) productnumber from product";
        rs = sm.executeQuery(sql);
        int result = 0;
        if(rs.isBeforeFirst()) {
        	while(rs.next()) {
        		result = rs.getInt("productnumber");
        	}
        }
        sm.close();
        rs.close();
        disconnectDB();
        return result;
    }
    
    //Search Product 
    public int getProductNumber(String buy_date) throws ClassNotFoundException, SQLException{
    	connectDB();
    	int number = 0; 
    	String sql = "select count(*) as productnumber from product where product_no like ?";
    	PreparedStatement psm = conn.prepareStatement(sql);
    	psm.setString(1, "%" + buy_date + "%");
    	ResultSet rs = psm.executeQuery();
    	if(rs.next()) {
    		number = rs.getInt("productnumber");
    	}
    	psm.close();
    	rs.close(); 
    	disconnectDB();
    	return number; 
    }
    
    public String getMaxProductNumber(String initial_types) throws ClassNotFoundException, SQLException{
    	connectDB();
    	String sql = "select max(product_no) as maxnum from product where product_no like ?"; 
    	PreparedStatement psm = conn.prepareStatement(sql); 
        psm.setString(1, initial_types + "%");
        ResultSet rs = psm.executeQuery();
        String maxnum = null;
        if(rs.next()) {
        	maxnum = rs.getString("maxnum"); 
        }
    	psm.close();
        rs.close();
        disconnectDB();
        return maxnum; 
    }
    
    
}
