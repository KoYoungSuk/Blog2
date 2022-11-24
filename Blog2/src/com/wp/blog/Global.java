package com.wp.blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wp.blog.DAO.LogDAO;
import com.wp.blog.DTO.LogDO;

public class Global {

	HttpServletResponse response;
	public Global(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
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
	
	public String getIp(HttpServletRequest request){
	    	  String ip = null;

	          ip = request.getHeader("X-Forwarded-For");
	          
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("Proxy-Client-IP"); 
	          } 
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("WL-Proxy-Client-IP"); 
	          } 
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("HTTP_CLIENT_IP"); 
	          } 
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
	          }
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("X-Real-IP"); 
	          }
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("X-RealIP"); 
	          }
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getHeader("REMOTE_ADDR");
	          }
	          if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	              ip = request.getRemoteAddr(); 
	          }
	  		
	  		return ip;
	}
	
    public void setLog(String db_driver, String db_url, String db_id, String db_pw, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	Global g = new Global(response);
    	try
    	{
    		LogDAO logdao = new LogDAO(db_driver, db_url, db_id, db_pw);
    		int logno = 0; 
    		Timestamp ltime = new Timestamp(System.currentTimeMillis());
    		String comip = getIp(request); 
    		String comnm = InetAddress.getLocalHost().getHostName(); 
    		String clientos = request.getHeader("USER-AGENT");
    		String serveros = System.getProperty("os.name");
    		int maxnumber = logdao.getMaxLogno();
    		logno = maxnumber + 1;
    		LogDO logdo = new LogDO(logno, ltime, comip, comnm, clientos, serveros);
    		int result = logdao.insertLog(logdo);
    		System.out.println("result: " + result); 
    		if(result == 0)
    		{
    			g.jsmessage("Unknown Error Message");
    		}
    	}
    	catch(Exception ex)
    	{
			g.jsmessage(ex.getMessage());
    	}
    }
}
