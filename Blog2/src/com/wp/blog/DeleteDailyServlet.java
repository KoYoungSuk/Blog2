package com.wp.blog;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.DailyDAO;

/**
 * Servlet implementation class DeleteDailyServlet
 */
@WebServlet("/daily/deletedaily")
public class DeleteDailyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDailyServlet() {
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
		HttpSession session = request.getSession();
		String viewName = null;
		Global g = new Global(response);
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
			if(id != null)
			{
				if(id.equals("admin")) //관리자 계정으로만 일정정보 삭제가능 
				{
					DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw); 
					Map<String, String > dailylist = dailydao.getDetailDailyList(title, true); 
					
					if(dailylist != null) {
						session.setAttribute("detaildailylist", dailylist);
						viewName = "daily.jsp?page=5"; 
					}
					else {
						g.jsmessage("Null Error Message"); 
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
		HttpSession session = request.getSession();
		String viewName = null;
		Global g = new Global(response);
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
			if(id != null)
			{
				if(id.equals("admin")) //관리자 계정으로만 일정정보 삭제가능 
				{
					DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw); 
					int result = dailydao.deleteDailyInfo(title); 
					if(result != 0)
					{
						viewName = "daily_new.jsp"; 
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
