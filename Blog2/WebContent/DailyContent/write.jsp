<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
   <form action="writedaily" method="POST">
    <div style="text-align: right;">
    <button class="btn btn-secondary btn-sm" onclick="history.go(-1);" type="button"><span class="material-symbols-outlined">arrow_back</span>Back</button>
    <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>&nbsp;&nbsp; 
	</div>
	<hr>
	<table class="table" style="background-color: lightyellow; ">
	<tr>
	  <td><label for="title" style="font-weight: bold; font-size: 20px; ">날짜:</label></td>
	  <td><input class="form-control mr-sm-10" type="text" id="txttitle" name="title" value="${param.title}" required  readonly /></td>
	</tr>
	<tr>
	  <td><label for="content" style="font-weight: bold; font-size: 20px; ">내용:</label></td>
	  <td><textarea class="form-control mr-sm-10" rows="20" cols="80" name="content" id="txtcontext" autofocus wrap="hard"></textarea></td>
	</tr>
	<tr>
	<td><p><label for="status" style="font-weight: bold; font-size: 20px; ">달성 여부</label></p></td>
	<td>
	 <input type="radio" class="custom-control-input" name="status" id="jb-radio-1" value="Yes">
     <label class="custom-control-label" for="jb-radio-1">일정 달성</label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="radio" class="custom-control-input" name="status" id="jb-radio-2" value="No" checked>
     <label class="custom-control-label" for="jb-radio-2">일정 미달성</label>
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