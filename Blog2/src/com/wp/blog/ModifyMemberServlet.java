package com.wp.blog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.MemberDAO;
import com.wp.blog.DTO.MemberDO;

/**
 * Servlet implementation class ModifyMemberServlet
 */
@WebServlet("/modifymember.do")
public class ModifyMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    Global g = new Global(response);
	    g.errorcode(403);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Global g = new Global(response);
		HttpSession session = request.getSession();
		String viewName = null; 
		String s_id = (String)session.getAttribute("id"); //로그인한 아이디 
		
		//HTML에서 파라미터 가져오기 
		String id = request.getParameter("ID"); //수정하고 싶은 회원정보의 아이디 
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String birthday = request.getParameter("birthday");
		String mailaddress = request.getParameter("mailaddress"); 
		
		firstname = XssPreventer.escape(firstname);
		lastname = XssPreventer.escape(lastname);
		birthday = XssPreventer.escape(birthday); 
		mailaddress = XssPreventer.escape(mailaddress); 
		
		//DB 연결 준비 : START (WEB.XML에서 정보를 가져온다.) 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    //DB 연결 준비: END 
  	    
	    try 
	    {
		    if(id != null && s_id != null) {
			     if(id.equals(s_id)) { //로그인한 아이디와 회원정보가 일치해야 한다. 
					MemberDO memberdo = new MemberDO(id, null, firstname, lastname, birthday, null, mailaddress);
					MemberDAO memberdao = new MemberDAO(JDBC_Driver, db_url, db_id, db_pw);
					if(memberdao.CheckDuplicatedEMail(mailaddress) == 0)
					{
						int result = memberdao.UpdateMember(memberdo); //회원정보 업데이트 
						if(result == 1){
							viewName = "main.do";
							session.invalidate(); //세션 초기화(로그아웃) 
						}
						else{
							g.jsmessage("Unknown Error Message");
						}
					}
					else
					{
						g.jsmessage("Duplicated EMail Address Found!");  
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
		} 
	    catch (Exception e) 
	    {
			// TODO Auto-generated catch block
		    g.jsmessage(e.getMessage());
		}
		
		if(viewName != null){
			response.sendRedirect(viewName);
		}
	}

}
