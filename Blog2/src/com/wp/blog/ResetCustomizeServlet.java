package com.wp.blog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResetCustomizeServlet
 */
@WebServlet("/resetcustomize.do")
public class ResetCustomizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetCustomizeServlet() {
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
		Cookie[] cookie = request.getCookies();
		String viewName = null;
		
        try {
        	String cookiecheck = request.getHeader("Cookie");
        	if(cookiecheck != null) {
        		for(int i=0; i<cookie.length; i++) {
        			if(cookie[i].getName().equals("colorcode")) {
        				cookie[i].setMaxAge(0); //지속시간을 0초로 설정(쿠키 삭제) 
        				response.addCookie(cookie[i]);
        			}
        		}
        	}
        	viewName = "main.do?page=29";
        	response.sendRedirect(viewName); 
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
