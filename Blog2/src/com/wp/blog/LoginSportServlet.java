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
 * Servlet implementation class LoginSportServlet
 */
@WebServlet("/sport/sportlogin")
public class LoginSportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSportServlet() {
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
	    Global g = new Global(response);
	    HttpSession session = request.getSession(); 
	    String viewName = null;
	    
	    //DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	    String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
	    String db_pw = application.getInitParameter("db_password");
	    	    
	    //Parameters from HTML
	    String id = request.getParameter("id");
	    String password = request.getParameter("password");
	    
	    try {
	    	if(id != null) {
	    		if(id.equals("admin")) {
	    			MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
	    			Map<String, String> memberlist = memberdao.getMemberById(id);
	    			if(memberlist != null) {
	    				String password_db = memberlist.get("password");
	    				if(BCrypt.checkpw(password, password_db)) {
	    					session.setAttribute("id", id);
	    					session.setAttribute("firstname", memberlist.get("firstname"));
	    					session.setAttribute("lastname", memberlist.get("lastname"));
	    					session.setAttribute("birthday", memberlist.get("birthday")); 
	    					viewName = "sport2.jsp"; 
	    				}
	    			}
	    		}
	    	}
	    }
	    catch(Exception ex) {
	    	g.jsmessage(ex.getMessage());
	    }
	    
	    if(viewName != null) {
	    	response.sendRedirect(viewName);
	    }
	    else {
	    	g.jsmessage("아이디 및 비밀번호가 올바르지 않습니다.");
	    }
	}

}
