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
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id"); //세션 아이디 체크  
		String access = "admin";
		if(id == null) { //세션으로 받아온 아이디가 없으면 비회원 모드 
		   access = "anonymous";
		}
		else {
		   if(!id.equals("admin")) { //만약 세션으로 받아온 아이디가 있는데 admin가 아니면 회원 
			   access = "member"; 
		   }
		}
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password"); 
  	    
  	    String viewName = null;
  	    try {
  	    
  	    	BoardDAO boarddao = new BoardDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    	List<BoardDO> boardlist = boarddao.getBoardList(true);
  	    	List<BoardDO> newboardlist = new ArrayList<BoardDO>();
  	    	int count = 0;	    
  	    	for(BoardDO boarddo : boardlist) {
  	    		if(access.equals("admin")) { //관리자 모드면 모든 메모들을 볼 수 있게 함. 
  	    			count++;
  	    			newboardlist.add(boarddo);
  	    		}
  	    		else if(access.equals("member"))
  	    		{
  	    			if(!boarddo.getAnonymous().equals("admin")) //회원 모드이면 관리자 모드가 아닌 메모들만 볼 수 있게 함 
  	    			{
  	    				count++;
  	  	    			newboardlist.add(boarddo);
  	    			}
  	    		}
  	    		else {
  	    			if(boarddo.getAnonymous().equals("anonymous")) { //비회원 모드이면 비회원 모드인 메모만 볼 수 있게 함
  	    				count++;
  	  	    			newboardlist.add(boarddo);
  	  	    		}
  	    		}
  	    		if(count == 10) { //10개까지만 출력
  	    			break;
  	    		}
  	    	}
  	    	if(boardlist != null && newboardlist != null) {
  	    		session.setAttribute("access", access);
  	    		session.setAttribute("newboardlist", newboardlist);
  	    		viewName = "maintest.jsp";
  	    	}
  	    	else {
  	    		g.jsmessage("Null Error");
  	    	}
  	    }catch(Exception e) {
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
