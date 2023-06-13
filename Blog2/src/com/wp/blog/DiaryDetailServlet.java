package com.wp.blog;

import java.io.IOException;
import java.util.List;
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
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		
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
   
					if(title.length() == 10) //제목에 맞춰서 검색했을 경우 : 그 제목에 맞는 일기장 내용이 출력된다. 
					{
						Map<String, String> detaildiarylist = diarydao.getDiaryListByTitle(title, true);
						if(detaildiarylist != null) {
							session.setAttribute("detaildiarylist", detaildiarylist);
							viewName = "diary.jsp?page=2";
						}
						else {
							g.jsmessage("Null Error");
						}
					}
					else //제목에 맞춰서 검색하지 않고 제목에 있는 특정 키워드를 검색하면 거기에 따라서 목록이 출력된다. 
					{
	  	  	  	    	List<DiaryDO> diarylist = diarydao.searchDiaryListByTitle(title); 
	  	  	  	    	int diarynumber = diarydao.getDiarynumberByTitle(title);
	  	  	  	    	if(diarylist != null)
	  	  	  	    	{
  	  	  	    		    session.setAttribute("diarylist", diarylist);
  	  	  	    		    session.setAttribute("diarynumber", diarynumber);
	  	  	  	    	}
	  	  	  	    	else
	  	  	  	    	{
	  	  	  	    		session.setAttribute("diarylist", null);
	  	  	  	    		session.setAttribute("diarynumber", diarynumber);
	  	  	  	    	}
	  	  	  	        viewName = "diary.jsp?page=1"; 
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
