package com.wp.blog;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DailyCalendarServlet
 */
@WebServlet("/daily/daily_new.do")
public class DailyCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyCalendarServlet() {
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
		
		String id = (String)session.getAttribute("id");
		//String id = "admin";
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					 Calendar c = Calendar.getInstance();
					 int year = c.get(Calendar.YEAR);
					 int month = c.get(Calendar.MONTH) + 1; 
					 int date = 1;
					 Calendar ca = new GregorianCalendar(year, month, date);
				     int daysOfMonth = ca.getActualMaximum(Calendar.DAY_OF_MONTH);
	                 
	                 List<List<Integer>> calendarlist = new ArrayList<List<Integer>>();
	                 List<Integer> weeklist = new ArrayList<Integer>();
	                 
	                 for(int i=1; i<daysOfMonth; i++) {
	                	 weeklist.add(i); 
	                	 if(i % 7 == 0) {
	                		 calendarlist.add(weeklist); 
	                		 weeklist = new ArrayList<Integer>(); 
	                	 }
	                 }
	                 
					 String year_month = year + "-" + month; 
				
					 session.setAttribute("yearmonth", year_month);
					 session.setAttribute("calendarlist", calendarlist);
					 
					 viewName = "index2.jsp"; 
					 
					 RequestDispatcher view = request.getRequestDispatcher(viewName);
			  		 view.forward(request, response);
				}
				else {
					g.jsmessage("This is Administrator Only."); 
				}
			}
			else {
				g.jsmessage("This is Administrator Only."); 
			}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
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
