package com.wp.blog;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardlist.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
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
		session.removeAttribute("boardlist");
		String id = (String)session.getAttribute("id");
		String access = null;
		String viewName = null;
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	String db_url = application.getInitParameter("db_url");
	  	String db_id = application.getInitParameter("db_userid");
	  	String db_pw = application.getInitParameter("db_password");  
	  	BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
	  	
	    List<BoardDO> newboardlist = new ArrayList<BoardDO>();
	    Global g = new Global(response);
	    if(id != null) {
	    	if(id.equals("admin")) {
	    		access = "admin"; //관리자로 접속한 경우 
	    	}
	    	else {
	    		access = "member"; //회원 모드 
	    	}
	    }
	    else {
	    	access = "anonymous"; //비회원 모드
	    }
	    try {
			  List<BoardDO> boardlist = boarddao.getBoardList(false);
			  int count_board = boarddao.getBoardCount();
		      for(BoardDO boarddo: boardlist) {
				if(access.equals("admin")) {  //관리자 모드로 접속한 경우 전체 게시물 조회 가능 
				     newboardlist.add(boarddo);
			    }
				else if(access.equals("member")) { //회원 모드일 경우 관리자 모드로 작성하지 않은 게시물만 조회 가능 
					if(!boarddo.getAnonymous().equals("admin")){
						newboardlist.add(boarddo); 
					}
				}
				else {
					if(boarddo.getAnonymous().equals(access)) { //비회원 모드일 경우 비회원 모드로 작성한 게시물만 조회 가능 
						newboardlist.add(boarddo);
					}
			    }
		      }
		      if(boardlist != null){
				    session.setAttribute("boardlist", newboardlist);
				    session.setAttribute("count_board", count_board);
					viewName = "main.do?page=3"; 
			  }else {
					g.jsmessage("Null Error");
			  }
	    }catch (Exception e) {
		    // TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	    RequestDispatcher view = request.getRequestDispatcher(viewName);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
