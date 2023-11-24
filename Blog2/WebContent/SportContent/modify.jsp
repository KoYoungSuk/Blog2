<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="modifysport" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Modify</button>
 &nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="title" style="font-weight: bold; font-size: 20px; ">운동 일자</label></td>
  <td><input type="text" class="form-control mr-sm-10" name="title" value="${sessionScope.detailsportlist['title']}" required readonly /></td>
 </tr> 
 <tr>
  <td><label for="distance" style="font-weight: bold;  font-size: 20px; "> 이동 거리 </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="distance" value="${sessionScope.detailsportlist['distance']}" required /></td>
 </tr>
 <tr>
  <td><label for="calories" style="font-weight: bold; font-size: 20px; "> 소모 칼로리(Kcal) </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="calories" value="${sessionScope.detailsportlist['calories']}" required />Kcal</td>
 </tr>
</table>
</form>
<br> 
</c:when>
<c:otherwise>
 <script>
   alert("Administrator Only.");
   history.go(-1); 
 </script>
</c:otherwise>
</c:choose> 