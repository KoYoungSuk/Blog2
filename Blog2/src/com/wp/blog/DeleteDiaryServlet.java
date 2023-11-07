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

import com.wp.blog.DAO.DiaryDAO;

/**
 * Servlet implementation class DeleteDiaryServlet
 */
@WebServlet("/diary/deletediary")
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
	   HttpSession session = request.getSession();
	   String id = (String)session.getAttribute("id");
	   
	   //DataBase Connection String from web.xml 
	   ServletContext application = request.getSession().getServletContext();
   	   String JDBC_Driver = application.getInitParameter("jdbc_driver");
 	   String db_url = application.getInitParameter("db_url");
 	   String db_id = application.getInitParameter("db_userid");
 	   String db_pw = application.getInitParameter("db_password");
 	   
	   Global g = new Global(response);
	   String viewName = null;
	   try {
		  if(id != null) {
			  if(id.equals("admin")) {
				  DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
				  Map<String, String> diarylist = diarydao.getDiaryListByTitle(title, false);
				  if(diarylist != null) {
					  session.setAttribute("detaildiarylist", diarylist);
					  viewName = "diary.jsp?page=5";
				  }
				  else {
					  g.jsmessage("Null Error");
				  }
			  }
			  else {
				  session.invalidate(); 
				  g.errorcode(3217);
			  }
		  }
		  else {
			  session.invalidate(); 
			  g.errorcode(3217);
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
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id"); 
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
	   	String JDBC_Driver = application.getInitParameter("jdbc_driver");
	 	String db_url = application.getInitParameter("db_url");
	 	String db_id = application.getInitParameter("db_userid");
	 	String db_pw = application.getInitParameter("db_password");
	 	
	 	Global g = new Global(response);
	 	String viewName = null;
	 	try {
	 		if(id.equals("admin")) //관리자 권한으로만 일기장 삭제가능 
	 		{
	 			DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
		 		int result = diarydao.deleteDiary(title);
		 		if(result == 1) {
		 			String serverpath = "/mnt/hdd3/Secret Documents/Diary/Before 2020-07/" + title + ".txt";
		 			
		 			g.deleteSFTP(serverpath, request); //SFTP 서버 파일 삭제
		 			
		 			session.removeAttribute("detaildiarylist");
		 			viewName = "diarylist";
		 		}
		 		else {
		 			g.jsmessage("Unknown Error Message");
		 		}
	 		}
	 		else
	 		{
	 			session.invalidate(); 
	 			g.errorcode(3217);
	 		}
	 	}catch(Exception e) {
	 		g.jsmessage(e.getMessage());
	 	}
	 	if(viewName != null) {
	 		response.sendRedirect(viewName);
	 	}
	}

}
