package com.wp.blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Error3217Servlet
 */
@WebServlet("/3217")
public class Error3217Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Error3217Servlet() {
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
		Global g = new Global(response); 
		StringBuffer url = request.getRequestURL();
		String viewName = null;
		
		try {
			String url_str = url.toString();
			String new_picture_url = null; 
			String new_back_url = null;
			
			if(url_str.contains("https")) { //connected with https. 
				if(url_str.contains("nossl")) {
					new_picture_url = "https://192.168.55.126/nossl/pictures/computer.png"; 
					new_back_url = "https://192.168.55.126/nossl"; 
				}
				else {
					new_picture_url = "https://home.yspersonal.com/pictures/computer.png";
					new_back_url = "https://home.yspersonal.com"; 
				}
			}
			else {
				if(url_str.contains("nossl")) {
					new_picture_url = "http://192.168.55.126/nossl/pictures/computer.png"; 
					new_back_url = "http://192.168.55.126/nossl"; 
				}
				else {
					new_picture_url = "http://home.yspersonal.com/pictures/computer.png"; 
					new_back_url = "http://home.yspersonal.com"; 
				}
			}
			
			session.setAttribute("new_picture", new_picture_url);
			session.setAttribute("new_back_url", new_back_url); 
		    viewName = "3217.jsp"; 
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
