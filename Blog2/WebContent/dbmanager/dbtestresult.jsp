<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="testcode" value="${sessionScope.testcode}" />
<c:set var="dbid" value="${sessionScope.dbid}" />
<c:set var="dburl" value="${sessionScope.dburl}" />
<c:set var="error" value="${sessionScope.error}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../BS/bootstrap.min.css">
<link rel="stylesheet" href="../BS/bootstrap.css">
<title>JSPOracleManager</title>
<style>
   .footer{
     text-align: center;
   };
</style>
</head>
<body>
    <div class="container">
   <h1>JSPOracleManager</h1>
   <hr>
   <c:choose>
      <c:when test="${testcode eq 'success'}">
        <p>Connection Success!!</p>
        <p>DB URL: ${dburl} </p>
        <p>DB ID: ${dbid} </p>
        <p>Your Oracle DBMS VER: Oracle DataBase 18c Express Edition</p>
        <button class="btn btn-primary" onclick="location.href='easy.jsp'">Easy DataBase Administrate</button>
        <button class="btn btn-primary" onclick="location.href='professional.jsp'">Professional DataBase Administrate</button>
      </c:when>
      <c:otherwise>
        <p>OOPS! Connection Error </p>
        <p>Error Code: ${error} </p>
      </c:otherwise>
   </c:choose>
     <hr>
   <button class="btn btn-primary"  onclick="location.href='/dbsessiondelete.do'">Session Delete</button>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-primary" onclick="location.href='../main.do'">Back to Main Page</button>
   <hr>
    </div>
   <div class="footer">
      Last updated: July 29th, 2021 
      <p></p>
      NO COPYRIGHT Required, But Don't use this illegally! 
   </div>
</body>
</html>