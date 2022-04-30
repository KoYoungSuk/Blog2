<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="testcode" value="${sessionScope.testcode}" />
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
        <h3>Professional Mode</h3>
        <hr>
        <p>DataBase Address: ${sessionScope.dburl} </p>
        <p>DataBase ID: ${sessionScope.dbid} </p>
        <hr>
         <form action="prodbmanage.do" method="GET">
         <table>
         <tr>
         <td><label for="SQLCommand">SQL 명령문 입력</label></td>
         </tr>
         <tr>
         <td><textarea rows="10" cols="100" autofocus name="sqlcommand" wrap="hard" ><c:out value="${requestScope.sqlcommand}" /></textarea></td>
         </tr>
         </table>
         <button class="btn btn-primary" type="submit">EXECUTE</button>
         </form>
         <hr>
         <p>Executed at <c:out value="${requestScope.time}" /></p>
         <hr> 
         <table border="1">
         <c:choose>
           <c:when test="${requestScope.tablenamelist ne null}">
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
          </c:when>
          <c:otherwise>
            <p>TEST</p>
          </c:otherwise>
         </c:choose>
        </table>
      </c:when>
      <c:otherwise>
        <p>You need DataBase URL, ID and Password(Oracle)</p>
      </c:otherwise>
    </c:choose>
     <hr>
    <button class="btn btn-primary" onclick="window.print()">Print</button>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-primary" onclick="location.href='index.jsp'">Back to JSPOracleManager Page</button>
   <button class="btn btn-primary" onclick="location.href='../main.do'">Back to Main Page</button>
   <hr>
    </div>
   <div class="footer">
      Last updated: July 29th, 2021 
      <p></p>
      This is not copyrighted but don't use this illegally.
      <p></p>
      Actually Copyrighted: Oracle, Oracle DataBase and JSP(Java Servlet Page), Java is trademark of Oracle Corporation of America. 
      <p></p>
   </div>
</body>
</html>