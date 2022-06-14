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
 * Servlet implementation class EasyDBManageServlet
 */
@WebServlet("/dbmanager/easytableselect.do")
public class EasyDBManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EasyDBManageServlet() {
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
		Connection conn = (Connection)session.getAttribute("connection");
  	    String tablename = request.getParameter("tablename");
  	    String attribute = request.getParameter("name");
  	    String value = request.getParameter("value");
  	    String mode = request.getParameter("mode");
  	    String viewName = null;
  	    Boolean querystatus = false;
  	    try {
  	       DAO dao = new DAO(conn);
  	       List<Object> header = null;
  	       List<List<Object>> tablelist = null;
  	       if(mode.equals("select")) {
  	    	  if(value.equals("") || attribute.equals("")) {
  	    		  value = null;
  	    		  attribute = null;
  	    	  }
  	    	  header = dao.processHeaderEasy(tablename, attribute, value); //Schema 
  	 		  tablelist = dao.processColumnEasy(tablename, attribute, value); //Instance
  	 		  querystatus = true;
  	       }
  	       else {
  	    	   int result = dao.deleteTable(tablename, attribute, value);
  	    	   if(result == 1) {
  	    		   querystatus = true;
  	    	   }
  	       }
 		   if(querystatus) {
 			  viewName = "easy.jsp";
 			  request.setAttribute("updatestatus", "success");
 	 		  request.setAttribute("time", LocalDateTime.now());
 			  request.setAttribute("tablename", tablename);
 			  request.setAttribute("attribute", attribute);
 			  request.setAttribute("value", value);
 			  if(header != null && tablelist != null) {
 				 request.setAttribute("degree", header.size()); 
 				 request.setAttribute("tuple", tablelist.size()); 
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
  	    if(viewName != null) {
  	  	RequestDispatcher view = request.getRequestDispatcher(viewName);
	    view.forward(request, response);
  	    }
	}

}
