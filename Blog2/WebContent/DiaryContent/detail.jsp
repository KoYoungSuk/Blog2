<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <c:choose>
	 <c:when test="${sessionScope.id eq 'admin' }">
	 <table border="1">
	 <tr>
	  <td><label for="title">제목:</label></td>
	  <td><c:out value="${sessionScope.detaildiarylist[0]}" /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><c:out value="${sessionScope.detaildiarylist[1]}" /></td>
	</tr>
	<tr>
	  <td><label for="savedate">작성 날짜:</label></td>
	  <td><c:out value="${sessionScope.detaildiarylist[2]}" /></td>
	</tr>
	<tr>
	  <td><label for="modifydate">수정 날짜:</label></td>
	  <td><c:out value="${sessionScope.detaildiarylist[3]}" /></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" onclick="location.href='modifydiary?title=${sessionScope.detaildiarylist[0]}'" type="button">Modify</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diary.jsp?page=1'" type="button">Back To Main Page(PersonalDiary)</button>
	<button class="btn btn-primary" onclick="location.href='../main.do'" type="button">Back To Main Page(MyBlog)</button>
	  </c:when>
	 <c:otherwise>
	   <p>Administrator Only.</p>
	 </c:otherwise>
	 </c:choose>