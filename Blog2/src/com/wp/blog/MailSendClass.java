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
    	//현재는 구글 메일서버(vheh1936@gmail.com)를 사용하도록 되어있음.
    	
    	Properties p = new  Properties();
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.auth",  "true");
		p.put("mail.smtp.debug",  "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		//p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); //Change TLS Protocol Version to 1.2 
        //I typed this code because JavaMail 1.4.7 doesn't support TLS1.2, But OpenJDK 11 only supports TLS1.2 or higher. 
		//JDK 8 support old TLS Version. But using old TLS version is dangerous for security reason.  
		
		Authenticator auth = new SMTPAuthenticator(request);
		
		Session session = Session.getInstance(p, auth); 

		Message message = new MimeMessage(session);
		
		message.setSubject(title); //제목 
		
		Address fromAddr = new InternetAddress("vheh1936@gmail.com");
		
		message.setFrom(fromAddr); //보내는 사람 
		
		Address toAddr = new InternetAddress(mailaddress);
		
		message.addRecipient(Message.RecipientType.TO, toAddr); //받는 사람
		
		message.setContent(content, "text/html;charset=UTF-8");
		
		Transport.send(message);
    }
}
