package com.wp.blog;

import java.io.IOException;

/*
import java.net.InetAddress;
import java.sql.Timestamp;
*/
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.DiaryDAO;
//import com.wp.blog.DAO.LogDAO;
import com.wp.blog.DTO.DiaryDO;
//import com.wp.blog.DTO.LogDO;

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
		String id = (String)session.getAttribute("id");
		
		String page_num_diary_para_str = request.getParameter("page_count_diary");
		int page_num_diary_para = 1;
		
		if(page_num_diary_para_str != null)
		{
			page_num_diary_para = Integer.parseInt(page_num_diary_para_str);
		}
		
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    try {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	  	    		DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
  	  	  	    	List<DiaryDO> diarylist = diarydao.getDiaryList(false);
  	  	  	    	int diarynumber = diarydao.getDiarynumber();
  	  	  	    	int page_num_diary = diarynumber / 10; //10개씩 페이지 구분하기 
  	  	  	    	int page_num_diary_rest = diarynumber % 10; //10개씩 나누고 남는 나머지 
  	  	  	    	
  	  	  	    	if(diarylist != null) {
  	  	  	    		viewName = "diary.jsp?page=1";
  	  	  	    		session.setAttribute("diarylist", diarylist);
  	  	  	    		session.setAttribute("diarynumber", diarynumber);
  	  	  	    		session.setAttribute("page_num_diary", page_num_diary); 
  	  	  	    		session.setAttribute("beginnumber_diary", (page_num_diary_para - 1) * 10); //시작번호 
  	  	  	    		if(page_num_diary_para == page_num_diary) { //마지막일때 
  	  	  	    		   session.setAttribute("endnumber_diary" , ((page_num_diary_para -1) * 10) + 9 + page_num_diary_rest); //끝번호 
  	  	  	    		}
  	  	  	    		else {
  	  	  	    		   session.setAttribute("endnumber_diary" , ((page_num_diary_para -1) * 10) + 9); //끝번호 
  	  	  	    		}
  	  	  	    		
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
