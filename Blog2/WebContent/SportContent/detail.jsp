<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifysport?title=${sessionScope.detailsportlist['title']}'"><span class="material-symbols-outlined">create</span>Modify</button>
<button class="btn btn-danger btn-sm" onclick="location.href='deletesport?title=${sessionScope.detailsportlist['title']}'"><span class="material-symbols-outlined">delete</span>Delete</button>&nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
<tr>
 <td style="font-weight: bold; font-size: 20px; ">운동 일자:</td>
 <td>${sessionScope.detailsportlist['title']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">이동 거리(걸음수): </td>
 <td>${sessionScope.detailsportlist['distance']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">소모 칼로리(Kcal): </td>
 <td>${sessionScope.detailsportlist['calories']}Kcal</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">등록 날짜: </td>
 <td>${sessionScope.detailsportlist['savedate']}</td>
</tr>
</table>
<br> 
</c:when>
<c:otherwise> 
  <script>
    alert("관리자만 사용 가능합니다.");
    history.go(-1); 
  </script>
</c:otherwise>
</c:choose> 