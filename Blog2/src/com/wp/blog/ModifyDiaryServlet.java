package com.wp.blog;

import java.io.IOException;

import java.sql.Timestamp;
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
import com.wp.blog.DTO.DiaryDO;

/**
 * Servlet implementation class ModifyDiaryServlet
 */
@WebServlet("/diary/modifydiary")
public class ModifyDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyDiaryServlet() {
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
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		Global g = new Global(response);
		String viewName = null;
		try {
		   DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
		   if(id != null) {
			   if(id.equals("admin")) { //관리자 모드일때만 일기장 수정 가능 
				   Map<String, String> detaildiarylist = diarydao.getDiaryListByTitle(title, false);
				   if(detaildiarylist != null) {
					   session.setAttribute("detaildiarylist", detaildiarylist);
					   viewName = "diary.jsp?page=4";
				   }
				   else {
					   g.jsmessage("Null Error");
				   }
			   }
			   else {
				   g.errorcode(3217);
			   }
		   }
		   else {
			  g.errorcode(3217);
		   }
		}
		catch(Exception e) {
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
		HttpSession session = request.getSession();
		
		//Parameters from HTML 
		String title = request.getParameter("title");
		String content = request.getParameter("context");
		
		String id = (String)session.getAttribute("id");
		
		Timestamp modifydate = new Timestamp(System.currentTimeMillis());
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		Global g = new Global(response);
		String viewName = null;
		
		try {
		  if(id != null) {
			  if(id.equals("admin")) { //관리자 계정에서만 일기장 수정가능 
				  DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
			      DiaryDO diarydo = new DiaryDO(title, content, null, modifydate);
			      int result = diarydao.updateDiary(diarydo);
			      if(result == 1) {
			    	  viewName = "diarylist?desc=0";
			      }
			      else {
			    	  g.jsmessage("Unknown Error Message");
			      }
			  }
			  else {
				  g.errorcode(3217);
			  }
		  }
		  else {
			  g.errorcode(3217);
		  }
		}catch(Exception e) {
			g.jsmessage(e.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect("diary.jsp");
		}
	}

}
