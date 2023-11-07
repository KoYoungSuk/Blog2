package com.wp.blog;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.wp.blog.DAO.PDFDAO;
import com.wp.blog.DTO.PDFDTO;

/**
 * Servlet implementation class UploadPDFServlet
 */
@WebServlet("/pdfviewer/pdfupload.do")
public class UploadPDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPDFServlet() {
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
		
		String id = (String)session.getAttribute("id");
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		  	    
		Timestamp savedate = new Timestamp(System.currentTimeMillis());
		try {
			if(id.equals("admin")) {
				String os = System.getProperty("os.name");
				String location = null;
				int maxSize = 1024 * 1024 * 1024 * 5;
				
				if(os.equals("Windows 10")) {
					location = "C:\\Temp\\pdf2\\";
				}
				else if(os.equals("Linux")) {
					location = "/mnt/hdd3/TextFiles/pdf2/"; 
				}
				else if(os.equals("Mac")) {
					location = null; 
				}
				
				MultipartRequest multi = new MultipartRequest(
						request, 
						location, 
					    maxSize, 
						"UTF-8");
				
				Enumeration<?> files = multi.getFileNames();
				    
				String element = "";
				String filesystemName = "";
				   
				if(files.hasMoreElements()) {
			        element = (String)files.nextElement();
					filesystemName = multi.getFilesystemName(element);
				}
				   
				PDFDTO pdfdto = new PDFDTO(filesystemName, savedate, savedate);
				PDFDAO pdfdao = new PDFDAO(JDBC_Driver, db_url, db_id, db_pw);
				
				int result = pdfdao.insertPDF(pdfdto);
				
				if(result != 0) {
					viewName = "pdflist.do";
				}
				else {
					g.jsmessage("Unknown Error Message");
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
			response.sendRedirect(viewName);
		}
		else {
			g.jsmessage("Error during upload PDF.");
		}
	}

}
