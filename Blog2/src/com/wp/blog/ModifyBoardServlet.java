package com.wp.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyBoardServlet
 */
@WebServlet("/modifyboard.do")
public class ModifyBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String number = request.getParameter("serial");
		HttpSession session = request.getSession();
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	String db_url = application.getInitParameter("db_url");
	  	String db_id = application.getInitParameter("db_userid");
	  	String db_pw = application.getInitParameter("db_password");
		Global g = new Global(response);
		try {
		  BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
		  List<String> totalboardlist = boarddao.getBoardByNum(Integer.parseInt(number), false, false);
		  session.setAttribute("totalboardlist", totalboardlist);
		  RequestDispatcher view = request.getRequestDispatcher("main.do?page=17");
		  view.forward(request, response);
		}catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 Global g = new Global(response);
		 ServletContext application = request.getSession().getServletContext();
		 String number = request.getParameter("number");
		 String id = request.getParameter("userid");
		 String title = request.getParameter("title");
		 String content = request.getParameter("content");
		 String access = request.getParameter("access");
	     String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	 String db_url = application.getInitParameter("db_url");
	  	 String db_id = application.getInitParameter("db_userid");
	  	 String db_pw = application.getInitParameter("db_password");
	  	 String viewName = null;
	  	 Timestamp modifydate = new Timestamp(System.currentTimeMillis());
	  	 BoardDO boarddo = new BoardDO(Integer.parseInt(number), title, id, content, null, modifydate, access, 0);
	  	 BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
	  	 try {
			int result = boarddao.UpdateBoard(boarddo, false);
			if(result == 1){
				viewName = "maintest.jsp";
			}
			else{
				g.jsmessage("Unknown Error Message");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	  	if(viewName != null){
			response.sendRedirect(viewName);
		} 
	}
}
