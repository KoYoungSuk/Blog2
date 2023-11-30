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

import com.wp.blog.DAO.DownloadDAO;
import com.wp.blog.DTO.DownloadDO;

/**
 * Servlet implementation class FileSearchServlet
 */
@WebServlet("/search_files.do")
public class FileSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileSearchServlet() {
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
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String viewName = null;
		
		String word = request.getParameter("word");
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		try {
			DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw); 
			int countnum = downloaddao.getCountNum(word); 
			List<DownloadDO> filelist = downloaddao.Searchfilelist(word); 
			
			if(filelist != null) {
  	        	session.setAttribute("totaldownloadlist", filelist);
  	        	session.setAttribute("count_files", countnum);
  	        	session.setAttribute("pagenum_files", 1);
  	        	session.setAttribute("beginnumber_files", 0); //시작 페이지 지점
  	        	session.setAttribute("endnumber_files", countnum); //끝 페이지 지점 
  	        	viewName = "main.do?page=24"; 
			}
			else {
				g.jsmessage("Unknown Error Message");
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

}
