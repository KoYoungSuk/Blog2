<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <div class="container" style="margin-top:20px">
    <div class="row">
     <div class="col-sm-12">
       <H1>About</H1>
       <hr>
       <p>First Updated: Tuesday, February 25th 2020 </p>
       <p>Last Updated: Monday, May 16th 2022 </p>
       <c:choose>
       <c:when test="${sessionScope.id ne null }">
       <p>Based Language: HTML5, CSS, JavaScript, JSP(Java Server Page)</p>
       <p>Server Operating System: <% out.println(System.getProperty("os.name")); %></p>
       <p>Server Info: <%= application.getServerInfo() %></p>
       <p>OpenJDK Version: OpenJDK Ver 8(Development)/OpenJDK Ver 11(Real Server) </p>
       <p>Framework: Bootstrap 4/W3.CSS </p>
       <p>DataBase: Oracle DataBase 18c Express Edition </p>
       <hr>
       <p>
       <a href="https://www.dnsever.com" target="dnsever"><img src="https://banner.dnsever.com/dnsever-banner_170x35.gif" border="0" alt="DNS server, DNS service"></a>
       </p>
       <hr>
       <p><a href="http://kysot.yspersonal.com/download"> Download Center(Source and Tools)</a><p>
       <p><a href="https://github.com/KoYoungSuk/Blog2.git">GitHub Source</a></p>
       <hr>
       </c:when>
       </c:choose>
       <p>This is not copyrighted. But don't use this illegally.</p>
       <p>Java, Oracle,  Oracle DataBase and JSP(Java Server Page) are trademark of Oracle Corporation of America. </p>
       <p>So Some context are copyrighted by Oracle Corporation. You must notice this. </p>
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     </div>
    </div>
   </div>