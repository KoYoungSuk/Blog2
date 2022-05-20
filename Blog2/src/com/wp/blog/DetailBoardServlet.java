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

/**
 * Servlet implementation class DetailBoardServlet
 */
@WebServlet("/detailboard.do")
public class DetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBoardServlet() {
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
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int number = Integer.parseInt(request.getParameter("serial"));
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
		BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
		String viewName = null;
		Boolean accessbool = false;
		String access = null;
		if(id != null) {
			if(id.equals("admin")) {  //관리자 모드로 접속한 경우 
				access = "admin";
			}
			else {  //회원 모드로 접속한 경우
				access = "member"; 
			}
		}
		else { //비회원 모드로 접속한 경우
			access = "anonymous";
		}
		try {
			Map<String, String> detailboardlist = boarddao.getBoardByNum(number, true, true); //<br> �±׸� �߰��Ѵ�. -> HTML ��Ű ������� 
			Map<String, String> newdetailboardlist = null;
		
			if(detailboardlist != null) {
			    if(access.equals("admin")) { //관리자 모드에서는 모든 게시물을 볼 수 있다. 
					accessbool = true;
				}
			    else if(access.equals("member")) { //회원 모드에서는 관리자 모드로 작성된 게시물을 제외하고 볼 수 있다.
				    if(!detailboardlist.get("anonymous").equals("admin")) {
						 accessbool = true;
					}
			    }
				else {  //비회원 모드에서는 비회원 모드로 작성된 게시물만 볼 수 있다. 
					if(detailboardlist.get("anonymous").equals(access)) {
					     accessbool = true;
					}
				}
			    
			    if(accessbool) {
			    	newdetailboardlist = detailboardlist;
			    }
			    
			    if(newdetailboardlist != null) {
			    	session.setAttribute("detailboardlist", detailboardlist);
					session.setAttribute("accessbool", accessbool);
					viewName = "main.do?page=14";
			    }
			    else {
			        g.errorcode(3217);
			    }
			}
			else {
				g.jsmessage("Null Error");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
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
