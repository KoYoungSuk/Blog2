<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="diarytitle" value="${sessionScope.detaildiarylist['title']}" />
<div style="text-align: right;">
    <button class="btn btn-secondary btn-sm" onclick="history.go(-1);" type="button"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
	<button class="btn btn-secondary btn-sm" onclick="saveAsFile();" type="button"><span class="material-symbols-outlined">save_as</span>Save as TXT</button>
	<button class="btn btn-secondary btn-sm" onclick="location.href='modifydiary?title=${diarytitle}'" type="button"><span class='material-symbols-outlined'>create</span>Modify</button>
	<button class="btn btn-danger btn-sm" onclick="location.href='deletediary?title=${diarytitle}'" type="button"><span class="material-symbols-outlined">delete</span>Delete</button>
	&nbsp;&nbsp;&nbsp;
</div>
<br> 
	<table class="table" style="background-color: lightyellow;">
	 <tr>
	  <td><label for="title">제목:</label></td>
	  <td id="txttitle">${diarytitle}</td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td id="txtcontent">${sessionScope.detaildiarylist['content']}</td>
	</tr>
	<tr>
	  <td><label for="savedate">작성 날짜:</label></td>
	  <td>${sessionScope.detaildiarylist['savedate']}</td>
	</tr>
	<tr>
	  <td><label for="modifydate">수정 날짜:</label></td>
	  <td>${sessionScope.detaildiarylist['modifydate']}</td>
	</tr>
	</table>
<hr>
<br> 
