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

import com.wp.blog.DAO.PDFDAO;
import com.wp.blog.DTO.PDFDTO;

/**
 * Servlet implementation class PDFListServlet
 */
@WebServlet("/pdfviewer/pdflist.do")
public class PDFListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDFListServlet() {
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
				PDFDAO pdfdao = new PDFDAO(JDBC_Driver, db_url, db_id, db_pw);
				
				List<PDFDTO> pdflist = pdfdao.getPDFList();
				
				if(pdflist != null) {
					viewName = "upload.jsp"; 
					session.setAttribute("pdflist", pdflist);
				}
				else {
					g.jsmessage("Null");
				}
			}
			else {
				g.jsmessage("관리자만 PDF 파일 업로드가 가능합니다.");
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