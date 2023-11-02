<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
   <c:when test="${param.pagenum_info eq null}">
      <c:set var="pagenumber" value="1" /> 
   </c:when>
   <c:otherwise>
      <c:set var="pagenumber" value="${param.pagenum_info}" />
   </c:otherwise>
</c:choose> 
<hr> 
<form action="detailinfo" method="POST">
<div style="text-align: center;">
<input type="text" class="form-control-sm" name="title" placeholder="Search By Word" /> 
&nbsp;&nbsp;
<button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Search</button> 
&nbsp;&nbsp; 
<button type="button" onclick="location.href='list.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
&nbsp;&nbsp; 
<button type="button" class="btn btn-secondary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
</div>
</form>
<hr>
<table class="table" style="background-color: lightyellow;">
  <thead>
   <tr>
   <th>TITLE</th>
   <th>SAVEDATE</th>
   <th>MODIFYDATE</th>
   <th>Delete</th>
   </tr>
  </thead>
  <tbody>
  <c:forEach var="InfoDO" items= "${sessionScope.totalinfolist}" begin="${sessionScope.beginnumber_info}" end="${sessionScope.endnumber_info}">
   <tr>
   <td><a href="detailinfo?page=2&title=${InfoDO.title}"><c:out value="${InfoDO.title}" /></a></td>
   <td><c:out value="${InfoDO.savedate}" /></td>
   <td><c:out value="${InfoDO.modifydate}" /></td>
   <td>
    <button class="btn btn-secondary btn-sm" onclick="location.href='deleteinfo?title=${InfoDO.title}'" type="button"><span class="material-symbols-outlined">delete</span></button>
   </td>
   </tr>
  </c:forEach>
  </tbody>
</table>
<hr>
<div style="text-align: center;">
 <h4 style="weight: bold;">
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='infolist?pagenum_info=${pagenumber - 1}'"><span class="material-symbols-outlined">arrow_back_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;&nbsp;&nbsp;
          PAGE ${pagenumber} 
          &nbsp;&nbsp;&nbsp;&nbsp;
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.pagecount_info}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='infolist?pagenum_info=${pagenumber + 1}'"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
          </h4>
<hr> 
<c:forEach var="num" begin="1" end="${sessionScope.pagecount_info}">
      <button type="button" class="btn btn-secondary" onclick="location.href='infolist?page_count_diary=${num}'">${num}</button>
</c:forEach>
</div> 