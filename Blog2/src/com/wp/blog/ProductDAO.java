package com.wp.blog;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		String sql = "insert into product ('product_no', 'product_name', 'buy_date', 'buy_date_used', 'purpose') values ?,?,?,?,?";
		psm = conn.prepareStatement(sql);
		psm.setString(1, productdo.getProduct_no());
		psm.setString(2, productdo.getProduct_name());
		psm.setString(3, productdo.getBuy_date());
		psm.setString(4, productdo.getBuy_date_used());
		psm.setString(5, productdo.getPurpose());
		result = psm.executeUpdate();
		disconnectDB();
		return result;
	}
    public List<ProductDO> getProductTotalList(Boolean desc, String columnname) throws ClassNotFoundException, SQLException {
    	List<ProductDO> productlist = new ArrayList<ProductDO>();
    	String sql = null;
    	connectDB();
    	Statement sm = null;
    	ResultSet rs = null;
    	sm = conn.createStatement();
    	if(desc) {
    		if(columnname.equals("buy_date")) {
    			sql = "select * from product order by buy_date desc";
    		}
    		else if(columnname.equals("buy_date_used")) {
    			sql = "select * from product order by buy_date_used desc";
    		}
    		else {
    			sql = "select * from product order by product_no desc";
    		}
    	}
    	else {
    		if(columnname.equals("buy_date")) {
    			sql = "select * from product order by buy_date";
    		}
    		else if(columnname.equals("buy_date_used")) {
    			sql = "select * from product order by buy_date_used";
    		}
    		else {
    			sql = "select * from product order by product_no";
    		}
    	}
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
    	rs.close();
    	disconnectDB();
    	return productlist;
    }
}
