package com.wp.blog;

import java.io.IOException;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.ProductDAO;

/**
 * Servlet implementation class DetailProductServlet
 */
@WebServlet("/product/detailproduct")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String product_no = (String)request.getParameter("product_no");
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    try {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	    			ProductDAO productdao = new ProductDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    		    Map<String, String> detailproductlist = productdao.getProductListByNumber(product_no);
  	    		    if(detailproductlist != null) {
  	    		    	String product_no_new = detailproductlist.get("product_no"); 
  	    		    	if(product_no_new != null) {
  	    		    		viewName = "product.jsp?page=2";
  	  	    		    	session.setAttribute("productdetaillist", detailproductlist);
  	    		    	}
  	    		    	else {
  	    		    		g.jsmessage("Product Information Not Found");
  	    		    	}
  	    		    }
  	    		    else {
  	    		    	g.jsmessage("Null Error");
  	    		    }
  	    		}
  	    		else {
  	    			session.invalidate(); 
  	    			g.errorcode(3217);
  	    		}
  	    	}
  	    	else {
  	    		session.invalidate(); 
  	    		g.errorcode(3217);
  	    	}
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    if(viewName != null) {
  	        RequestDispatcher view = request.getRequestDispatcher(viewName);
	 		view.forward(request, response);
  	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
