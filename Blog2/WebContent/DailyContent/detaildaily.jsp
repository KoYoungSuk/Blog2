<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="dailytitle" value="${sessionScope.dailydetaillist['title']}" />
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<c:choose>
<c:when test="${dailytitle eq null}">
<button class="btn btn-secondary btn-sm" onclick="location.href='daily.jsp?page=3'"><span class="material-symbols-outlined">create</span>Write</button>
</c:when>
<c:otherwise>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifydaily?title=${dailytitle}'"><span class="material-symbols-outlined">create</span>Modify</button>
</c:otherwise>
</c:choose>
<button class="btn btn-danger btn-sm" onclick="location.href='deletedaily?title=${dailytitle}'"><span class="material-symbols-outlined">delete</span>Delete</button>&nbsp;&nbsp; 
</div>
<hr> 
<table class="table" style="background-color: lightyellow;">
<tr>
 <td style="font-weight: bold; font-size: 20px; ">일정 날짜:</td>
 <td>${dailytitle}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">일정 내용:</td>
 <td>${sessionScope.dailydetaillist['content']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">작성 날짜: </td>
 <td>${sessionScope.dailydetaillist['writedate']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">수정 날짜: </td>
 <td>${sessionScope.dailydetaillist['modifydate']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달성 여부: </td>
 <td>
 ${sessionScope.dailydetaillist['status']}
 </td>
</tr>
</table>
<br> 
</c:when>
<c:otherwise>
  <script>
    alert("Administrator Only.");
    history.go(-1); 
  </script>
</c:otherwise>
</c:choose>