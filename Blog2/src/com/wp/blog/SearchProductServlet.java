package com.wp.blog;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.wp.blog.DAO.ProductDAO;
import com.wp.blog.DTO.ProductDO;

/**
 * Servlet implementation class SearchProductServlet
 */
@WebServlet("/product/searchproduct")
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductServlet() {
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
		String viewName = null;
		Global g = new Global(response);
		HttpSession session = request.getSession();
		
		//DataBase Connection Information from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		String id = (String)session.getAttribute("id");
		String buy_date = request.getParameter("buy_date");
		buy_date = XssPreventer.escape(buy_date); 
		try {
			if(id != null) {
				if(id.equals("admin")) {
					ProductDAO productdao = new ProductDAO(JDBC_Driver, db_url, db_id, db_pw);
					List<ProductDO> totalproductlist = productdao.getProductTotalList(buy_date);
					int productnumber = productdao.getProductNumber(buy_date);
					if(totalproductlist != null) {
						session.setAttribute("productnumber", productnumber);
						session.setAttribute("totalproductlist", totalproductlist);
						session.setAttribute("beginnumber_product",	0);
						session.setAttribute("endnumber_product", productnumber);
						session.setAttribute("pagecount_product", 1);
						viewName = "product.jsp?page=1"; 
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
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			RequestDispatcher view = request.getRequestDispatcher(viewName);
		    view.forward(request, response);
		}
		else {
			g.jsmessage("Search Error"); 
		}
	}

}
