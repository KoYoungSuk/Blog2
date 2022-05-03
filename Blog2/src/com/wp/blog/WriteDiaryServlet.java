package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteDiaryServlet
 */
@WebServlet("/diary/writediary")
public class WriteDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteDiaryServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		String title = request.getParameter("title");
		String context = request.getParameter("context");
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		try {
		   DiaryDO diarydo = new DiaryDO(title, context, savedate, savedate);
		   DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
		   int rowsInserted = diarydao.insertDiary(diarydo);
		   if(rowsInserted == 0) {
			   response.sendRedirect("diarylist");
		   }
		   else {
			   g.jsmessage("Unknown Error Message"); 
		   }
		}catch(Exception e) {
			g.jsmessage(e.getMessage());
		}
	}

}
