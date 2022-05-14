<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
    <c:when test="${sessionScope.id eq 'admin' }">
	  <form action="deletediary" method="POST">
	   <table>
	   <tr>
	    <td><label for="title">제목:</label></td>
	    <td><input type="text" name="title" value= "${sessionScope.detaildiarylist[0]}" readonly /></td>
	    </tr>
	   <tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea rows="15" cols="61" name="context" autofocus wrap="hard" readonly>${sessionScope.detaildiarylist[1]}</textarea></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">작성 시간:</label></td>
	   <td><input type="text" name="savedate" value="${sessionScope.detaildiarylist[2]}" readonly /></td>
	  </tr>
	  <tr>
	   <td><label for="savedate">작성 시간:</label></td>
	   <td><input type="text" name="savedate" value="${sessionScope.detaildiarylist[2]}" readonly /></td>
	  </tr>
	  </table>
	  <button class="btn btn-danger" type="submit">Delete</button>
	  <button class="btn btn-success" type="button" onclick="history.go(-1);">Back</button>
	  <button class="btn btn-success" type="button" onclick="location.href='diarylist'">Back To DiaryList</button>
	  <button class="btn btn-success" type="button" onclick="location.href='../main.do'">Back To Main Page</button>
	 </form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
</c:choose>