package com.wp.blog;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class MailSendClass {
	
	HttpServletRequest request = null;
	
	public MailSendClass(HttpServletRequest request)
	{
		this.request = request; 
	}
    public void sendMail(String mailaddress, String content, String title) throws MessagingException
    {
    	//현재는 네이버 메일서버를 사용하도록 되어있음.
    	
    	Properties p = new  Properties();
		p.put("mail.smtp.host", "smtp.naver.com"); 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.auth",  "true");
		p.put("mail.smtp.debug",  "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		Authenticator auth = new SMTPAuthenticator(request);
		
	
		Session session = Session.getInstance(p, auth); 
		
		//Session session = Session.getDefaultInstance(p, null); 
		
		Message message = new MimeMessage(session);
		
		message.setSubject(title); //제목 
		
		Address fromAddr = new InternetAddress("vheh5678@naver.com");
		
		message.setFrom(fromAddr); //보내는 사람 
		
		Address toAddr = new InternetAddress(mailaddress);
		
		message.addRecipient(Message.RecipientType.TO, toAddr); //받는 사람
		
		message.setContent(content, "text/html;charset=UTF-8");
		
		Transport.send(message);
    }
}
