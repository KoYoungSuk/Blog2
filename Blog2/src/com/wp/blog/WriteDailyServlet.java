package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.DailyDAO;
import com.wp.blog.DTO.DailyDO;

/**
 * Servlet implementation class WriteDailyServlet
 */
@WebServlet("/daily/writedaily")
public class WriteDailyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteDailyServlet() {
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
		Global g = new Global(response);
		HttpSession session = request.getSession(); 
		String viewName = null;
		String id = (String)session.getAttribute("id"); //세션에서 아이디 불러오기 
		String title = request.getParameter("title");
		String content = request.getParameter("content"); 
		String status = request.getParameter("status"); 
		Timestamp savedate = new Timestamp(System.currentTimeMillis()); //현재 날짜/시각 (Timestamp) 
		//START - 데이터베이스 연결 준비  
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    //END - 데이터베이스 연결 준비 
  	    try
  	    {
  	    	DailyDO dailydo = new DailyDO(title, content, status, null, savedate, savedate); 
  	    	DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	
  	    	if(id != null)
  	    	{
  	    		if(id.equals("admin")) //관리자만 사용가능 (세션 아이디가 admin인지 검사) 
  	    		{
  	    			int result = dailydao.insertDailyInfo(dailydo);
  	    			if(result != 0)
  	    			{
  	    				viewName = "dailylist"; 
  	    			}
  	    			else
  	    			{
  	    				g.jsmessage("Unknown Error Message."); 
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
