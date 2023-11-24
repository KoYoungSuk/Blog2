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
		String expand = request.getParameter("expand");
		
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

  	  	  	    	if(diarylist != null) {
  	  	  	    		viewName = "diary.jsp?page=1";
  	  	  	    		session.setAttribute("diarylist", diarylist);
  	  	  	    		session.setAttribute("diarynumber", diarynumber);
  	  	  	    		
  	  	  	    		if(expand != null) {
  	  	  	    			  if(expand.equals("yes")) {
  	  	  	    				  session.setAttribute("page_num_diary",1);
  	  	  	    				  session.setAttribute("beginnumber_diary", 0);
  	  	  	    				  session.setAttribute("endnumber_diary", diarynumber);
  	  	  	    			  }
  	  	  	    		}
  	  	  	    		else {
  	  	  	    		      session.setAttribute("page_num_diary", page_num_diary + 1); //일기장 개수가 20개 이하이면 첫 페이지와 마지막 페이지 둘다 1이 되어버려서 다음 페이지로 넘어갈 수 없는 상황이 만들어진다.
                                                                                          //그래서 1을 더한다. 
                              session.setAttribute("beginnumber_diary", (page_num_diary_para - 1) * 10); //시작번호 
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
