package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wp.blog.DAO.BoardDAO;

/**
 * Servlet implementation class SearchTitleServlet
 */
@WebServlet("/searchtitle.do")
public class SearchTitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @seetpServlet#HttpServlet()
     */
    public SearchTitleServlet() {
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
		String title = request.getParameter("searchtitle");
		Global g = new Global(response);
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");  
		String viewName = "detailboard.do?serial=";
		Boolean notnull = false;
		try {
		   BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
		   int number = boarddao.getBoardNumber(title);
		   viewName = viewName + number;
		   notnull = true;
		}catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		if(notnull) {
			response.sendRedirect(viewName);
		}
		else {
			g.jsmessage("Error");
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
