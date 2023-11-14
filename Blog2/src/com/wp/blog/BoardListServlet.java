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

import com.wp.blog.DAO.BoardDAO;
import com.wp.blog.DTO.BoardDO;

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
		String id = (String)session.getAttribute("id");
		String access = "admin"; 
		String viewName = null;
		
		//DB 연결 준비 START : WEB.XML에서 연결 정보 가져오기 
	    ServletContext application = request.getSession().getServletContext();
	    String JDBC_Driver = application.getInitParameter("jdbc_driver");
	  	String db_url = application.getInitParameter("db_url");
	  	String db_id = application.getInitParameter("db_userid");
	  	String db_pw = application.getInitParameter("db_password");  
	  	//DB 연결 준비 END 
	  	
	  	BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
	    List<BoardDO> newboardlist = new ArrayList<BoardDO>();
	    Global g = new Global(response);
	
	    String pagecount_str = request.getParameter("pagecount");
	    int pagecount = 1;
	    
	    if(pagecount_str != null) {
	    	pagecount = Integer.parseInt(request.getParameter("pagecount"));
	    }
	   
	    
	    //현재 세션에 있는 아이디(로그인된 아이디)를 이용하여 권한 체크
	    
	    if(id == null){
	    	access = "anonymous"; //세션에 저장된 아이디가 NULL이면 접근 권한은 anonymous. 
	    }
	    else{
	    	if(!id.equals("admin")){
	    		access = "member"; //세션에 저장된 아이디가 NULL은 아닌데 admin도 아니면 접근 권한은 member. 
	    	}
	    }
	    
	    try {
	    	  List<BoardDO> boardlist = boarddao.getBoardList(false);
		      if(boardlist != null){
		    	  int count_board = boarddao.getBoardCount(access);
		    	  int page_num = count_board / 10; //게시글 10개를 기준으로 페이지 나누기 
		          
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
						if(boarddo.getAnonymous().equals("anonymous")) { //비회원 모드일 경우 비회원 모드로 작성한 게시물만 조회 가능 
							newboardlist.add(boarddo);
						}
				    }
			      }
			      
				  session.setAttribute("boardlist", newboardlist);
				  session.setAttribute("count_board", count_board);
				  session.setAttribute("pagenum", page_num + 1); //페이지 개수 
				  session.setAttribute("beginnumber", (pagecount-1) * 10); //시작번호 
				  session.setAttribute("endnumber", ((pagecount-1) * 10) + 9); //끝번호
			      viewName = "main.do?page=3"; 
			  }else {
				  g.jsmessage("Not Found");
			  }
	    }catch (Exception e) {
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
