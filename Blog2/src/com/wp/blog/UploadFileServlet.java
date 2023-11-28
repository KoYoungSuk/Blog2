package com.wp.blog;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhncorp.lucy.security.xss.XssPreventer;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wp.blog.DAO.DownloadDAO;
import com.wp.blog.DTO.DownloadDO;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/uploadfile.do")
public class UploadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFileServlet() {
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
		String viewName = null;
		HttpSession session = request.getSession();
		
		
		int maxSize = 1024 * 1024 * 1024 * 5;
		String id = (String)session.getAttribute("id"); 
		
		//Database Connection String from web.xml 
		ServletContext application = request.getSession().getServletContext();
    	String JDBC_Driver = application.getInitParameter("jdbc_driver");
  	    String db_url = application.getInitParameter("db_url");
  	    String db_id = application.getInitParameter("db_userid");
  	    String db_pw = application.getInitParameter("db_password");
  	    
  	    Timestamp savedate = new Timestamp(System.currentTimeMillis()); //현재 날짜
	    
		try {
			if(id != null) {
				if(id.equals("admin")) {
					String os = System.getProperty("os.name"); //OS 버전 검사 
					
					DownloadDAO downloaddao = new DownloadDAO(JDBC_Driver, db_url, db_id, db_pw);
					
					int maxnum = downloaddao.getMaxnum(); //최대값 구하기
					
					maxnum = maxnum + 1; 
					
					String location = null;
					
					//번호폴더 생성 
					if(os.equals("Linux")) { //Linux 
						location = "/mnt/hdd3/TextFiles/download/" + maxnum;
					}
					else if(os.contains("Windows")) { //Windows 
						//참고로 JDK 11에서는 Windows 11을 실행하는 경우 Windows 10이 아닌 Windows 11이라고 출력된다. 
						location = "C:\\Temp\\download\\" + maxnum; 
					}
					else if(os.equals("Mac")) { //Mac 
						
					}
					
					Path directoryPath = Paths.get(location); //디렉터리 경로 설정 
					
					if(!Files.exists(directoryPath)) { //존재하지 않으면 
						Files.createDirectory(directoryPath);  //디렉터리 생성 
					}
					
					if(os.equals("Linux")) {  //Linux 
						location = location + "/"; 
					}
					else if(os.contains("Windows")) { //Windows 
						location = location + "\\"; 
					}
					else if(os.equals("Mac")) { //Mac 
						
					}
					
					//이제 정보를 데이터베이스에 기록한다. (파일 업로드는 여기서 완료된다.) 
					MultipartRequest multi = new MultipartRequest(request,
			 			      location,
							  maxSize,
							  "utf-8",
							  new DefaultFileRenamePolicy());
					
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
					title = XssPreventer.escape(title);
					content = XssPreventer.escape(content);
					
					//업로드한 파일에서 파일 정보 가져오기 
					Enumeration<?> files = multi.getFileNames();
					String element = "";
					String filesystemName = "";
					if(files.hasMoreElements()) {
						element = (String)files.nextElement();
						filesystemName = multi.getFilesystemName(element); 
					}
					
					DownloadDO downloaddo = new DownloadDO(maxnum, title, content, filesystemName, savedate, savedate);
					
					int result = downloaddao.uploadTable(downloaddo);
					
					if(result != 0) {
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
		    ex.getStackTrace(); 
			g.jsmessage(ex.getMessage());
		}
		
		if(viewName != null) {
			response.sendRedirect(viewName); 
		}
	}

}
