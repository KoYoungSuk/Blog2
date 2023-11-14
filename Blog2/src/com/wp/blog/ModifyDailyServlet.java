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
import com.wp.blog.DAO.DailyDAO;
import com.wp.blog.DTO.DailyDO;

/**
 * Servlet implementation class ModifyDailyServlet
 */
@WebServlet("/daily/modifydaily")
public class ModifyDailyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyDailyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String viewName = null;
		String id = (String)session.getAttribute("id");
	
		String title = request.getParameter("title"); 
		Global g = new Global(response);
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		try
		{
			DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw);
			
			if(id != null)
			{
				if(id.equals("admin")) //관리자 모드일때만 일정 정보 수정가능
				{
					Map<String, String> dailylist = dailydao.getDetailDailyList(title, false); 
					if(dailylist != null)
					{
						session.setAttribute("detaildailylist", dailylist);
						viewName = "daily.jsp?page=4"; 
					}
					else
					{
						g.jsmessage("Null Error");
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
			RequestDispatcher view = request.getRequestDispatcher(viewName);
  			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String viewName = null;
		String id = (String)session.getAttribute("id");
		
		//Parameters from HTML 
		String title = request.getParameter("title"); 
		String content = request.getParameter("content");  
		String status = request.getParameter("status");
		
		content = XssPreventer.escape(content); 
		status = XssPreventer.escape(status);
		
		Timestamp modifydate = new Timestamp(System.currentTimeMillis());
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		Global g = new Global(response);
		
		try
		{
			DailyDO dailydo = new DailyDO(title, content, status, null, null, modifydate);
            DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw);
            
            if(id != null)
            {
                if(id.equals("admin")) //관리자 계정에서만 일정 정보 수정가능 
                {
                	 int result = dailydao.updateDailyInfo(dailydo);
                     
                     if(result != 0)
                     {
                     	viewName = "daily_new.jsp";
                     }
                     else
                     {
                     	g.jsmessage("Unknown Error Message");
                     }
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
