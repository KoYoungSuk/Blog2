package com.wp.blog;

import java.io.IOException;
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
  	    
  	    String year = title.split("-")[0];
  	    String month = title.split("-")[1];
  	    
  	    String yearmonth = year + "-" + Integer.parseInt(month); 
  	    
  	    try
  	    {
  	    	if(id != null)
  	    	{
  	    		if(id.equals("admin")) //관리자 모드일때 
  	    		{
  	    			InfoDAO infodao = new InfoDAO(JDBC_Driver, db_url, db_id, db_pw);
  	    			
  	    			Map<String, String> infodetaillist = infodao.getInfoListByTitle(title, true); //HTML -> Br
  	  	    		    
  	  	    		if(infodetaillist != null)
  	  	    		{
  	  	    			String title_new = infodetaillist.get("title"); 
  	  	    			
  	  	    			if(title_new != null) {
  	  	    			    session.setAttribute("infodetaillist", infodetaillist);
  	  	    		        viewName = "list.jsp?page=2"; 
  	  	    			}
  	  	    			else { //작성 모드 
  	  	    			    session.setAttribute("errormessage_info", "Information Not Selected or Not Founded.");
  	    	    		    viewName = "info_new.jsp?yearmonth=" + yearmonth + "&choosed_title=" + title; 
  	  	    			}
  	  	    	    }
  	  	    		else
  	  	    		{
  	  	    		    g.jsmessage("Null Error"); 
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
  	    	if(viewName.equals("list.jsp?page=2")) {
  	    		RequestDispatcher view = request.getRequestDispatcher(viewName);
  	 		    view.forward(request, response);
  	    	} 
  	    	else if(viewName.contains("info_new.jsp")) {
  	    		response.sendRedirect(viewName);
  	    	}
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
