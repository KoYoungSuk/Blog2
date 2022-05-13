<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
    <c:when test="${sessionScope.id eq 'admin' }">
	  <form action="writediary" method="POST">
	
	  </form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
</c:choose>