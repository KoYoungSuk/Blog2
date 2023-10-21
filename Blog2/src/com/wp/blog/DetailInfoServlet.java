package com.wp.blog;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wp.blog.DAO.InfoDAO;
import com.wp.blog.DTO.InfoDO;

/**
 * Servlet implementation class DetailInfoServlet
 */
@WebServlet("/info/detailinfo")
public class DetailInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailInfoServlet() {
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
		Global g = new Global(response); 
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title"); 
		
		//DataBase Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    String viewName = null; 
  	    
  	    try
  	    {
  	    	if(id != null)
  	    	{
  	    		if(id.equals("admin")) //관리자 모드일때 
  	    		{
  	    			int title_size = title.length(); //제목 길이 
  	    			
  	    			InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    			
  	    		
  	    			if(title_size >= 10) //yyyy-MM-dd 
  	    			{
  	    				Map<String, String> infodetaillist = infodao.getInfoListByTitle(title, true); //HTML -> Br
  	  	    		    
  	  	    		    if(infodetaillist != null)
  	  	    		    {
  	  	    		       session.setAttribute("infodetaillist", infodetaillist);
  	  	    		       viewName = "list.jsp?page=2"; 
  	  	    		    }
  	  	    		    else
  	  	    		    {
  	  	    		    	g.jsmessage("Null Error"); 
  	  	    		    }
  	    			}
  	    			else //키워드를 포함한 제목 리스트 출력 
  	    			{
  	    				List<InfoDO> infolist = infodao.searchInfoListByTitle(title);
  	    				
  	    				if(infolist != null)
  	    				{
  	    					session.setAttribute("totalinfolist", infolist);
  	    					viewName = "list.jsp?page=1"; 
  	    				}
  	    				else
  	    				{
  	    					g.jsmessage("Search Result Not Found."); 
  	    				}
  	    			}
 
  	    		}
  	    		else
  	    		{
  	    			g.errorcode(3217);
  	    		}
  	    	}
  	    	else
  	    	{
  	    		g.errorcode(3217); 
  	    	}
  	    }
  	    catch(Exception ex)
  	    {
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
