package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wp.blog.DAO.MemberDAO;

/**
 * Servlet implementation class FindIDServlet
 */
@WebServlet("/findid.do")
public class FindIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIDServlet() {
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
		String mailaddress = request.getParameter("mailaddress");
		
		//DB 연결 준비 START : WEB.XML에서 연결 정보 가져오기 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    //DB 연결 준비 END 
  	    
		MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
		
		try
		{
			String id = memberdao.FindID(mailaddress);
			
			if(id != null)
			{
			     MailSendClass ms = new MailSendClass(request);
			     
			     ms.sendMail(mailaddress, "Your ID: " + id, "This is Your ID. (home.yspersonal.com Find ID Function Test)"); //아이디 찾아서 메일로 보내기 
			     
			     g.jsmessage("I send your ID by email. (home.yspersonal.com Find ID Function Test)");
			}
			else
			{
				g.jsmessage("Error Message");
			}
			
		}
		catch(Exception ex)
		{
			g.jsmessage(ex.getMessage());
		}
	}

}
