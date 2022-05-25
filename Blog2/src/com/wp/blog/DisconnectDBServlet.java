package com.wp.blog;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DisconnectDBServlet
 */
@WebServlet("/disconnectdb.do")
public class DisconnectDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisconnectDBServlet() {
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
		Connection conn = (Connection)session.getAttribute("connection");
		String check = request.getParameter("check");
		String viewName = null;
		try {
			conn.close();
			conn = null;
			session.removeAttribute("connection");
			if(check.equals("m")) {
				viewName = "main.do";
			}
			else {
				viewName = "dbmanager/index.jsp";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
		if(viewName != null) {
			response.sendRedirect(viewName);
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
