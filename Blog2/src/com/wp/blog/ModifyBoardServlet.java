package com.wp.blog;

import java.io.IOException;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.BoardDAO;
import com.wp.blog.DTO.BoardDO;

/**
 * Servlet implementation class ModifyBoardServlet
 */
@WebServlet("/modifyboard.do")
public class ModifyBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String number = request.getParameter("serial");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	String db_url = application.getInitParameter("db_url");
	  	String db_id = application.getInitParameter("db_userid");
	  	String db_pw = application.getInitParameter("db_password");
	  	
		Global g = new Global(response);
		String viewName = null;
		
		try {
		  BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
		  if(id != null) {
			  if(id.equals("admin")) { //관리자 계정으로만 게시글 수정가능 
				  Map<String, String> totalboardlist = boarddao.getBoardByNum(Integer.parseInt(number), false, false);
				  if(totalboardlist != null) {
					  session.setAttribute("totalboardlist", totalboardlist);
					  viewName = "main.do?page=17";
				  }
				  else {
					  g.jsmessage("Null Error");
				  }
			  }
			  else {
				 session.invalidate(); 
				 g.errorcode(3217);
			  }
		  }else {
			  session.invalidate(); 
			  g.errorcode(3217);
		  }		 
		}catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		if(viewName != null) {
			 RequestDispatcher view = request.getRequestDispatcher("main.do?page=17");
			 view.forward(request, response);
		}
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 Global g = new Global(response);
		 
		 HttpSession session = request.getSession();
		 
		 String s_id = (String)session.getAttribute("id"); //현재 로그인한 아이디 
		 
		 //Parameters from HTML 
		 String number = request.getParameter("number"); 
		 String title = request.getParameter("title");
		 String content = request.getParameter("content");
		 String access = request.getParameter("access");
		 
		 title = XssPreventer.escape(title); 
		 content = XssPreventer.escape(content); 
		 access = XssPreventer.escape(access); 
		 
		 //DataBase Connection String from web.xml
		 ServletContext application = request.getSession().getServletContext();
	     String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	 String db_url = application.getInitParameter("db_url");
	  	 String db_id = application.getInitParameter("db_userid");
	  	 String db_pw = application.getInitParameter("db_password");
	  	 
	  	 String viewName = null;
	  	 Timestamp modifydate = new Timestamp(System.currentTimeMillis());
	  	 
	  	 
	  	 BoardDO boarddo = new BoardDO(Integer.parseInt(number), title, s_id, content, null, modifydate, access, 0);
	  	 BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
	  	 
	  	 try {
	  		if(s_id != null) {
	  			if(s_id.equals("admin")) { //현재 로그인한 아이디가 관리자이면 수정가능 
	  				int result = boarddao.UpdateBoard(boarddo, false);
					System.out.println(result);
					if(result == 1){
						session.removeAttribute("totalboardlist"); 
						viewName = "main.do";
					}
					else{
						g.jsmessage("Unknown Error Message");
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
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	  	if(viewName != null){
			response.sendRedirect(viewName);
		} 
	}
}
