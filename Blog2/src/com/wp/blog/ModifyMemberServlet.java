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

import org.mindrot.jbcrypt.BCrypt;

/**
 * Servlet implementation class ModifyMemberServlet
 */
@WebServlet("/modifymember.do")
public class ModifyMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberServlet() {
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
		String id = request.getParameter("ID");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String birthday = request.getParameter("birthday");
		String password_hass = BCrypt.hashpw(password, BCrypt.gensalt(12));
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		try {
			 try {
				    MemberDO memberdo = new MemberDO(id, password_hass, firstname, lastname, birthday, null);
					MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
					int result = memberdao.UpdateMember(memberdo);
					if(result == 1){
						viewName = "main.do";
						session.invalidate();
					}
					else{
						g.jsmessage("Unknown Error Message");
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					g.jsmessage(e.getMessage());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
				    g.jsmessage(e.getMessage());
				}
		}catch(NullPointerException e) {
			g.jsmessage("Unknown Error Message");
		}
		if(viewName != null){
			response.sendRedirect(viewName);
		}
	}

}
