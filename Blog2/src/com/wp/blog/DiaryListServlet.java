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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DiaryListServlet
 */
@WebServlet("/diary/diarylist")
public class DiaryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryListServlet() {
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
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null;
  	    try {
  	    	DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	List<DiaryDO> diarylist = diarydao.getDiaryList();
  	    	int diarynumber = diarydao.getDiarynumber();
  	    	if(diarylist != null) {
  	    		viewName = "diary.jsp?page=1";
  	    		session.setAttribute("diarylist", diarylist);
  	    		session.setAttribute("diarynumber", diarynumber);
  	    	}
  	    	else {
  	    		g.jsmessage("Null Error");
  	    	}
  	    }catch(Exception ex) {
  	    	g.jsmessage(ex.getMessage());
  	    }
  	    if(viewName != null) {
  	    	RequestDispatcher view = request.getRequestDispatcher("diary.jsp?page=1");
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
