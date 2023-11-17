package com.wp.blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class Global {

	HttpServletResponse response;
	
	public Global(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");  //UTF-8 
		this.response = response;
	}
	
	//자바스크립트 메시지 
	public void jsmessage(String message) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(message != null) {
			out.println("alert('" + message.replace('\n', ' ') + "');");
		}
		else {
			out.println("alert('Null Error')"); 
		}
		out.println("history.go(-1);");
		out.println("</script>");
	}
	
	
	public void errorcode(int code) throws IOException {
		response.sendError(code);
	}
	
	//SFTP 서버 업로드  
	public void UploadSFTP(String localpath, String serverpath, HttpServletRequest request) throws JSchException, SftpException
	{
		JSch jsch = new JSch();
		
		ServletContext application = request.getSession().getServletContext();
    	String address = application.getInitParameter("sftp_address");
  	    String id = application.getInitParameter("sftp_id");
  	    String password = application.getInitParameter("sftp_pw"); 
  	    
		int port = 22;
		
		Session session = jsch.getSession(id, address, port);
		session.setPassword(password);
		
	    Properties config = new Properties();
	    config.put("StrictHostKeyChecking", "no");
	    session.setConfig(config);
	    
	    session.connect();
	    
	    ChannelSftp channelsftp = null;
	    Channel channel = null;
	    
	    channel = session.openChannel("sftp");
	    channel.connect();
	    
	    channelsftp = (ChannelSftp) channel;
	    channelsftp.put(localpath, serverpath); 
	    
	    channelsftp.disconnect();
	    channel.disconnect();
	    session.disconnect(); 
	}
	
	//SFTP 파일 삭제 
	public void deleteSFTP(String serverpath, HttpServletRequest request) throws JSchException, SftpException{
		JSch jsch = new JSch();
		
		ServletContext application = request.getSession().getServletContext();
    	String address = application.getInitParameter("sftp_address");
  	    String id = application.getInitParameter("sftp_id");
  	    String password = application.getInitParameter("sftp_pw"); 
  	    int port = 22; 
  	    
		Session session = jsch.getSession(id, address, port);
		session.setPassword(password);
		
		Properties config = new Properties();
		config.put("StrictHostKeyChecking", "no");
		session.setConfig(config);
		    
	    session.connect();
		    
		ChannelSftp channelsftp = null;
	    Channel channel = null;
		    
		channel = session.openChannel("sftp");
	    channel.connect();
	    
	    channelsftp = (ChannelSftp) channel;
	    channelsftp.rm(serverpath);
	    channel.disconnect();
	    session.disconnect(); 
	    
	}
	
}
