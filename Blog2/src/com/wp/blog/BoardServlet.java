package com.wp.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
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
		String userid = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String anonymous = request.getParameter("access");
		/* String content_html = content.replace("\r\n", "<br>");
		String content_html2 = content_html.replace("\n", "<br>"); */
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    int number = 0;
  	    //int number2 = 0;
			try {
			    BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
			    /* List<BoardDO> boardlist;
			  	List<Integer> seriallist = new ArrayList<Integer>(); 
			  	boardlist = boarddao.getBoardList(true);
				if(boardlist != null){
					for(BoardDO bdo : boardlist){
					 seriallist.add(bdo.getSerialnumber());
					 number2++;
			       }
				} */
				number = boarddao.MaxBoardNumber() + 1;
			  	BoardDO boarddo = new BoardDO(number, title, userid, content, savedate, savedate, anonymous, 0);
				int result = boarddao.insertBoard(boarddo);
				if(result == 1) {
					viewName = "boardlist.do";
				}
				else {
					g.jsmessage("Unknown Error Message");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				g.jsmessage(e.getMessage());
			}
			if(viewName != null) {
				response.sendRedirect(viewName);
			}
	}

}
