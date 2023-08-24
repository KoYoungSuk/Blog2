<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- 이미 로그인되어 있으면 바로 리스트로 넘어감 -->
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
  <c:redirect url="productlist?desc=0&columnname=product_no"></c:redirect>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Welcome to HomeProduct (Web) !!!  </title>
<style>
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
<div class="container-fluid">
<div class="row"> 
  <div class="col-sm-4" style="background-color: #DCDCDC; padding: 0px; margin: 120px;">
    <h3 class="htitle">Welcome to HomeProduct!</h3>
	<p>&nbsp;&nbsp;Only Administrator can use HomeProduct Web Mode. Sorry.... </p>
	<hr>
	<form action="productlogin" method="POST">
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
	  <div style="text-align: right;">
	  <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>&nbsp;&nbsp;
	  <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">login</span>Login</button>&nbsp;&nbsp; 
	  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../main.do'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to PersonalMemo</button>&nbsp;&nbsp; 
	  </div>
	</form>
	<br> 
  </div>
  </div>
  </div> 
  <div class="footer">
	<p>Last updated: Saturday, May 27th 2023 </p>
	<p>This is not copyrighted. But don't use this for illegally.</p>
  </div>
<body>
</body>
</html>
