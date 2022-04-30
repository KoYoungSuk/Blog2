<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
        <h3>Easy Mode</h3>
        <hr>
        <h6>SQL 명령문이 아닌 버튼을 통해 테이블 조회, 수정, 값 입력 및 삭제가 가능합니다.(테이블 생성 기능은 추후 구현예정)</h6>
        <h6>DataBase URL: ${sessionScope.dburl} </h6>
        <h6>DataBase ID: ${sessionScope.dbid} </h6>
        <hr>
         <form action="easytableselect.do" method="GET">
         <table>
         <tr>
         <td><label for="Tablename">Tablename:</label></td>
         <td><input type="text" name="tablename" required /></td>
         </tr>
         </table>
         <button class="btn btn-primary" onclick="history.go(-1));">테이블 조회</button>
         </form>
         <hr>
         <c:choose>
          <c:when test="${requestScope.tablename ne null}">
               <p>Table Name: ${requestScope.tablename} </p>
               <table border="1">
               <thead>
               <tr>
               <c:forEach var="TableHeader" items="${requestScope.tableheaderlist}">
               <th><c:out value="${TableHeader}" /></th>
               </c:forEach>
               </tr>
               </thead>
               <tbody>
               <c:forEach var="TableName" items="${requestScope.tablenamelist}" >
               <tr>
               <c:forEach var="TableName2" items="${TableName}">
               <td><c:out value="${TableName2}" /></td>
               </c:forEach>
               </tr>
               </c:forEach>
               </tbody>
               </table>
          </c:when>
      <c:otherwise>
        <p>You need DataBase URL, ID and Password(Oracle)</p>
      </c:otherwise>
    </c:choose>
   </c:when>
   </c:choose>
     <hr>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-primary" onclick="location.href='/index.jsp'">Back to JSPOracleManager Page</button>
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