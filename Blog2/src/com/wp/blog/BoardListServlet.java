package com.wp.blog;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardlist.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
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
		String access= request.getParameter("access");
		String viewName = null;
		try {
			ServletContext application = request.getSession().getServletContext();
	    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	    String db_url = application.getInitParameter("db_url");
	  	    String db_id = application.getInitParameter("db_userid");
	  	    String db_pw = application.getInitParameter("db_password");  
	  	    BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
			List<BoardDO> boardlist = null;
			Global g = new Global(response);
			try {
				boardlist = boarddao.getBoardList();
				if(boardlist != null){
					request.setAttribute("boardlist", boardlist);
					if(access.equals("admin")) {
						viewName = "main.do?page=3";
					}
					else if(access.equals("member")) {
						viewName = "main.do?page=5";
					}else {
						viewName = "main.do?page=4";
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
			    g.jsmessage(e.getMessage());
			}
			RequestDispatcher view = request.getRequestDispatcher(viewName);
		    view.forward(request, response);
		}catch(NullPointerException ne) {
			if(access.equals("admin")) {
				viewName = "main.do?page=3";
			}
			else if(access.equals("member")) {
				viewName = "main.do?page=5";
			}else {
				viewName = "main.do?page=4";
			}
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
