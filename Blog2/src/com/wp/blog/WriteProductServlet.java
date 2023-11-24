package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.ProductDAO;
import com.wp.blog.DTO.ProductDO;

/**
 * Servlet implementation class WriteProductServlet
 */
@WebServlet("/product/writeproduct")
public class WriteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Global g = new Global(response);
		g.errorcode(403);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		
		//Parameters from HTML 
		String id = (String)session.getAttribute("id");
		String product_name = request.getParameter("product_name");
		String buy_date = request.getParameter("buy_date");
		String buy_date_used = request.getParameter("buy_date_used");
		String purpose = request.getParameter("purpose");
		String types = request.getParameter("Types"); 
		//XSS Filtering By Lucy XSS Preventer. 
		
		product_name = XssPreventer.escape(product_name);
		buy_date = XssPreventer.escape(buy_date);
		buy_date_used = XssPreventer.escape(buy_date_used);
		purpose = XssPreventer.escape(purpose); 
		types = XssPreventer.escape(types);
		
		String types_inital = null; 
		
		switch(types) {
		case "Electronics": //가전제품 
			types_inital = "E";
			break;
		case "IT": //IT 
			types_inital = "I";
			break;
		case "Vehicle": //자동차 
			types_inital = "V";
			break;
		case "ETC": //기타 
			types_inital = "M";
			break; 
		default:
			break; 
		}
		
		
		//DataBase Connection Information from web.xml 
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
  	    			
  	    			int num = 0;
  	    			
  	    			String product_no_max = productdao.getMaxProductNumber(types_inital + "-" + buy_date); //앞에 있는 구분 문자에 맞추어서 최대 번호 가져오기 
  	    			
  	    			if(product_no_max != null) {
  	    				String[] product_no_max_arr = product_no_max.split("-");
  	    				num = Integer.parseInt(product_no_max_arr[product_no_max_arr.length - 1]); //마지막꺼 
  	    			}
  	    			
  	    			num = num + 1; 
  	                
  	    			String product_no = types_inital + "-" + buy_date + "-" + num; //For Example: I-2023-01-01-1 
  	    			
  	    			ProductDO productdo = new ProductDO(product_no, product_name, buy_date, buy_date_used, purpose);
  	    			
  	    			int result = productdao.insertProduct(productdo);
  	    			if(result == 1) {
  	    				viewName = "productlist";
  	    			}
  	    			else {
  	    				g.jsmessage("Unknown Error Message");
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
			response.sendRedirect(viewName);
		}
	}

}
