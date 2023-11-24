package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.SportDAO;

/**
 * Servlet implementation class DeleteSportServlet
 */
@WebServlet("/sport/deletesport")
public class DeleteSportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSportServlet() {
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
		String viewName = null;
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		String title = request.getParameter("title"); 
		
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
					int result = sportdao.deleteSport(title);
					if(result != 0) {
						session.removeAttribute("detailsportlist"); 
						viewName = "sport2.jsp";
					}
					else {
						g.jsmessage("Unknown Error Message");
					}
				}
			}
			else {
				session.invalidate(); 
				g.errorcode(3217); 
			}
		}
		catch(Exception ex){
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName); 
		}
		else {
			g.jsmessage("Delete Error");
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
