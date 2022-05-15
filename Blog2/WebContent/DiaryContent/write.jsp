<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
	 <c:when test="${sessionScope.id eq 'admin' }">
	   <form action="writediary" method="POST">
	  <table>
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><input type="text" name="title" required /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea rows="15" cols="61" name="context" autofocus wrap="hard"></textarea></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" type="submit">Write</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diarylist?desc=0'" type="button">Back To The Main Page(PersonalDiary)</button>
	<button class="btn btn-primary" onclick="location.href='../main.do'" type="button">Back To The Main Page(MyBlog)</button>
	</form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
	</c:choose>