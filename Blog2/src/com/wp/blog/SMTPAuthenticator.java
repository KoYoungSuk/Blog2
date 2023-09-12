package com.wp.blog;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class SMTPAuthenticator extends Authenticator{

	HttpServletRequest request;
	
	public SMTPAuthenticator(HttpServletRequest request)
	{
		this.request = request; 
	}
	
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    	
    	//web.xml에서 메일 계정 아이디 및 비밀번호 불러오기 
    	ServletContext application = request.getSession().getServletContext();
    	
    	String id = application.getInitParameter("mail_id");
    	String password = application.getInitParameter("mail_password"); 
    	
    	//System.out.println("password: " + password); 
        return new PasswordAuthentication(id, password);
    }
}