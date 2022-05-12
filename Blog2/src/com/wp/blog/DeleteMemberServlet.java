package com.wp.blog;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**('
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
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
		String viewName = null;
		int number = Integer.parseInt(request.getParameter("number"));
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		String id = request.getParameter("id");
		MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
		try {
			int result = memberdao.DeleteMember(id);
			if(result == 1)
			{
				if(number == 2) {
					viewName = "totaldb.do";
				}
				else {
					viewName = "main.do";
				}				
			}
			else 
			{
			     g.jsmessage("Unknown Error Message");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
		if(viewName != null)
		{
			response.sendRedirect(viewName);
			session.invalidate();
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
