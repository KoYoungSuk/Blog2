<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
       <h3 class="htitle" style="border: ridge;">About PersonalWeb</h3>
       <H5 style="text-align: center; font-weight: bold; font-size: 50px; ">PERSONAL WEB</H5>
       <p>&nbsp;&nbsp;PersonalWeb Version 3.2 (Build 211) </p>
       <p>&nbsp;&nbsp;NOTICE: PersonalWeb 4.0 coming soon with Spring Framework...  </p> 
       <p>&nbsp;&nbsp;First Updated: Tuesday, February 25th, 2020 </p>
       <p>&nbsp;&nbsp;Last Updated: Sunday,  December 3rd, 2023 </p>
       <hr> 
       <c:choose>
       <c:when test="${sessionScope.id ne null}">
       <p>&nbsp;&nbsp;<a href="./pdfviewer/index.jsp?pdffile=Environment.pdf">Development/Server Environment</a></p>
       <p>&nbsp;&nbsp;<a href="https://github.com/KoYoungSuk/Blog2.git">GitHub Source</a></p>
       <p>&nbsp;&nbsp;<a href="./pdfviewer/index.jsp?pdffile=WhyIMakethis.pdf">Reason and History</a></p>
       <p>&nbsp;&nbsp;<a href="./pdfviewer/index.jsp?pdffile=Portfoilo.pdf">Portfoilo</a></p>
       <hr>
       </c:when>
       <c:otherwise></c:otherwise> 
       </c:choose>
       <div style="text-align: center;"> 
       <a href="https://www.dnsever.com" target="dnsever"><img src="https://banner.dnsever.com/dnsever-banner_170x35.gif" border="0" alt="DNS server, DNS service"></a>
       </div> 
       <hr>
       <p>&nbsp;&nbsp;This is not copyrighted. But don't use this illegally.</p>
       <p>&nbsp;&nbsp;Java, Oracle,  Oracle DataBase are trademark of Oracle Corporation of America. </p>
       <p>&nbsp;&nbsp;So Some context are copyrighted by Oracle Corporation. You must notice this. </p>
</div>