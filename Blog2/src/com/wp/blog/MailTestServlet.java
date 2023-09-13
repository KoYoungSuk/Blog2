package com.wp.blog;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailTestServlet
 */
@WebServlet("/sendmail.do")
public class MailTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailTestServlet() {
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
		
		//Parameters from HTML
		String from = "vheh5678@naver.com"; //보내는 주소 (일단 네이버 메일임) 
		String to = request.getParameter("to"); //받는 주소 
		String title = request.getParameter("title");
		String content = request.getParameter("content"); 
		
		try
		{
	
			Properties p = new  Properties();
			p.put("mail.smtp.host", "smtp.naver.com"); 
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.auth",  "true");
			p.put("mail.smtp.debug",  "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			/*
			p.put("mail.smtp.starttls.enable", "false"); 
		
			*/
			
			Authenticator auth = new SMTPAuthenticator(request);
			
		
			Session session = Session.getInstance(p, auth); 
			
			//Session session = Session.getDefaultInstance(p, null); 
			
			Message message = new MimeMessage(session);
			
			message.setSubject(title); //제목 
			
			Address fromAddr = new InternetAddress(from);
			
			message.setFrom(fromAddr); //보내는 사람 
			
			Address toAddr = new InternetAddress(to);
			
			message.addRecipient(Message.RecipientType.TO, toAddr); //받는 사람
			
			message.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(message);
			
			g.jsmessage("Successfully Transferred!");
	
		}
		catch(Exception e)
		{
			g.jsmessage(e.getMessage()); 
		}
	}

}
