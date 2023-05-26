package com.wp.blog;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Properties;

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
	public void jsmessage(String message) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('" + message.replace('\n', ' ') + "');");
		out.println("history.go(-1);");
		out.println("</script>");
	}
	public void errorcode(int code) throws IOException {
		response.sendError(code);
	}
	
	public void UploadSFTP(String localpath, String serverpath) throws JSchException, SftpException
	{
		JSch jsch = new JSch();
		
		String address = "192.168.55.126";
		String id = "kys";
		String password = "PASSWORD CENSORED";
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
	
	
}
