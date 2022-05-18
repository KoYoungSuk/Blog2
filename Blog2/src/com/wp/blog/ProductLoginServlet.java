package com.wp.blog;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Servlet implementation class ProductLoginServlet
 */
@WebServlet("/product/productlogin")
public class ProductLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductLoginServlet() {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Global g = new Global(response);
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    Boolean check = false;
  	    String viewName = null;
  	    try {
  	    	MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	List<MemberDO> memberlist = memberdao.getMemberList();
  	    	if(memberlist != null) {
  	    		for(MemberDO memberdo : memberlist) {
  	  	    		if(memberdo.getId().equals(id)) {
  	  	    		   if(id.equals("admin")) {
                          if(BCrypt.checkpw(password, memberdo.getPassword())) {
  	  	    				  check = true;
  	  	    				  viewName = "productlist?desc=0&columnname=product_no";
  	  	    				  break;
  	  	    			  }
	    			   }
  	  	    		}
  	  	    	}
  	    	}
  	    	else {
  	    		g.jsmessage("Null Error");
  	    	}
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    if(viewName != null && check == true) {
  	    	session.setAttribute("id", id);
  	    	response.sendRedirect(viewName);
  	    }
  	    else {
  	    	g.jsmessage("ID and Password are not confirmed and Administrator Only.");
  	    }
	}

}
