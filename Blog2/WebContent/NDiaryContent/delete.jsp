<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="deletediary" method="POST">
  <div style="text-align: right;">
      <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
      <button class="btn btn-danger btn-sm" type="submit"><span class="material-symbols-outlined">delete</span>Delete</button>
	  &nbsp;&nbsp; 
 </div>
 <br> 
	<table class="table">
	   <tr>
	    <td><label for="title" style="font-weight: bold; font-size: 20px;">제목:</label></td>
	    <td><input class="form-control mr-sm-10" type="text" name="title" value= "${sessionScope.detaildiarylist['title']}" readonly /></td>
	    </tr>
	   <tr>
	  <td><label for="context" style="font-weight: bold; font-size: 20px;">내용:</label></td>
	  <td><textarea class="form-control mr-sm-10" rows="20" cols="100" name="context" autofocus wrap="hard" readonly>${sessionScope.detaildiarylist['content']}</textarea></td>
	  </tr>
	  <tr>
	   <td><label for="savedate" style="font-weight: bold; font-size: 20px;">작성 날짜:</label></td>
	   <td><input class="form-control mr-sm-10" type="text" name="savedate" value="${sessionScope.detaildiarylist['savedate']}" readonly /></td>
	  </tr>
	  <tr>
	   <td><label for="savedate" style="font-weight: bold; font-size: 20px;">수정 날짜:</label></td>
	   <td><input class="form-control mr-sm-10" type="text" name="modifydate" value="${sessionScope.detaildiarylist['modifydate']}" readonly /></td>
	  </tr>
	</table>
</form>
</c:when>
<c:otherwise>
 <script>
   alert("Administrator Only.");
   history.go(-1); 
 </script>
</c:otherwise>
</c:choose> 