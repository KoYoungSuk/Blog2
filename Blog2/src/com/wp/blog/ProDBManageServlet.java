package com.wp.blog;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.DAO;

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
	    Global g = new Global(response);
	    g.errorcode(403);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String sqlcommand = request.getParameter("sqlcommand");
		String[] split_sqlcommand = sqlcommand.split(" ");
		String sqlcommand2 = split_sqlcommand[0].toUpperCase();
		Connection conn = (Connection)session.getAttribute("connection");
		String viewName = null;
		List<Object> header = null;
		List<List<Object>> tablelist = null;
		Boolean querystatus = false;
  	    try { 
  	       DAO dao = new DAO(conn);
  	       if(sqlcommand2.equals("SELECT")) {
  	    	 header = dao.processheader(sqlcommand, false, null); //Schema 
    		 tablelist = dao.processColumn(sqlcommand, false, null); //Instance 
    		 querystatus = true;
  	       }
  	       else if(sqlcommand2.equals("CREATE") || sqlcommand2.equals("DROP") || sqlcommand2.equals("ALTER") || sqlcommand2.equals("COMMIT")) {
  	    	  dao.ddl(sqlcommand); //????????? COMMIT??? DCL????????? ?????? ?????? ????????? ?????????.... 
  	    	  querystatus = true;
  	       } 
  	       else {
  	    	  int result = dao.iudDB(sqlcommand);
  	    	  if(result == 1) {
  	    		  querystatus = true;
  	    	  }
  	       }
  		   if(querystatus) {
  			 viewName = "professional.jsp";
  			 request.setAttribute("updatestatus", "success");
  			 request.setAttribute("sqlcommand", sqlcommand);
  		     request.setAttribute("time", LocalDateTime.now());
  		     if(header != null && tablelist != null) {
    		     request.setAttribute("degree", header.size());
    		     request.setAttribute("tuple", tablelist.size()); 
    		     request.setAttribute("sqlcommand", sqlcommand);
    		     request.setAttribute("tableheaderlist", header);
    		     request.setAttribute("tablenamelist", tablelist);
  		     }
  		     else {
  		    	 g.jsmessage("Null");
  		     }
  		   }
  		   else {
  			   g.jsmessage("Error");
  		   }
  	    }catch(Exception e) {
  	       g.jsmessage(e.getMessage());
  	    }
  	    if(viewName != null) {
    	  	RequestDispatcher view = request.getRequestDispatcher(viewName);
  	        view.forward(request, response);
    	}
	}

}
