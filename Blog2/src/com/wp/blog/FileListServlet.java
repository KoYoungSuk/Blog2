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
 * Servlet implementation class FileListServletr
 */
@WebServlet("/filelist.do")
public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileListServlet() {
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
		
		//현재 페이지 번호 구하기 
		int param_page_count = 1; 
		String param_page_count_str = request.getParameter("pagecount");
		if(param_page_count_str != null) {
			param_page_count = Integer.parseInt(param_page_count_str); 
		}
		
		String expand = request.getParameter("expand");
		
		if(expand == null || expand.isEmpty()) {
			expand = "no"; 
		}
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    try {
  	    	DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	
  	        List<DownloadDO> totaldownloadlist = downloaddao.getTotaldownloadTable();
  	        int countnum = downloaddao.getCountNum(); //파일 리스트 개수 
  	        int pagenum = countnum / 10; //페이지 개수(파일 리스트 10개씩 나누기!) 
  	        if(totaldownloadlist != null) {
  	        	
  	        	session.setAttribute("totaldownloadlist", totaldownloadlist);
  	        	session.setAttribute("count_files", countnum);
                if(expand.equals("yes")) { //전체로 펼쳐서 보여주기 
                	session.setAttribute("pagenum_files", 1);
  	  	        	session.setAttribute("beginnumber_files", 0); //시작 페이지 지점
  	  	        	session.setAttribute("endnumber_files", countnum); //끝 페이지 지점 
  	        	}
  	        	else if(expand.equals("no")) { //10개씩 한 페이지로 묶어서 보여주기 
  	        		session.setAttribute("pagenum_files", pagenum + 1);
  	  	        	session.setAttribute("beginnumber_files", (param_page_count-1) * 10); //시작 페이지 지점
  	  	        	session.setAttribute("endnumber_files", ((param_page_count-1) * 10) + 9); //끝 페이지 지점 
  	        	}
  	        	viewName = "main.do?page=24"; 
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
