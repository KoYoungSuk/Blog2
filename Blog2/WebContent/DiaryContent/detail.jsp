<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<h2>Detail Diary</h2>
<hr>
	 <table border="1">
	 <tr>
	  <td><label for="title">제목:</label></td>
	  <td id="txttitle">${sessionScope.detaildiarylist['title']}</td>
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
	<button class="btn btn-primary" onclick="location.href='modifydiary?title=${sessionScope.detaildiarylist['title']}'" type="button">Modify</button>
	<button class="btn btn-primary" onclick="location.href='deletediary?title=${sessionScope.detaildiarylist['title']}'" type="button">Delete</button>
	<button class="btn btn-primary" onclick="saveAsFile();" type="button">Save As TXT</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diary.jsp?page=1'" type="button">Back To PersonalDiary</button>
	<button class="btn btn-primary" onclick="location.href='../main.do'" type="button">Back To MyBlog</button>
