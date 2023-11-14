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

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.BoardDAO;
import com.wp.blog.DTO.BoardDO;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board.do")
public class WriteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Global g = new Global(response);
		g.errorcode(403);
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
	    String id = (String)session.getAttribute("id"); 
	    //Parameters from HTML 
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String anonymous = request.getParameter("access");
		
		title = XssPreventer.escape(title); 
		content = XssPreventer.escape(content); 
		anonymous = XssPreventer.escape(anonymous);
		
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		
		//DataBase Connection String from HTML 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    
  	    String viewName = null;
  	    int number = 0;
			try {
				if(id != null) {
					if(id.equals("admin")) {
						BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
					    number = boarddao.MaxBoardNumber() + 1;
						BoardDO boarddo = new BoardDO(number, title, id, content, savedate, savedate, anonymous, 0);
					    int result = boarddao.insertBoard(boarddo);
					    if(result == 1) {
					    	viewName = "boardlist.do"; 
						}
						else {
							g.jsmessage("Unknown Error Message");
						}
					}
					else {
						session.invalidate(); 
						g.errorcode(3217);
					}
				}
			  
			} catch (Exception e) {
				// TODO Auto-generated catch block
				g.jsmessage(e.getMessage());
			}
			if(viewName != null) {
				response.sendRedirect(viewName);
			}
	}

}
