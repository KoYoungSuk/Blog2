package com.wp.blog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchETCServlet
 */
@WebServlet("/selectetc.do")
public class SearchETCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchETCServlet() {
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
		String viewName = null;
		Global g = new Global(response);
		
		String service_search = request.getParameter("ServiceSearch");
		String service = request.getParameter("Services"); 
		
		if(service_search == null || service_search.isEmpty()) {
			service_search = service; 
		}
		
		try {
				switch(service_search) {
				case "Clock":
					viewName = "clock"; 
					break;
				case "NewClock":
					viewName = "clock_new";
				    break;
				case "Calendar":
					viewName = "calendar"; 
					break;
				case "MyDiary":
					viewName = "diary"; 
					break;
				case "MyDiaryNew":
					viewName = "diary_new"; 
					break;
				case "DailyManager":
					viewName = "daily"; 
					break;
				case "SportReport":
					viewName = "sport"; 
					break;
				case "HomeProduct(Web)":
					viewName = "product"; 
					break; 
				default:
					break; 
				}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName);
		}
		else {
			g.jsmessage("E R R O R"); 
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
