package com.wp.blog;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.wp.blog.DAO.MemberDAO;

/**
 * Servlet implementation class InfoLoginServlet
 */
@WebServlet("/info/infologin")
public class InfoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password"); 
		HttpSession session = request.getSession();
		Global g = new Global(response);
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String firstname = null;
  	    String lastname = null;
  	    String viewName = null;
  	    try {
  	    	MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	Map<String, String> memberlist = memberdao.getMemberById(id);
  	    	if(id.equals("admin")) {
  	    		String password_db = memberlist.get("password");
  	    		if(password_db != null)
  	    		{
  	    			if(BCrypt.checkpw(password, password_db)) {
  	  	    			firstname = memberlist.get("firstname");
  	  	    			lastname = memberlist.get("lastname");
  	  	    			viewName = "infolist";
  	  	    		}
  	    		}
  	    	}
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    if(firstname == null) {
  	    	firstname = "";
  	    }
  	    else if(lastname == null) {
  	    	lastname = "";
  	    }
  	    if(viewName != null) {
  	    	session.setAttribute("id", id);
  	    	session.setAttribute("firstname", firstname);
  	    	session.setAttribute("lastname", lastname);
  	    	session.setAttribute("fullname", firstname+lastname); 
  	    	response.sendRedirect(viewName);
  	    }
  	    else {
  	    	g.jsmessage("ID and Password are not confirmed and Administrator Only.");
  	    }
	}

}
