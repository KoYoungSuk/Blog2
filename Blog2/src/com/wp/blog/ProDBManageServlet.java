package com.wp.blog;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProDBManageServlet
 */
@WebServlet("/dbmanager/prodbmanage.do")
public class ProDBManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProDBManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String sqlcommand = request.getParameter("sqlcommand");
		String viewName = null;
  	    try { 
  	       /*
  	       String jdbc_driver = d.getDbdriver();
  	       String db_url = d.getDburl();
  	       String db_id = d.getDbid();
  	       String db_pw = d.getDbpw();
  	       DAO dao = new DAO(jdbc_driver, db_url, db_id, db_pw);
  	       */
  	       DAO dao = new DAO();
  		   List<Object> header = dao.processheader(sqlcommand);
  		   List<List<Object>> tablelist = dao.processColumn(sqlcommand);
  		   if(header != null && tablelist != null) {
  			 viewName = "professional.jsp";
  		     request.setAttribute("time", LocalDateTime.now());
  		     request.setAttribute("sqlcommand", sqlcommand);
  		     request.setAttribute("tableheaderlist", header);
  		     request.setAttribute("tablenamelist", tablelist);
  		   }
  		   else {
  			   g.jsmessage("Null Error");
  		   }
  	    }catch(Exception e) {
  	       g.jsmessage(e.getMessage());
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
