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
import com.wp.blog.DTO.ProductDO;

/**
 * Servlet implementation class ModifyProductServlet
 */
@WebServlet("/product/modifyproduct")
public class ModifyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String product_no = request.getParameter("product_no");
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
  	    			Map<String, String> productdetaillist = productdao.getProductListByNumber(product_no);
  	    			if(productdetaillist != null) {
  	    				session.setAttribute("productdetaillist", productdetaillist);
  	    				viewName = "product.jsp?page=4";
  	    			}
  	    			else {
  	    				g.jsmessage("Null Error");
  	    			}
  	    		}
  	    		else {
  	    			g.errorcode(3217);
  	    		}
  	    	}
  	    	else {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String product_no = request.getParameter("product_no");
		String product_name = request.getParameter("product_name");
		String buy_date = request.getParameter("buy_date");
		String buy_date_used = request.getParameter("buy_date_used");
		String purpose = request.getParameter("purpose");
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    try {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	    			ProductDO productdo = new ProductDO(product_no, product_name, buy_date, buy_date_used, purpose);
  	    			ProductDAO productdao = new ProductDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    			int result = productdao.updateProduct(productdo);
  	    			if(result == 1) {
  	    				viewName = "productlist?desc=0&columnname=product_no";
  	    			}
  	    			else {
  	    				g.jsmessage("Unknown Error Message");
  	    			}
  	    	}else {
  	    		g.errorcode(3217);
  	    	}
  	    	}
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    if(viewName != null) {
  	    	response.sendRedirect(viewName);
  	    }
	}

}
