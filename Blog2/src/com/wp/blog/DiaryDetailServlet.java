package com.wp.blog;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DiaryDetailServlet
 */
@WebServlet("/diary/detaildiary")
public class DiaryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryDetailServlet() {
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
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
		try {
			DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
			Map<String, String> detaildiarylist = diarydao.getDiaryListByTitle(title, true);
			if(detaildiarylist != null) {
				session.setAttribute("detaildiarylist", detaildiarylist);
				viewName = "diary.jsp?page=2";
			}
			else {
				g.jsmessage("Null Error");
			}
			
		}catch(Exception e) {
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
