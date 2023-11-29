package com.wp.blog;

import java.io.IOException;
import java.time.LocalDate;
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
 * Servlet implementation class CalculateSportServlet
 */
@WebServlet("/sport/calculatesport")
public class CalculateSportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateSportServlet() {
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
		String viewName = null;
		Global g = new Global(response);
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		String yearmonth = request.getParameter("yearmonth");
		
		if(yearmonth == null || yearmonth.isEmpty()) {
		    LocalDate now = LocalDate.now();
		    int year = now.getYear();
		    int month = now.getMonthValue(); 
		    yearmonth = year + "-" + month; 
		}

		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					SportDAO sportdao = new SportDAO(JDBC_Driver, db_url, db_id, db_pw); 
					
					int avgcalories = sportdao.getAverageCaloriesByMonth(yearmonth); 
					int avgdistance = sportdao.getAverageDistance(yearmonth);
					Map<String, Object> mincaloriesandtitle = sportdao.getMinCalories(yearmonth);
					Map<String, Object> maxcaloriesandtitle = sportdao.getMaxCalories(yearmonth);
					Map<String, Object> mindistanceandtitle = sportdao.getMinDistance(yearmonth);
					Map<String, Object> maxdistanceandtitle = sportdao.getMaxDistance(yearmonth); 
					
				    session.setAttribute("yearmonth_sport", yearmonth);
					session.setAttribute("avgcalories", avgcalories);
					session.setAttribute("avgdistance", avgdistance);
					session.setAttribute("mincalories", mincaloriesandtitle.get("calories"));
					session.setAttribute("mintitle_calories", mincaloriesandtitle.get("title"));
					session.setAttribute("maxcalories", maxcaloriesandtitle.get("calories"));
					session.setAttribute("maxtitle_calories", maxcaloriesandtitle.get("title"));
					session.setAttribute("maxdistance", maxdistanceandtitle.get("distance"));
					session.setAttribute("maxtitle_distance", maxdistanceandtitle.get("title"));
					session.setAttribute("mindistance", mindistanceandtitle.get("distance"));
					session.setAttribute("mintitle_distance", mindistanceandtitle.get("title")); 
					viewName = "sport.jsp?page=5"; 
				}
				else {
					g.errorcode(3217);
					session.invalidate(); 
				}
			}
			else {
				g.errorcode(3217);
				session.invalidate(); 
			}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
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
