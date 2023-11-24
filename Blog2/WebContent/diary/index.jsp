<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}"> <!-- 관리자 모드로 이미 로그인되어 있을 때 -->
 <c:redirect url="diarylist"></c:redirect>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<!-- Mobile Friendly Meta  -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Ignore Internet Explorer 8 Compatible Mode  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap 4.4  -->
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<!-- Google Span Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Welcome to MyDiary(Web) !!! </title>
<style>
	.jumbotron{
        padding-top: 0px;
        padding-bottom: 0px;
        text-align: center;
		background-color: blue;
		color: yellow;
	}
	.footer{
		text-align: right; 
		color: white; 
	}
    .htitle
    {
         background-color: blue; 
         text-align: center;
         color: white;
         border: ridge; 
    }
     body
     {
        background-color: #008080; 
     }
</style>
</head>
<hr>
<div class="container-fluid">
<div class="row">
   <div class="col-lg-4" style="background-color: #DCDCDC; margin: 120px; padding: 0px;">
    <H3 class="htitle"> Welcome </H3>
	<p>&nbsp;&nbsp; Enter a username and password to enter MyDiary(Web) List System. (Administrator Only) </p>
	<form action="diarylogin" method="POST">
	<table>
	  <tr>
	    <td>&nbsp;&nbsp;<label for="ID">ID:</label></td>
	    <td><input class="form-control" type="text" name="id" value="admin" readonly required /></td>
	  </tr>
	  <tr>
	    <td>&nbsp;&nbsp;<label for="Password">Password:</label></td>
	    <td><input class="form-control" type="password" name="password" required /></td>
	  </tr>
	</table>
	 <div style="text-align: center">
	  <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);" ><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>&nbsp;&nbsp; 
	  <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">login</span>Login</button>&nbsp;&nbsp; 
	  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../main.do'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to PersonalMemo</button>&nbsp;&nbsp; 
	  <br> 
	 </div>
	 <br> 
	</form>
  </div>
  </div>
  </div>
  <div class="footer">
	<p>Last updated: Wednesday, November 8th, 2023 </p>
	<p>This is not copyrighted. But don't use this illegally. </p>
  </div>
<body>
</body>
</html>
