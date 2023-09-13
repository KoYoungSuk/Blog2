<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<form action="modifyinfo" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
 <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='infolist'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to List</button>
 &nbsp;&nbsp; 
</div>
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="title">제목: </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="title" value="${sessionScope.infodetaillist['title']}" readonly /></td>
 </tr>
 <tr>
  <td><label for="content">내용: </label></td>
  <td><textarea class="form-control mr-sm-10" rows="20" cols="100" name="content" required>${sessionScope.infodetaillist['content']}</textarea></td>
 </tr>
 <tr>
  <td><label for="savedate">작성 날짜: </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="savedate" value="${sessionScope.infodetaillist['savedate']}"  readonly /></td>
 </tr>
 <tr>
  <td><label for="modifydate">수정 날짜: </label></td>
  <td><input type="text" class="form-control mr-sm-10" name="modifydate" value="${sessionScope.infodetaillist['modifydate']}" readonly /></td>
 </tr>
</table>
</form>
<br> 