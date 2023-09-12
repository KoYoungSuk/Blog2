<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MailTest (Ubuntu SendMail)</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	 
<!--  Mobile Friendly Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  Bootstrap 4.4 CSS -->
<link rel="stylesheet" href="./BS/bootstrap.min.css">
<link rel="stylesheet" href="./BS/bootstrap.css">
<!--  Span Icon By Google -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- Javascript for Hamburger Button -->
<script src="./JS/jquery-3.2.1.slim.min.js" ></script>
<script src="./JS/popper.min.js"></script>
<script src="./JS/bootstrap.min.js"></script>
</head>
<body>
  <form action="sendmail.do" method="POST">
      <table class="table">
         <tr><th>받을 사람의 주소</th></tr>
         <tr><td><input type="text" name="to" /></td></tr>
         <tr><th>제목:</th></tr>
         <tr><td><input type="text" name="title" /></td></tr>
         <tr><th>내용:</th></tr>
         <tr><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
      </table>
      <input type="submit" class="btn btn-secondary" value="Send" />
  </form>
</body>
</html>