package com.wp.blog;

import java.io.IOException;

import java.sql.SQLException;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.MemberDAO;

/**
 * Servlet implementation class MemberTotalServlet
 */
@WebServlet("/totalmember.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoServlet() {
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
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id"); //현재 로그인된 아이디(세션) 
		
		//DB 연결 준비 START (WEB.XML에서 정보를 가져온다.) 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    //DB 연결 준비 END 
  	    
		MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
		String viewName = null;
		Global g = new Global(response);
		try {
			Map<String, String> memberlist = memberdao.getMemberById(id);
			if(memberlist != null)
			{
				session.setAttribute("memberidlist", memberlist); //Map 형태로 세션에 넣는다. 
				viewName = "main.do?page=7";
			}
			else
			{ 
				g.jsmessage("MemberList is Null");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
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
