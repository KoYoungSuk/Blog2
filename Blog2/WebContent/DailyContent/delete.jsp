<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<form action="deletedaily" method="POST">
  <div style="text-align: right;">
      <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
      <button class="btn btn-danger btn-sm" type="submit"><span class="material-symbols-outlined">delete</span>Delete</button>
	  &nbsp;&nbsp; 
 </div>
	<table class="table">
	   <tr>
	    <td><label for="title">날짜:</label></td>
	    <td><input class="form-control mr-sm-10" type="text" name="title" value= "${sessionScope.detaildailylist['title']}" readonly /></td>
	    </tr>
	   <tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea class="form-control mr-sm-10" rows="20" cols="100" name="context" autofocus wrap="hard" readonly>${sessionScope.detaildailylist['content']}</textarea></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">작성 시간:</label></td>
	   <td><input class="form-control mr-sm-10" type="text" name="savedate" value="${sessionScope.detaildailylist['savedate']}" readonly /></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">수정 시간:</label></td>
	   <td><input class="form-control mr-sm-10" type="text" name="modifydate" value="${sessionScope.detaildailylist['modifydate']}" readonly /></td>
	  </tr>
	  <tr>
	   <td><label for="status">달성 여부:</label></td>
	   <td>${sessionScope.detaildailylist['status']}</td>
	  </tr>
	</table>
</form>