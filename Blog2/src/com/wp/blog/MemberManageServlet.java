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

import com.wp.blog.DAO.MemberDAO;
import com.wp.blog.DTO.MemberDO;

/**
 * Servlet implementation class DBTotalServlet
 */
@WebServlet("/totaldb.do")
public class MemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberManageServlet() {
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
		String id = (String)session.getAttribute("id");
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
		MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
		List<MemberDO> memberlist = null;
		String viewName = null;
		
	    try {
	    	if(id != null) {
	    		if(id.equals("admin")) { //관리자 계정으로만 전체 회원 관리 가능 
	    			memberlist = memberdao.getMemberList();
	    			session.setAttribute("memberlist", memberlist);
	    			viewName = "main.do?page=11";
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
	    catch (Exception ex) {
			// TODO Auto-generated catch block
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null)
		{
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
