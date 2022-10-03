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
<title>JSPMyManager</title>
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
      <c:when test="${sessionScope.testcode eq 'success'}">
        <h3>Easy Mode</h3>
        <hr>
        <h6>SQL 명령문이 아닌 버튼을 통해 데이터베이스 연산을 수행할 수 있음. </h6>
        <h6>사용 가능한 연산: DML: 테이블 조회(select), 테이블 삭제(delete) </h6>
        <h6>테이블을 삭제할때는 식별자의  속성과 값을 반드시 입력해야 합니다. </h6>
        <h6>DataBase URL: ${sessionScope.dburl} </h6>
        <h6>DataBase ID: ${sessionScope.dbid} </h6>
        <hr>
         <form action="easytableselect.do" method="POST">
         <table>
         <tr>
         <td><label for="Tablename">Tablename:</label></td>
         <td><input type="text" name="tablename" value='${requestScope.tablename}' required /></td>
         </tr>
         <tr>
         <td><label for="identifiername">Attribute:</label></td>
         <td><input type="text" name="name" value='${requestScope.attribute}' /></td>
         </tr>
         <tr>
         <td><label for="identifiervalue">Value</label></td>
         <td><input type="text" name="value" value='${requestScope.value}' /></td>
         </tr>
         <tr>
         <td><label for="Mode">Mode(DML): </label></td>
         <td><input type="radio" name="mode" value="select" checked />Select</td>
         <td><input type="radio" name="mode" value="delete"  />Delete</td>
         </tr>
         </table>
         <button class="btn btn-primary" onclick="history.go(-1));">Execute</button>
         </form>
         <hr>
         <p>Executed at <c:out value="${requestScope.time}" /></p>
         <p>Degree(Number of Attributes): <c:out value="${requestScope.degree}" /></p>
         <p>Cardinality(Number of Tuples): <c:out value="${requestScope.tuple}" /></p>
         <p>Schema: Header Instance: Content </p>
         <hr>
         <c:choose>
          <c:when test="${requestScope.tablenamelist ne null}">
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
        <c:choose>
          <c:when test="${requestScope.updatestatus ne null}">
           <p>Success Executed.</p>
          </c:when>
          <c:otherwise>
           <p>Please Execute Query.. </p>
          </c:otherwise>
        </c:choose>
      </c:otherwise>
    </c:choose>
   </c:when>
   <c:otherwise>
     <p>You need DataBase URL, ID and Password(Oracle)</p>
   </c:otherwise>
   </c:choose>
   <hr>
   <button class="btn btn-primary" onclick="window.print()">Print</button>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-primary" onclick="location.href='../disconnectdb.do?check=j'">Back to JSPOracleManager Page</button>
   <button class="btn btn-primary" onclick="location.href='../disconnectdb.do?check=m'">Back to Main Page</button>
   <hr>
    </div>
   <div class="footer">
      Last updated: July 29th, 2021 
      <p></p>
      NO COPYRIGHT Required, But Don't use this illegally! 
   </div>
</body>
</html>