package com.wp.blog;

import java.io.IOException;
import java.util.List;
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
import com.wp.blog.DTO.DailyDO;

/**
 * Servlet implementation class DetailDailyServlet
 */
@WebServlet("/daily/detaildaily")
public class DetailDailyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailDailyServlet() {
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
	    String title = request.getParameter("title");
	    String id = (String)session.getAttribute("id"); 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
	    try
	    {
	    	int title_size = title.length(); 
	    	DailyDAO dailydao = new DailyDAO(JDBC_Driver, db_url, db_id, db_pw); 
	    	if(id != null)
	    	{
	    		if(id.equals("admin"))
	    		{
	    			if(title_size >= 10) 
	    	    	{
	    	    		Map<String, String> dailylist = dailydao.getDetailDailyList(title, true); 
	    	    		if(dailylist != null)
	    	    		{
	    	    			session.setAttribute("dailydetaillist", dailylist); 
		    	    		viewName = "daily.jsp?page=2"; 
	    	    		}
	    	    		else
	    	    		{
	    	    			g.jsmessage("Null Error");
	    	    		}
	    	    	}
	    	    	else
	    	    	{
	    	    		List<DailyDO> dailylist = dailydao.searchDailyListByWord(title);
	    	    		if(dailylist != null)
	    	    		{
	    	    			session.setAttribute("totaldailylist", dailylist);
		    	    		viewName = "daily.jsp?page=1"; 
	    	    		}
	    	    		else
	    	    		{
	    	    			g.jsmessage("Null Error");
	    	    		}
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
		doGet(request, response); 
	}

}
