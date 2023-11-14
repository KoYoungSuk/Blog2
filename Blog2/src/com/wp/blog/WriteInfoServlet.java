package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.InfoDAO;
import com.wp.blog.DTO.InfoDO;

/**
 * Servlet implementation class WriteInfoServlet
 */
@WebServlet("/info/writeinfo")
public class WriteInfoServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Global g = new Global(response);
		String id = (String)session.getAttribute("id");
		//Parameters from HTML 
		String title = request.getParameter("title");
		String content = request.getParameter("content"); 
		title = XssPreventer.escape(title); 
		content = XssPreventer.escape(content);
		
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		ServletContext application = request.getSession().getServletContext();
		
		//DataBase Connection String from web.xml 
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    try
  	    {
  	    	if(id != null)
  	    	{
  	    		if(id.equals("admin")) //관리자 모드 
  	    		{
  	    			InfoDO infodo = new InfoDO(title, content, savedate, null);
  	    			InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    			
  	    			int result = infodao.insertInfo(infodo);
  	    			if(result != 0)
  	    			{
  	    				viewName = "info_new.jsp"; 
  	    			}
  	    			else
  	    			{
  	    				g.jsmessage("Unknown Error Message"); 
  	    			}
  	    		}
  	    		else
  	    		{
  	    			session.invalidate(); 
  	    			g.errorcode(3217); 
  	    		}
  	    	}
  	    	else
  	    	{
  	    		session.invalidate(); 
  	    		g.errorcode(3217);
  	    	}
  	    }
  	    catch(Exception e)
  	    {
  	    	g.jsmessage(e.getMessage());
  	    }
  	    
  	    if(viewName != null)
  	    {
  	    	response.sendRedirect(viewName);
  	    }
	}

}
