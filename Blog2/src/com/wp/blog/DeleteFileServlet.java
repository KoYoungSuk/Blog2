package com.wp.blog;

import java.io.File;
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

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.wp.blog.DAO.DownloadDAO;

/**
 * Servlet implementation class DeleteFileServlet
 */
@WebServlet("/deletefile.do")
public class DeleteFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFileServlet() {
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
		String viewName = null;
		Global g = new Global(response);
		
		String id = (String)session.getAttribute("id");
		
		int num = Integer.parseInt(request.getParameter("num")); 
		
		//Database Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
					Map<String, String> detaildownloadlist = downloaddao.getDownloadTableByNum(num, true);
					
					if(detaildownloadlist != null) {
						if(detaildownloadlist.get("num") != null) {
							session.setAttribute("detaildownloadlist", detaildownloadlist); 
							viewName = "main.do?page=28"; 
						}
						else {
							g.jsmessage("File Information Not Found");
						}
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String viewName = null;
		Global g = new Global(response);
		
		String id = (String)session.getAttribute("id");
		
		int num = Integer.parseInt(request.getParameter("num")); 
		//Database Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
				    String os = System.getProperty("os.name");
				    String location = null;
				    
				    if(os.equals("Linux")) {
				    	location = "/mnt/hdd3/TextFiles/download/" + num; 
				    }
				    else if(os.contains("Windows")) {
				    	location = "C:\\Temp\\download\\" + num; 
				    }
				    else if(os.equals("Mac")) {
				    	
				    }
				    
				    DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
				    
				    int result = downloaddao.deleteTable(num);
				    
				    if(result != 0) {
				    	  //데이터베이스 안의 내용을 삭제했으면 서버에 있는 파일도 같이 삭제한다. 
				    	  File file = new File(location); 
						    
						  if(file.exists()) { //파일이 존재하면 삭제한다! 
						      FileUtils.cleanDirectory(file); //폴더 안에 있는 내용 삭제 
						      if(file.isDirectory()) {
						    	file.delete(); //폴더 삭제 
						      }
						  }
						  session.removeAttribute("detaildownloadlist");
						  viewName = "filelist.do"; 
				    }
				    else {
				    	g.jsmessage("Unknown Error Message");
				    }
				}
				else {
					g.errorcode(3217);
					session.invalidate(); 
				}
			}
			else {
				g.errorcode(3217);
				session.invalidate(); 
			}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName);
		}
	}

}
