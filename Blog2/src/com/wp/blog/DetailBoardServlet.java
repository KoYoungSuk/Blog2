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
 * Servlet implementation class DetailBoardServlet
 */
@WebServlet("/detailboard.do")
public class DetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBoardServlet() {
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
		//HttpSession session = request.getSession();
		int number = Integer.parseInt(request.getParameter("number"));
		int clicks = Integer.parseInt(request.getParameter("clicks"));
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    clicks++;
  	    BoardDO boarddo = new BoardDO(number, null, null, null, null, null, null, clicks);
		BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
		String viewName = null;
		try {
			List<String> boardlist = boarddao.getBoardByNum(number, true); //<br> �±׸� �߰��Ѵ�. -> HTML ��Ű ������� 
			boarddao.UpdateBoard(boarddo, true);
			if(boardlist != null) {
				request.setAttribute("boardlist", boardlist);
				viewName = "main.do?page=14";
			}
			else {
				g.jsmessage("Null Error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
		if(viewName != null) {
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
