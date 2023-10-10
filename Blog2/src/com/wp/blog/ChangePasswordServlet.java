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
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/changepassword.do")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		
		String viewName = null;
		Global g = new Global(response);
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id"); //로그인한 아이디 (세션) 
		
		//Parameters from HTML
		String currentpassword = request.getParameter("currentpassword"); //현재 비밀번호 
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword"); 
		
		String hash_password = BCrypt.hashpw(password, BCrypt.gensalt(12)); //BCrypt HASH
		
		//DB Connection information from web.xml
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	  
  	    try
  	    {
  	    	Map<String, String> memberlist = memberdao.getMemberById(id); 
  	    	
  	    	String bcrypt_password = memberlist.get("password"); //데이터베이스에 저장된 암호화된 비밀번호(BCrypt) 
  	    	
  	    	if(BCrypt.checkpw(currentpassword, bcrypt_password))
  	    	{
  	    		if(password.equals(cpassword))
  	  	    	{
  	  	  	    	int result = memberdao.UpdateMemberPassword(id, hash_password); 
  	  	  	    	
  	  	  	    	if(result != 0)
  	  	  	    	{
  	  	  	    		g.jsmessage("Successfully changed.");
  	  	  	    		session.invalidate(); //로그아웃(세션 비활성화) 
  	  	  	    		viewName = "main.do"; 
  	  	  	    	}
  	  	    	}
  	  	    	else
  	  	    	{
  	  	    		g.jsmessage("Password and Password Confirmed is not same!");
  	  	    	}
  	    	}
  	    	else
  	    	{
  	    		g.jsmessage("Current Password is wrong."); 
  	    	}
  	    }
  	    catch(Exception ex)
  	    {
  	    	g.jsmessage(ex.getMessage()); 
  	    }
  	    
  	    if(viewName != null)
  	    {
  	    	response.sendRedirect(viewName);
  	    }
  	    else
  	    {
  	    	g.jsmessage("Error During Changing Password.");
  	    }
	}

}
