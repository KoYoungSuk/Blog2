package com.wp.blog;


import java.io.IOException;

import java.sql.SQLException;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.BoardDAO;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/deleteboard.do")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardServlet() {
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
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int number = Integer.parseInt(request.getParameter("serial"));
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		String viewName = null;
  	    try {
  	    	BoardDAO boardDAO = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	  	    		Map<String, String> totalboardlist = boardDAO.getBoardByNum(number, false, false);
  	  				session.setAttribute("totalboardlist", totalboardlist);
  	  				viewName = "main.do?page=20";
  	  	    	}
  	  	    	else {
  	  	    		session.invalidate();
  	  	    		g.errorcode(3217);
  	  	    	}
  	    	}
  	    	else {
  	    		session.invalidate();
  	    		g.errorcode(3217);
  	    	}
  	    	if(viewName != null) {
  	    		RequestDispatcher view = request.getRequestDispatcher(viewName);
  				view.forward(request, response);
  	    	}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
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
		HttpSession session = request.getSession();
		try {
		int number = Integer.parseInt(request.getParameter("number"));
		String id = (String)session.getAttribute("id");
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		BoardDAO boardDAO = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    String viewName = null;
  	    try {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	    			session.removeAttribute("totalboardlist"); 
  	  	    		int result = boardDAO.DeleteBoard(number);
  	  				if(result == 1) {
  	  				    viewName = "boardlist.do";
  	  				}else {
  	  					g.jsmessage("Unknown Error Message");
  	  				}
  	  	    	}
  	  	    	else {
  	  	    		session.invalidate(); 
  	  	    	    g.errorcode(3217);
  	  	    	}
  	    	}
  	    	else {
  	    		session.invalidate(); 
  	    		g.errorcode(3217);
  	    	}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
  	    if(viewName != null) {
  	    	response.sendRedirect(viewName);
  	    } }catch(NullPointerException e) {
  	        g.jsmessage(e.getMessage());
  	    }
	}

}
