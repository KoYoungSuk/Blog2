package com.wp.blog;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.BoardDAO;
import com.wp.blog.DTO.BoardDO;

/**
 * Servlet implementation class SearchTitleServlet
 */
@WebServlet("/search.do")
public class SearchTitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @seetpServlet#HttpServlet()
     */
    public SearchTitleServlet() {
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
		Boolean descbool = false;
		String access = "admin"; 
		String word = request.getParameter("word");
		String id = (String)session.getAttribute("id");
		String desc = request.getParameter("desc"); 
		List<BoardDO> newboardlist = new ArrayList<BoardDO>();
		Global g = new Global(response);
	   
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");  
		
		String viewName = null; 
		if(desc == null) {
	    	desc = "0";
	    }
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
	    
	    int descnum = Integer.parseInt(desc);
	    if(descnum == 1) {
	    	descbool = true;
	    }
	    
	    try {
	    	  BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw); 
			  List<BoardDO> boardlist = boarddao.SearchBoardList(word, descbool); 
			  int count_board = boarddao.getBoardCountByWord(word, access);
			  if(boardlist != null){
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
				    session.setAttribute("boardlist", newboardlist);
				    session.setAttribute("count_board", count_board);
				    session.setAttribute("word", word);
				    session.setAttribute("pagenum", 1); //페이지 개수 
					session.setAttribute("beginnumber", 0); //시작번호 
					session.setAttribute("endnumber", count_board); 
					viewName = "main.do?page=3"; 
			  }else {
					g.jsmessage("No Result Found");
			  }
	    }catch (Exception e) {
		    // TODO Auto-generated catch block
			g.jsmessage(e.getMessage());
		}
	    if(viewName != null) {
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
