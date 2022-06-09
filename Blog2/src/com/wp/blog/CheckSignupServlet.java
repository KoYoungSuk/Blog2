package com.wp.blog;

import java.io.IOException;

import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import com.wp.blog.DAO.MemberDAO;
import com.wp.blog.DTO.MemberDO;

/**
 * Servlet implementation class CheckSignupServlet
 */
@WebServlet("/checksignup.do")
public class CheckSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckSignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String birthday = request.getParameter("birthday");
		String password_hass = BCrypt.hashpw(password, BCrypt.gensalt(12));
		Timestamp joindate = new Timestamp(System.currentTimeMillis());
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    try {
  	   	    if(!password.equals(cpassword)){
  	   	    	g.jsmessage("Password and Password Confirmed are not same");
  	  	    }
  	  	    else{
  	  	    	MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	  	  	    MemberDO memberdo = new MemberDO(id, password_hass, firstname, lastname, birthday, joindate);
  	  	  	    try{
  					int result = memberdao.insertMembers(memberdo);
  					if(result == 1){
  						viewName="maintest.jsp";
  					}
  					else {
  						g.jsmessage( "Unknown Error Message");
  					}
  				} catch (ClassNotFoundException e) {
  					g.jsmessage(e.getMessage());
  				} catch (SQLException e) {
  					g.jsmessage(e.getMessage());
  				}
  	  	    }
  	    }catch(NullPointerException e)
  	    {
  	    	g.jsmessage("Null Error");
  	    }
  	   
  	    if(viewName != null)
  	    {
  	    	 response.sendRedirect(viewName);
  	    }
	}

}
