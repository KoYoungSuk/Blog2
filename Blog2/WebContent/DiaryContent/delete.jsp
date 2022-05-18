<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
    <c:when test="${sessionScope.id eq 'admin' }">
	  <form action="deletediary" method="POST">
	   <table>
	   <tr>
	    <td><label for="title">제목:</label></td>
	    <td><input type="text" name="title" value= "${sessionScope.detaildiarylist['title']}" readonly /></td>
	    </tr>
	   <tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea rows="15" cols="61" name="context" autofocus wrap="hard" readonly>${sessionScope.detaildiarylist['content']}</textarea></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">작성 시간:</label></td>
	   <td><input type="text" name="savedate" value="${sessionScope.detaildiarylist['savedate']}" readonly /></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">수정 시간:</label></td>
	   <td><input type="text" name="modifydate" value="${sessionScope.detaildiarylist['modifydate']}" readonly /></td>
	  </tr>
	  </table>
	  <button class="btn btn-danger" type="submit">Delete</button>
	  <button class="btn btn-success" type="button" onclick="history.go(-1);">Back</button>
	  <button class="btn btn-success" type="button" onclick="location.href='diarylist?desc=0'">Back To DiaryList</button>
	  <button class="btn btn-success" type="button" onclick="location.href='../main.do'">Back To MyBlog</button>
	 </form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
</c:choose>