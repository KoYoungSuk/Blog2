<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
 <c:redirect url="diarylist?desc=0"></c:redirect>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<title>PersonalDiary Web Mode</title>
<style>
	.jumbotron{
        padding-top: 0px;
        padding-bottom: 0px;
        text-align: center;
		background-color: blue;
		color: yellow;
	}
	.footer{
	    left: 0;
        bottom: 0;
        width: 100%;
		text-align: center;
		background-color: lightblue;
	}
</style>
</head>
 <div class="jumbotron">
	<h1>PersonalDiary Web Mode</h1>
	<h5>2022-04-24</h5>
</div>
<hr>
<div class="container" style="margin-top: 15px">
   <div class="col-sm-12">
	<p>Only Administrator can use PersonalDiary Web Mode. Sorry.... </p>
	<hr>
	<form action="diarylogin" method="POST">
	<table>
	  <tr>
	    <td><label for="ID">ID:</label></td>
	    <td><input type="text" name="id" value="admin" readonly required /></td>
	  </tr>
	  <tr>
	   <td><label for="Password">Password:</label></td>
	   <td><input type="password" name="password" required /></td>
	  </tr>
	</table>
	<hr>
	  <input type="submit" class="btn btn-primary" value="LOGIN" />
	  <input type="button" class="btn btn-primary" onclick="history.go(-1);" value="BACK" />
	  <input type="button" class="btn btn-primary" onclick="location.href='../main.do'" value="BACK TO THE MAIN PAGE" />
	</form>
  </div>
 </div>
 <hr>
  <div class="footer">
	<p>Last updated: May 21st, 2022 </p>
	<p>This is not copyrighted. But don't use this illegally. </p>
</div>
<body>
</body>
</html>
