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
 * Servlet implementation class DiaryListServlet
 */
@WebServlet("/diary/diarylogin")
public class DiaryLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryLoginServlet() {
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
		session.removeAttribute("id");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    Boolean check = false;
  	    try {
  	       MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	       List<MemberDO> memberlist = memberdao.getMemberList();
  	       for(MemberDO memberdo : memberlist) {
  	    	   if(id.equals(memberdo.getId())) {
  	    		   if(id.equals("admin")) {
  	    			  if(BCrypt.checkpw(password, memberdo.getPassword())) {
  	  	    			   session.setAttribute("id", id);
  	  	    			   viewName = "diarylist?desc=0";
  	  	    			   check = true;
  	  	    			   break;
  	  	    		   }
  	    		   }
  	    	   }
  	       }
  	       if(viewName != null && check) {
  	          response.sendRedirect(viewName);
  	       }
  	       else {
  	    	  g.jsmessage("ID and Password is not confirmed and this is administrator only!");
  	       }
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
	}

}
