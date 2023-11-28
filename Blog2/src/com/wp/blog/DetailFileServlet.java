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

import com.wp.blog.DAO.DownloadDAO;

/**
 * Servlet implementation class DetailFileServlet
 */
@WebServlet("/detailfiles.do")
public class DetailFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailFileServlet() {
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
		String viewName = null;
		Global g = new Global(response);
		HttpSession session = request.getSession();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		try {
			DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw); 
			
			Map<String, String> detaildownloadlist = downloaddao.getDownloadTableByNum(num, true);
			if(detaildownloadlist != null) {
				if(detaildownloadlist.get("num") != null) {
					session.setAttribute("detaildownloadlist", detaildownloadlist);
					viewName = "main.do?page=26"; 
				}
				else {
					g.jsmessage("File Information Not Found"); 
				}
			}
			else {
				g.jsmessage("Null Error Message");
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
		doGet(request, response);
	}

}
