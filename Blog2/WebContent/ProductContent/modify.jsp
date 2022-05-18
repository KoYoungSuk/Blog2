<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}">
  <script>
  alert("Administrator Only.");
  window.location.replace("http://home.yspersonal.com/signout.do?check=3");
  </script>
</c:when>
<c:otherwise>
  
</c:otherwise>
</c:choose>
