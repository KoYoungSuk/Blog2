<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<hr>
<form action="detaildaily" method="POST">
<div style="text-align: center;">
<input type="text" class="form-control-sm" name="title" placeholder="Search By Title" /> 
&nbsp;&nbsp;
<button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Search</button> 
&nbsp;&nbsp; 
<button type="button" onclick="location.href='daily.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
&nbsp;&nbsp; 
<button type="button" class="btn btn-secondary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
</div>
</form>
<hr>
<table class="table" style="background-color: lightyellow;">
  <thead>
   <tr>
   <th>TITLE</th>
   <th>STATUS</th>
   <th>WRITEDATE</th>
   <th>MODIFYDATE</th>
   <th>Delete</th>
   </tr>
  </thead>
  <tbody>
  <c:forEach var="DailyDO" items= "${sessionScope.totaldailylist}">
   <tr>
   <td><a href="detaildaily?title=${DailyDO.title}"><c:out value="${DailyDO.title}" /></a></td>
   <td><c:out value="${DailyDO.status}" /></td>
   <td><c:out value="${DailyDO.writedate}" /></td>
   <td><c:out value="${DailyDO.modifydate}" /></td>
   <td>
    <button class="btn btn-secondary btn-sm" onclick="location.href='deletedaily?title=${DailyDO.title}'" type="button"><span class="material-symbols-outlined">delete</span></button>
   </td>
   </tr>
  </c:forEach>
  </tbody>
</table>
