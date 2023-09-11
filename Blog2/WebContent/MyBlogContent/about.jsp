<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-4" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
       <h3 class="htitle" style="border: ridge;">About PersonalMemo</h3>
       <p>PersonalMemo Version 2.0 (Build 135) </p>
       <p>First Updated: Tuesday, February 25th 2020 </p>
       <p>Last Updated: Wednesday, September 13th, 2023 </p>
       <hr> 
       <c:choose>
       <c:when test="${sessionScope.id ne null }">
       <p><a href="./pdfviewer/environment.html">Development/Server Environment</a></p>
       <p><a href="https://github.com/KoYoungSuk/Blog2.git">GitHub Source</a></p>
       <p><a href="./pdfviewer/">Reason and History</a></p>
       <p><a href="./pdfviewer/old.html">Legacy Pictures About My WebSite. </a></p>
       <p><a href="./pdfviewer/portfoilo.html">Portfoilo</a></p>
       <hr>
       </c:when>
       </c:choose>
       <p>
       <a href="https://www.dnsever.com" target="dnsever"><img src="https://banner.dnsever.com/dnsever-banner_170x35.gif" border="0" alt="DNS server, DNS service"></a>
       </p>
       <hr>
       <p>This is not copyrighted. But don't use this illegally.</p>
       <p>Java, Oracle,  Oracle DataBase are trademark of Oracle Corporation of America. </p>
       <p>So Some context are copyrighted by Oracle Corporation. You must notice this. </p>
</div>