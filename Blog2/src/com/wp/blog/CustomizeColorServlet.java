package com.wp.blog;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomizeColorServlet
 */
@WebServlet("/customize.do")
public class CustomizeColorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomizeColorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Global g = new Global(response);
		g.errorcode(403); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		String viewName = null;
		
		String colorcode = request.getParameter("colorcode");
		
		try {

			Cookie cookie = new Cookie("colorcode", colorcode);
			
			cookie.setMaxAge(31536000); //1년동안 유지(31536000초 = 60*60*24*365)
			response.addCookie(cookie); 
			viewName = "main.do?page=29"; 
		
			if(viewName != null) {
				response.sendRedirect(viewName); 
			}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
	}

}
