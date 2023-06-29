package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.SwitchDAO;
import com.wp.blog.DTO.SwitchDO;

/**
 * Servlet implementation class SwitchServlet
 */
@WebServlet("/Switch/switchtoggle")
public class SwitchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SwitchServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession(); 
		String switchstatus = request.getParameter("switchstatus"); 
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    
  	    try
  	    {
  	         SwitchDAO switchdao = new SwitchDAO(JDBC_Driver, db_url, db_id, db_pw);
  	         
  	         int maxnum = switchdao.getMaxNum();
  	         
  	         SwitchDO switchdo = new SwitchDO(maxnum + 1, switchstatus, savedate, null);
  	         
  	         int result = switchdao.insertSwitch(switchdo);
  	         
  	         if(result != 0)
  	         {
  	        	 viewName = "index.jsp"; 
  	        	 session.setAttribute("switchstatus", switchstatus); 
  	         }
  	         else
  	         {
  	        	 g.jsmessage("Unknown Error Message");
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

}
