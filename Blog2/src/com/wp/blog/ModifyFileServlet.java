package com.wp.blog;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wp.blog.DAO.DownloadDAO;
import com.wp.blog.DTO.DownloadDO;

/**
 * Servlet implementation class ModifyFileServlet
 */
@WebServlet("/modifyfile.do")
public class ModifyFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyFileServlet() {
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
		String viewName = null;
		
		String id = (String)session.getAttribute("id");
		
		int num = Integer.parseInt(request.getParameter("num")); 
		//Database Connection String from web.xml 
	    ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
	    String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
				
		try {
			if(id != null) {
				if(id.equals("admin")) {
					DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
					
					Map<String, String> detaildownloadlist = downloaddao.getDownloadTableByNum(num, false); 
					if(detaildownloadlist != null) {
						if(detaildownloadlist.get("num") != null) {
							session.setAttribute("detaildownloadlist", detaildownloadlist); 
							viewName = "main.do?page=27"; 
						}
						else {
							g.jsmessage("File Information Not Found");
						}
					}
					else {
						g.jsmessage("Null Error Message");
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		HttpSession session = request.getSession();
		Global g = new Global(response);
		String viewName = null;
		
		String id = (String)session.getAttribute("id");
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
		String JDBC_Driver = application.getInitParameter("jdbc_driver");
		String db_url = application.getInitParameter("db_url");
		String db_id = application.getInitParameter("db_userid");
		String db_pw = application.getInitParameter("db_password");
		
		
		int maxSize = 1024 * 1024 * 1024 * 5; 
		
		try {
			if(id != null) {
				if(id.equals("admin")) {
					String os = System.getProperty("os.name"); //OS Name Check 
					String location = null;
					
					//미리 경로 내부에 업로드하기 (임시) 
					if(os.equals("Linux")) { //Linux 
						location = "/mnt/hdd3/TextFiles/download/"; 
					}
					else if(os.contains("Windows")) { //Windows 
						//참고로 JDK 11에서는 Windows 11을 실행하는 경우 Windows 10이 아닌 Windows 11이라고 출력된다. 
						location = "C:\\Temp\\download\\"; 
					}
					else if(os.equals("Mac")) { //Mac 
						
					}
					
					MultipartRequest multi = new MultipartRequest(request,
			 			      location,
							  maxSize,
							  "utf-8",
							  new DefaultFileRenamePolicy());
					
					
					
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
					int num = Integer.parseInt(multi.getParameter("num")); 
					title = XssPreventer.escape(title);
					content = XssPreventer.escape(content);
					
					Timestamp modifydate = new Timestamp(System.currentTimeMillis());
					
					Enumeration<?> files = multi.getFileNames();
					
					//업로드한 파일에서 파일 정보 가져오기 
					String element = "";
					String filesystemName = "";
					
					if(files.hasMoreElements()) {
						element = (String)files.nextElement();
						filesystemName = multi.getFilesystemName(element); 
					}
					
				    String newlocation = null;
				    
				    //파일을 수정했을 때
				    if(filesystemName != null) {
				    	//파일을 수정할때는 위에서 업로드한 파일의 경로를 번호에 맞춰서 바꿔준다.
				    	
				    	newlocation = location + num; 
				    	File file = new File(newlocation); 
				    	if(file.exists()) { 
				    		FileUtils.cleanDirectory(file); //수정할 번호 폴더에 파일이 있으면 삭제한다. 
				    	}
				    	
				    	if(os.equals("Linux")) {
				    		newlocation = newlocation + "/" + filesystemName; 
				    	}
				    	else if(os.contains("Windows")) {
				    		newlocation = newlocation + "\\" + filesystemName; 
				    	}
				    	else if(os.equals("Mac")) {
				    		
				    	}
				    	
				    	location = location + filesystemName;
				        Path oldfile = Paths.get(location); //임시로 파일을 업로드한 경로
				        Path newfile = Paths.get(newlocation); //새로 옮길 경로(번호) 
				        
				        Files.move(oldfile, newfile, StandardCopyOption.REPLACE_EXISTING); //옮기기
				    }
				    DownloadDO downloaddo = new DownloadDO(num, title, content, filesystemName, null, modifydate);
			        DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
			        
			        int result = downloaddao.updateTable(downloaddo); 
			        
			        if(result != 0) {
			        	session.removeAttribute("detaildownloadlist");
			        	viewName = "filelist.do"; 
			        }
			        else {
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
		}
		catch(Exception ex) {
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName);
		}
	}

}
