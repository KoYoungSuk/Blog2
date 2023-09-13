package com.wp.blog;

import java.io.IOException;
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
		
		//HTML로부터 파라미터 가져오기 
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String birthday = request.getParameter("birthday");
		String mailaddress = request.getParameter("mailaddress"); 
		
		//비밀번호 암호화 (BCrypt HASH 함수) 
		String password_hass = BCrypt.hashpw(password, BCrypt.gensalt(12));
		//현재 날짜 (Timestamp) 
		Timestamp joindate = new Timestamp(System.currentTimeMillis());
		
		//WEB.XML에서 데이터베이스 연결정보 가져오기 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    
  	    MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    
  	  
  	    try
  	    {
  	    	int emailnum = memberdao.CheckDuplicatedEMail(mailaddress);
  	    	
  	    	if(emailnum != 0) //이메일 주소 중복 검사 
  	    	{
  	    		g.jsmessage("Duplicated EMail Address Found!"); 
  	    	}
  	    	else
  	    	{
  	    		if(!password.equals(cpassword)){ //비밀번호와 비밀번호 확인이 일치한지 검사 
  	  	  	   	    g.jsmessage("Password and Password Confirmed are not same");
  	  	  	  	}
  	  	  	  	else{
  	  	  	  	    	
  	  	  	  	  	MemberDO memberdo = new MemberDO(id, password_hass, firstname, lastname, birthday, joindate, mailaddress);
  	  	  	  	  	    	
  	  	  		    int result = memberdao.insertMembers(memberdo); //회원 정보 데이터베이스에 입력 
  	  	  		    if(result != 0)
  	  	  			{
  	  	  			    viewName="main.do?page=1";
  	  	  		    }
  	  	  		    else 
  	  	  		    {
  	  	  				g.jsmessage( "Unknown Error Message");
  	  	  		    }
  	  	  	   }
  	    	}
  	    	
  	    }
  	    catch(Exception e)
  	    {
  	    	g.jsmessage(e.getMessage());
  	    }
  	   
  	   
  	    if(viewName != null)
  	    {
  	    	 response.sendRedirect(viewName);
  	    }
  	    else
  	    {
  	    	 g.jsmessage("Signup Error. "); 
  	    }
	}

}
