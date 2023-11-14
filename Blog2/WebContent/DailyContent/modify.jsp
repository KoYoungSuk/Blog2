<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="modifydaily" method="POST">
  <div style="text-align: right;">
    <button class="btn btn-secondary btn-sm" onclick="history.go(-1);" type="button"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
	<button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Modify</button>&nbsp;&nbsp; 
  </div>
  <hr> 
   <table class="table" style="background-color: lightyellow;">
	<tr>
	  <td><label for="title" style="font-weight: bold; font-size: 20px; ">날짜:</label></td>
	  <td><input class="form-control" type="text" name="title" value= "${sessionScope.detaildailylist['title']}" readonly /></td>
	</tr>
	<tr>
	  <td><label for="context" style="font-weight: bold; font-size: 20px; ">내용:</label></td>
	  <td><textarea class="form-control" id="txtcontent" rows="20" cols="100" name="content" autofocus wrap="hard">${sessionScope.detaildailylist['content']}</textarea></td>
	</tr>
	<tr>
	<td><p><label for="status" style="font-weight: bold; font-size: 20px; ">달성 여부</label></p></td>
	<td>
	<c:choose>
	  <c:when test="${sessionScope.detaildailylist['status'] eq 'Yes'}">
	    <input type="radio" class="custom-control-input" name="status" id="jb-radio-1" value="Yes" checked>
        <label class="custom-control-label" for="jb-radio-1">일정 달성</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" class="custom-control-input" name="status" id="jb-radio-2" value="No">
        <label class="custom-control-label" for="jb-radio-2">일정 미달성</label>
	  </c:when>
	  <c:when test="${sessionScope.detaildailylist['status'] eq 'No'}">
	    <input type="radio" class="custom-control-input" name="status" id="jb-radio-1" value="Yes" >
        <label class="custom-control-label" for="jb-radio-1">일정 달성</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" class="custom-control-input" name="status" id="jb-radio-2" value="No" checked>
        <label class="custom-control-label" for="jb-radio-2">일정 미달성</label>
	  </c:when>
	  <c:otherwise></c:otherwise> 
	</c:choose>
    </td>
	</tr>
	</table>
</form>
<hr>
<br> 
</c:when>
<c:otherwise>
  <script>
    alert("Administrator Only.");
    history.go(-1); 
  </script>
</c:otherwise>
</c:choose>