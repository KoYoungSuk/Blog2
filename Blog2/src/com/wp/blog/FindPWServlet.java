package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.mindrot.jbcrypt.BCrypt;

import com.wp.blog.DAO.MemberDAO;

/**
 * Servlet implementation class FindPWServlet
 */
@WebServlet("/findpw.do")
public class FindPWServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPWServlet() {
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
		
		//HTML에서 파라미터 가져오기
		String id = request.getParameter("id");
		String mailaddress = request.getParameter("mailaddress"); 
		
		//데이터베이스 연결 정보(web.xml)에서 가져왔음
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    try
  	    {
  	    	MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	
  	        String random_pw = RandomStringUtils.randomAlphanumeric(10); //10자리로 랜덤 비밀번호 생성
  	        
  	        String password_hash = BCrypt.hashpw(random_pw, BCrypt.gensalt(12)); //HASH
  	        
  	        int result = memberdao.UpdateMemberPassword2(id, password_hash, mailaddress); 
  	        
  	        if(result != 0)
  	        {
  	        	MailSendClass ms = new MailSendClass(request);
  	        	
  	        	ms.sendMail(mailaddress, "Your Password: " + random_pw, "This is Your Temporary Password. (home.yspersonal.com PW Find Function Test)");
  	        	
  	        	g.jsmessage("I send temporary password by email. (you need to change this after login)"); 
  	        }
  	        else
  	        {
  	        	g.jsmessage("Unknown Error Message.");
  	        }
  	    	
  	    }
  	    catch(Exception ex)
  	    {
  	    	g.jsmessage(ex.getMessage());
  	    }
	}

}
