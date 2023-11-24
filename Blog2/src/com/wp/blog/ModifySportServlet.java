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

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.SportDAO;
import com.wp.blog.DTO.SportDO;

/**
 * Servlet implementation class ModifySportServlet
 */
@WebServlet("/sport/modifysport")
public class ModifySportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifySportServlet() {
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
		String viewName = null;
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	    String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
	    String db_pw = application.getInitParameter("db_password");
	    
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					SportDAO sportdao = new SportDAO(JDBC_Driver, db_url, db_id, db_pw); 
					Map<String, String> detailsportlist = sportdao.getSportList(title); 
					if(detailsportlist != null) {
						if(detailsportlist.get("title") != null) {
							session.setAttribute("detailsportlist", detailsportlist); 
							viewName = "sport.jsp?page=4"; 
						}
						else {
							g.jsmessage("Sport Information Not Found");
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
			RequestDispatcher view = request.getRequestDispatcher(viewName);
  			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Global g = new Global(response);
		String viewName = null;
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	    String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
	    String db_pw = application.getInitParameter("db_password");
	    
		String id = (String)session.getAttribute("id");
		
		String title = request.getParameter("title"); 
		int distance = Integer.parseInt(request.getParameter("distance"));
		int calories = Integer.parseInt(request.getParameter("calories")); 
		title = XssPreventer.escape(title);
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					SportDO sportdo = new SportDO(title, null, distance, calories); 
					SportDAO sportdao = new SportDAO(JDBC_Driver, db_url, db_id, db_pw);
					int result = sportdao.updateSport(sportdo);
					if(result != 0) {
						session.removeAttribute("detailsportlist");
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
	}

}
