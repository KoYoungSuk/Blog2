package com.wp.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Global g = new Global(response);
        g.errorcode(403);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		//Remove Previous Session
		session.removeAttribute("newboardlist");
		session.removeAttribute("id");
		session.removeAttribute("firstname");
		session.removeAttribute("lastname");
		session.removeAttribute("fullname");
		session.removeAttribute("boardlist");
		session.removeAttribute("detailboardlist");
		//Remove Previous Session
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String firstname = null;
		String lastname = null;
		String birthday = null;
		String viewName = null;
		MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
		List<MemberDO> memberlist;
		try{
				try {
					memberlist = memberdao.getMemberList();
					if(memberlist != null){
						for(MemberDO memberdo : memberlist){
							if(id.equals(memberdo.getId())){
								if(BCrypt.checkpw(password, memberdo.getPassword())){
									firstname = memberdo.getFirstname();
									lastname =  memberdo.getLastname();
									birthday = memberdo.getBirthday();
									viewName = "main.do";
									break;
								}
							}
						}
					}
					else{
						g.jsmessage("Unknown Error: Member list is Null!");
					}
				} catch (ClassNotFoundException e){
				    viewName = "N";
				    g.jsmessage(e.getMessage());
				} catch (SQLException e){
					viewName = "N";
					g.jsmessage(e.getMessage());
				}
				  if(firstname == null){
			        	firstname = "";
			        }
			        if(lastname == null){
			        	lastname = "";
			        }
			        if(birthday == null){
			        	birthday = "";
			        }
			        if(viewName != "N" && viewName != null){
			        	session.setAttribute("id", id);
			     	    session.setAttribute("firstname", firstname);
			     	    session.setAttribute("lastname", lastname);
			     	    session.setAttribute("fullname", firstname + lastname);
			     	    response.sendRedirect(viewName);
			        }
			        else{
			        	g.jsmessage("Login Error: ID and Password are not corrected.");
			        }
		}catch(NullPointerException e) {
			g.jsmessage("Null Error");
		}
	}
}
