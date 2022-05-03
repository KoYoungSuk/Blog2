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
 * Servlet implementation class DeleteDiaryServlet
 */
@WebServlet("/deletediary")
public class DeleteDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDiaryServlet() {
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
	   String title = request.getParameter("title");
	   ServletContext application = request.getSession().getServletContext();
   	   String JDBC_Driver = application.getInitParameter("jdbc_driver");
 	   String db_url = application.getInitParameter("db_url");
 	   String db_id = application.getInitParameter("db_userid");
 	   String db_pw = application.getInitParameter("db_password");
	   Global g = new Global(response);
	   String viewName = null;
	   try {
		  DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
		  List<String> diarylist = diarydao.getDiaryListByTitle(title);
		  if(diarylist != null) {
			  request.setAttribute("diarylist", diarylist);
			  viewName = "diary.jsp?page=5";
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		ServletContext application = request.getSession().getServletContext();
	   	String JDBC_Driver = application.getInitParameter("jdbc_driver");
	 	String db_url = application.getInitParameter("db_url");
	 	String db_id = application.getInitParameter("db_userid");
	 	String db_pw = application.getInitParameter("db_password");
	 	Global g = new Global(response);
	 	try {
	 		DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
	 		int result = diarydao.deleteDiary(title);
	 		if(result == 1) {
	 			response.sendRedirect("diary.jsp?page=1");
	 		}
	 		else {
	 			g.jsmessage("Unknown Error Message");
	 		}
	 	}catch(Exception e) {
	 		g.jsmessage(e.getMessage());
	 	}
	}

}
