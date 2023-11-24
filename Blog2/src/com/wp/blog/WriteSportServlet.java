package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.SportDAO;
import com.wp.blog.DTO.SportDO;

/**
 * Servlet implementation class WriteSportServlet
 */
@WebServlet("/sport/writesport")
public class WriteSportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteSportServlet() {
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
		String viewName = null;
		HttpSession session = request.getSession();
		Global g = new Global(response);
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	    String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
	    String db_pw = application.getInitParameter("db_password");
	    
	    String id = (String)session.getAttribute("id");
	    
	    String title = request.getParameter("title");
	    title = XssPreventer.escape(title); 
	    int distance = Integer.parseInt(request.getParameter("distance"));
	    int calories = Integer.parseInt(request.getParameter("calories"));
	    
	    Timestamp savedate = new Timestamp(System.currentTimeMillis());
	    
		try {
			if(id != null) {
				if(id.equals("admin")) {
					SportDAO sportdao = new SportDAO(JDBC_Driver, db_url, db_id, db_pw);
				    SportDO sportdo = new SportDO(title, savedate, distance, calories);
				    int result = sportdao.insertSport(sportdo);
				    if(result != 0) {
				    	viewName = "sport2.jsp"; 
				    }
				    else {
				    	g.jsmessage("Unknown Error Message");
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
			response.sendRedirect(viewName);
		}
		else {
			g.jsmessage("Cannot Write Sport Information"); 
		}
	}

}
