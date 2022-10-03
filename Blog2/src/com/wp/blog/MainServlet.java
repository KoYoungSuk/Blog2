package com.wp.blog;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.BoardDAO;
import com.wp.blog.DAO.LogDAO;
import com.wp.blog.DTO.BoardDO;
import com.wp.blog.DTO.LogDO;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
    public String getIp(HttpServletRequest request)
    {
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
    		System.out.println("comip: " + comip);
    		System.out.println("comnm: " + comnm);
    		System.out.println("clientos: " + clientos);
    		System.out.println("serveros: " + serveros);
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
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String access = "admin";
		if(id == null) {
		   access = "anonymous";
		}
		else {
		   if(!id.equals("admin")) {
			   access = "member"; 
		   }
		}
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password"); 
  	    String viewName = null;
  	    try {
  	        setLog(JDBC_Driver, db_url, db_id, db_pw, request, response); 
  	    	BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	List<BoardDO> boardlist = boarddao.getBoardList(true);
  	    	List<BoardDO> newboardlist = new ArrayList<BoardDO>();
  	    	int count = 0;	    
  	    	for(BoardDO boarddo : boardlist) {
  	    		if(access.equals("admin")) {
  	    			count++;
  	    			newboardlist.add(boarddo);
  	    		}
  	    		else {
  	    			if(boarddo.getAnonymous().equals(access)) {
  	  	    			count++;
  	  	    			newboardlist.add(boarddo);
  	  	    		}
  	    		}
  	    		if(count == 10) {
  	    			break;
  	    		}
  	    	}
  	    	if(boardlist != null && newboardlist != null) {
  	    		session.setAttribute("access", access);
  	    		session.setAttribute("newboardlist", newboardlist);
  	    		viewName = "maintest.jsp";
  	    	}
  	    	else {
  	    		g.jsmessage("Null Error");
  	    	}
  	    }catch(Exception e) {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    if(viewName != null) {
  	    	RequestDispatcher view = request.getRequestDispatcher(viewName);
  		    view.forward(request, response);
  	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
