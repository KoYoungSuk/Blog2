package com.wp.blog;


import java.io.IOException;
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
public class DBTestResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBTestResultServlet() {
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
	    try {
	      DAO dao = new DAO(jdbcdriver, dburl, dbid, dbpw);
	      DTO dto = new DTO();
	      dao.connectDB();
	      connection = true;
	      if(connection) {
	    	request.setAttribute("testcode", "success");
	    	dto.setDbdriver(jdbcdriver);
	    	dto.setDburl(dburl);
	    	dto.setDbid(dbid);
	    	dto.setDbpw(dbpw);
	    	/*
	        request.setAttribute("jdbcdriver", jdbcdriver);
	    	request.setAttribute("dburl", dburl);
	   	    request.setAttribute("dbid", dbid);
	   	    request.setAttribute("dbpw", dbpw);
	   	    */
	   	    dao.disconnectDB();
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	     RequestDispatcher view = request.getRequestDispatcher(viewName);
		 view.forward(request, response);
		
	}

}
