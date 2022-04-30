package com.wp.blog;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int number = Integer.parseInt(request.getParameter("number"));
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		BoardDAO boardDAO = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    try {
			List<String> boardlist = boardDAO.getBoardByNum(number, false);
			request.setAttribute("boardlist", boardlist);
			RequestDispatcher view = request.getRequestDispatcher("main.do?page=20");
			view.forward(request, response);
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
		try {
		int number = Integer.parseInt(request.getParameter("number"));
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		BoardDAO boardDAO = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    String viewName = null;
  	    try {
			int result = boardDAO.DeleteBoard(number);
			if(result == 1) {
			viewName = "boardlist.do?access=admin";
			}else {
				g.jsmessage("Unknown Error Message");
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
