package com.wp.blog;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String jdbc_driver = (String) session.getAttribute("jdbcdriver");
  	    String db_url = (String) session.getAttribute("dburl");
  	    String db_id = (String) session.getAttribute("dbid");
  	    String db_pw = (String) session.getAttribute("dbpw");
  	    String tablename = request.getParameter("tablename");
  	    String viewName = null;
  	    try {
  	       DAO dao = new DAO(jdbc_driver, db_url, db_id, db_pw);
 		   List<Object> header = dao.processHeaderEasy(tablename);
 		   List<List<Object>> tablelist = dao.processColumnEasy(tablename);
		   request.setAttribute("tablename", tablename);
		   request.setAttribute("tableheaderlist", header);
		   request.setAttribute("tablenamelist", tablelist);
		   viewName = "easy.jsp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
