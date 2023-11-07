<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- OLD FASHIONED -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  Mobile Friendly Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PDF Upload Page</title>
<style>
   body{
       font-family: "Bookman Old Style", Georgia, serif;
       background-color: lightyellow; 
   }
   button{
      font-family: "Bookman Old Style", Georgia, serif;
      font-size: 16px;
      font-weight: bold; 
   }
</style>
</head>
<body>
  <H2 style="font-weight: bold;">PDF Upload</H2>
  <hr>
  <c:choose>
  <c:when test="${sessionScope.id eq 'admin'}">
  <table border="1">
     <thead>
       <tr>
       <th>FileName</th>
       <th>Savedate</th>
       <th>Delete</th> 
       </tr>
     </thead>
     <tbody>
       <c:forEach var="PDFDTO" items="${sessionScope.pdflist}">
       <tr>
       <td><c:out value="${PDFDTO.filename}" /></td>
       <td><c:out value="${PDFDTO.savedate}" /></td>
       <td><a href="deletepdf.do?filename=${PDFDTO.filename}" >Delete</a></td> 
       </tr>
       </c:forEach>
     </tbody>
  </table>
  <form action="pdfupload.do" method="POST"  enctype="multipart/form-data">
     <input type="file" name="file" /> 
     <div style="text-align: center;">
        <button type="submit" style="text-align: center; padding: 20px 40px; ">Upload</button>
        <button type="button" style="text-align: center; padding: 20px 40px; " onclick="history.go(-1); ">Back</button>
    </div> 
  </form>
  </c:when>
  <c:otherwise>
    <style>history.go(-1);</style>
  </c:otherwise> 
  </c:choose> 
</body>
</html>