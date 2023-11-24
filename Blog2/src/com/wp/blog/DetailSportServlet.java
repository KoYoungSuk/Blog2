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

import com.wp.blog.DAO.SportDAO;

/**
 * Servlet implementation class DetailSportServlet
 */
@WebServlet("/sport/detailsport")
public class DetailSportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailSportServlet() {
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
		HttpSession session = request.getSession();
		String viewName = null;
		Global g = new Global(response);
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	    String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
	    String db_pw = application.getInitParameter("db_password");
	    	    
	    String id = (String)session.getAttribute("id");
	    
	    String date = request.getParameter("date");
	    
	    String yearmonth = date.split("-")[0] + "-" + date.split("-")[1]; 
	    
		try {
			if(id != null) {
				if(id.equals("admin")) {
					SportDAO sportdao = new SportDAO(JDBC_Driver, db_url, db_id, db_pw); 
					Map<String, String> sportlist = sportdao.getSportList(date); 
					if(sportlist != null) {
						if(sportlist.get("title") != null) {
							session.setAttribute("detailsportlist", sportlist); 
							viewName = "sport.jsp?page=2"; 
						}
						else {
							session.setAttribute("errormessage_sport", "Sport Information Not Selected or Not Founded.");
							viewName = "sport2.jsp?yearmonth=" + yearmonth +  "&choosed_date=" + date; 
						}
					}
					else {
						g.jsmessage("Null Error Message");
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
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			if(viewName.contains("sport.jsp")){
				RequestDispatcher view = request.getRequestDispatcher(viewName);
			 	view.forward(request, response);
			}
			else if(viewName.contains("sport2.jsp")){
				response.sendRedirect(viewName); 
			}
		}
		else {
			g.jsmessage("Cannot read Sport Information.");
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
