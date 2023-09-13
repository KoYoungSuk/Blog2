package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.InfoDAO;

/**
 * Servlet implementation class DeleteInfoServlet
 */
@WebServlet("/info/deleteinfo")
public class DeleteInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInfoServlet() {
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
		String title = request.getParameter("title");
		String id = (String)session.getAttribute("id");
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		try
		{
			InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
			
			int result = infodao.deleteInfo(title);
			
			if(id != null)
			{
				if(id.equals("admin"))
				{
					if(result != 0)
					{
						viewName = "infolist"; 
					}
					else
					{
					  g.jsmessage("Unknown Error Message."); 
					}
				}
				else
				{
					g.errorcode(3217); 
				}
			}
			else
			{
				g.errorcode(3217);
			}
		}
		catch(Exception e)
		{
			g.jsmessage(e.getMessage());
		}
		
		if(viewName != null)
		{
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
