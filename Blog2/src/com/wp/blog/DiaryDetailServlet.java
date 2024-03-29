package com.wp.blog;

import java.io.IOException;

//import java.util.List;
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
//import com.wp.blog.DTO.DiaryDO;

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
		String checkcal = request.getParameter("checkcal"); 
		
	    String year = title.split("-")[0];
		String month = title.split("-")[1];
		    
		String yearmonth = year + "-" + Integer.parseInt(month); 
		    
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    String viewName = null;
  	    String title_new = null; 
		try {
			if(id != null) {
				if(id.equals("admin")) { //관리자 계정 
					
					DiaryDAO diarydao = new DiaryDAO(JDBC_Driver, db_url, db_id, db_pw);
   
					Map<String, String> detaildiarylist = diarydao.getDiaryListByTitle(title, true);
					if(detaildiarylist != null) {
						title_new = detaildiarylist.get("title");
						
						if(title_new != null) {
							session.setAttribute("detaildiarylist", detaildiarylist);
							viewName = "diary.jsp?page=2";
						}
						else {
							if(checkcal != null) {
								if(checkcal.equals("cal")) {
									session.setAttribute("errormessage_diary", "Diary Information Not Selected or Not Founded."); 
									viewName = "../diary_new/diary_new.jsp?yearmonth=" + yearmonth +  "&choosed_title=" + title; 
								}
								else {
									g.jsmessage("Diary Information Not Found.");
								}
							}
							else {
								g.jsmessage("Diary Information Not Found.");
							}
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
		}catch(Exception e) {
			g.jsmessage(e.getMessage());
		}
		
		if(viewName != null) {
			if(title_new != null) {
				RequestDispatcher view = request.getRequestDispatcher(viewName);
			    view.forward(request, response);
			}
			else {
				if(checkcal != null) {
					if(checkcal.equals("cal")) {
						response.sendRedirect(viewName);
					}
				}
			}
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
