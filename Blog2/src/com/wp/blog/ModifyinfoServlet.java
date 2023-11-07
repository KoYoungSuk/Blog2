package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ModifyinfoServlet
 */
@WebServlet("/info/modifyinfo")
public class ModifyinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String viewName = null;
		Global g = new Global(response); 
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); 
		String title = request.getParameter("title");
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		try
		{
			InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
			
			Map<String, String> infolist = infodao.getInfoListByTitle(title, false);
			
			if(id != null)
			{
				if(id.equals("admin")) //관리자 모드 
				{
					if(infolist != null)
					{
						session.setAttribute("infodetaillist", infolist);
						viewName = "list.jsp?page=4";
					}
					else
					{
						g.jsmessage("Null Error");
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
			RequestDispatcher view = request.getRequestDispatcher(viewName);
 			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response); 
		String viewName = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); 
		String title = request.getParameter("title"); 
		String content = request.getParameter("content");
		content = XssPreventer.escape(content); 
		Timestamp modifydate = new Timestamp(System.currentTimeMillis());
		
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    try
  	    {
  	    	InfoDO infodo = new InfoDO(title, content, null, modifydate);
  	    	InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	int result = infodao.updateInfo(infodo);
  	    	
  	    	if(id !=  null)
  	    	{
  	    		if(id.equals("admin"))
  	    		{
  	    			if(result != 0)
  	    			{
  	    				viewName = "infolist"; 
  	    			}
  	    			else
  	    			{
  	    				g.jsmessage("Unknown Error Message");
  	    			}
  	    		}
  	    		else
  	    		{
  	    			g.errorcode(3217);
  	    		}
  	    	}
  	    	else
  	    	{
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
