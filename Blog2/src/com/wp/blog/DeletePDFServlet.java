package com.wp.blog;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.PDFDAO;

/**
 * Servlet implementation class DeletePDFServlet
 */
@WebServlet("/pdfviewer/deletepdf.do")
public class DeletePDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePDFServlet() {
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
		HttpSession session = request.getSession(); 
		Global g = new Global(response);
		String id = (String)session.getAttribute("id");
		
		
		//DataBase Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		try {
			if(id.equals("admin")) {
				String filename = request.getParameter("filename");
				String location = null;
				String os = System.getProperty("os.name");
				
				if(os.equals("Windows 10")) {
					location = "C:\\Temp\\pdf2\\" + filename; 
				}
				else if(os.equals("Linux")) {
					location = "/mnt/hdd3/TextFiles/pdf2/" + filename; 
				}
				else if(os.equals("Mac")) {
					
				}
				
				File file = new File(location); 
				
				PDFDAO pdfdao = new PDFDAO(JDBC_Driver, db_url, db_id, db_pw);
				
				int result = pdfdao.deletePDF(filename);
				
				if(result != 0) {
					if(file.exists()) {
						file.delete(); 
						session.removeAttribute("pdflist");
						viewName = "pdflist.do"; 
					}
				}
				else {
					g.jsmessage("Unknown Error Message"); 
				}
			}
			else {
				g.jsmessage("관리자만 PDF 업로드가 가능합니다.");
			}
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName); 
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
