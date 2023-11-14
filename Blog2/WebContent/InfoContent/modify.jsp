<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="modifyinfo" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
 &nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="title" style="font-weight: bold;  font-size: 20px; ">제목: </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="title" value="${sessionScope.infodetaillist['title']}" readonly /></td>
 </tr>
 <tr>
  <td><label for="content" style="font-weight: bold; font-size: 20px; ">내용: </label></td>
  <td><textarea class="form-control mr-sm-10" rows="20" cols="100" name="content" required>${sessionScope.infodetaillist['content']}</textarea></td>
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