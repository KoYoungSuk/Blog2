package com.wp.blog;

import java.io.IOException;

import java.util.List;

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
 * Servlet implementation class ProductManageServlet
 */
@WebServlet("/product/productlist")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
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
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		Global g = new Global(response);
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    String product_page_num_str = request.getParameter("page_num");
  	    String expand = request.getParameter("expand");
  	    
  	    int product_page_num =  1;
  	    if(product_page_num_str != null) {
  	    	product_page_num = Integer.parseInt(product_page_num_str); 
  	    }
  	    
  	    try {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	  	    		ProductDAO productdao = new ProductDAO(JDBC_Driver, db_url, db_id, db_pw);
  	  	  	    	List<ProductDO> totalproductlist = productdao.getProductTotalList();
  	  	  	    	int productnumber = productdao.getProductNumber();
  	  	  	    	int pagecount_product = productnumber / 10;
  	  	  	    	if(totalproductlist != null) {
  	  	  	    		viewName = "product.jsp?page=1";
  	  	  	  	        session.setAttribute("productnumber", productnumber);
	  	    		    session.setAttribute("totalproductlist", totalproductlist);
  	  	  	    		if(expand != null) {
  	  	  	    		   if(expand.equals("yes")) {
  	  	  	    		       session.setAttribute("pagecount_product", 1);
	  	  	    		       session.setAttribute("beginnumber_product",0);
						       session.setAttribute("endnumber_product", productnumber);
  	  	  	    		   }
  	  	  	    		}
  	  	  	    		else {
  	  	  	    		   session.setAttribute("pagecount_product", pagecount_product + 1);
  	  	  	    		   session.setAttribute("beginnumber_product", (product_page_num -1) * 10);
  	  	  	    	       session.setAttribute("endnumber_product", ((product_page_num - 1) * 10)  + 9); 
  	  	  	    		}
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
