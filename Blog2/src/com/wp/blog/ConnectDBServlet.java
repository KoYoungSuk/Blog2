package com.wp.blog;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DBTestResultServlet
 */
@WebServlet("/dbmanager/dbtestresult.do")
public class ConnectDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectDBServlet() {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		ServletContext application = request.getSession().getServletContext();
    	String jdbcdriver = application.getInitParameter("jdbc_driver");
		String dburl = request.getParameter("dburl");
		String dbid = request.getParameter("dbid");
		String dbpw = request.getParameter("dbpw");
		String mode = request.getParameter("mode");
		dburl = "jdbc:oracle:thin:@" + dburl;
		String viewName = "";
		Boolean connection = false;
		Connection conn = null;
	    try {
		  Class.forName(jdbcdriver);
		  conn = DriverManager.getConnection(dburl, dbid, dbpw);
	      connection = true;
	      if(connection) {
	    	session.setAttribute("testcode", "success");
	    	session.setAttribute("connection", conn);
	    	session.setAttribute("dburl", dburl);
	    	session.setAttribute("dbid", dbid);
	   	    if(mode.equals("easy")) {
	    	  viewName = "/dbmanager/easy.jsp";
	        }
	        else if(mode.equals("professional")){
	    	  viewName = "/dbmanager/professional.jsp";
	        }
	        else {
	    	  g.errorcode(403);
	        }
	      }
	      else {
	    	  g.jsmessage("Error");
	      }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	     RequestDispatcher view = request.getRequestDispatcher(viewName);
		 view.forward(request, response);
		
	}

}
