package com.wp.blog;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.InfoDAO;
import com.wp.blog.DTO.InfoDO;

/**
 * Servlet implementation class InfoListServlet
 */
@WebServlet("/info/infolist")
public class InfoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoListServlet() {
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
		String id = (String)session.getAttribute("id");
		Global g = new Global(response);
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null; 
  	    try
  	    {
  	    	if(id != null) {
  	    		if(id.equals("admin")) {
  	  	    		InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
  	  	  	    	List<InfoDO> totalinfolist = infodao.getInfoList(); 
  	  	  	    	if(totalinfolist != null) {
  	  	  	    		viewName = "list.jsp?page=1";
  	  	  	    		session.setAttribute("totalinfolist", totalinfolist);
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
  	    catch(Exception ex)
  	    {
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
