<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="deletedaily" method="POST">
  <div style="text-align: right;">
      <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
      <button class="btn btn-danger btn-sm" type="submit"><span class="material-symbols-outlined">delete</span>Delete</button>
	  &nbsp;&nbsp; 
 </div>
 <hr> 
 <table class="table">
	  <tr>
	  <td style="font-weight: bold; ">일정 날짜:</td>
	  <td>
	  ${sessionScope.detaildailylist['title']}
	  <input type="hidden" name="title" value="${sessionScope.detaildailylist['title']}" />
	  </td>
	  </tr>
	  <tr>
	  <td style="font-weight: bold;">일정 내용:</td>
	  <td>${sessionScope.detaildailylist['content']}</td>
	  </tr>
	  <tr>
	   <td style="font-weight: bold;">작성 날짜:</td>
	   <td>${sessionScope.detaildailylist['savedate']}</td>
	  </tr>
	  <tr>
	   <td style="font-weight: bold;">수정 날짜:</td>
	   <td>${sessionScope.detaildailylist['modifydate']}</td>
	  </tr>
	  <tr>
	   <td style="font-weight: bold;">달성 여부: </td>
	   <td>${sessionScope.detaildailylist['status']}</td>
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