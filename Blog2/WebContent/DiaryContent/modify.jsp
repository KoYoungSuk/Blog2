<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<h2>Modify Diary</h2>
<hr>
	 <form action="modifydiary" method="POST">
	  <table>
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><input type="text" name="title" value= "${sessionScope.detaildiarylist['title']}" readonly /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea id="txtcontent" rows="15" cols="61" name="context" autofocus wrap="hard">${sessionScope.detaildiarylist['content']}</textarea></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" type="submit">Modify</button>
	<button class="btn btn-primary" type="button" onclick="openTextFile();">Open Text Document</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diarylist?desc=0'" type="button">Back To DiaryList</button>
	<button class="btn btn-primary" onclick="location.href='../main.do'" type="button">Back To MyBlog</button>
	</form>