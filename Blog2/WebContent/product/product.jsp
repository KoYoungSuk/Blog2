<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../ProductContent/productlist.jsp" var="productlistcontent"></c:import>
<c:import url="../ProductContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../ProductContent/write.jsp" var="writecontent"></c:import>
<c:import url="../ProductContent/modify.jsp" var="modifycontent"></c:import>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}">
  <c:redirect url="/error_3217.html"></c:redirect>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<title>ProductManager for MyHome Web Mode</title>
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
<script>
</script>
</head>
<body>
<div class="jumbotron">
	<h1>ProductManager for MyHome Web Mode</h1>
	<h5>2022-05-18</h5>
<nav class="navbar navbar-expand-md bg-warning navbar-light">
       <ul class="navbar-nav">
        <li class="nav-item"><button class="btn btn-danger" onclick="location.href='product.jsp?page=3'">Write</button></li>
        <li class="nav-item">&nbsp;&nbsp;</li>        
        <li class="nav-item"><button class="btn btn-danger" onclick="history.go(-1);">Back</button></li>
        <li class="nav-item">&nbsp;&nbsp;</li>  
        <li class="nav-item"><button class="btn btn-danger" onclick="location.href='../main.do'">Back to MyBlog</button> </li>
        <li class="nav-item">&nbsp;&nbsp;</li>  
        <li class="nav-item"><button class="btn btn-danger" onclick="location.href='../signout.do?check=3'">Logout</button></li>
       </ul>
</nav>
</div>
<hr>
<div class="container" style="margin-top: 15px">
   <div class="col-sm-12">
	<p>Only Administrator can use ProductManager Web Mode. Sorry.... </p>
	<hr>
	<c:choose>
	 <c:when test="${page.param == 1}">
      ${productlistcontent}
	 </c:when>
	 <c:when test="${param.page == 2}">
	 ${detailcontent}
	</c:when>
	<c:when test="${param.page == 3}">
	 ${writecontent}
	</c:when>
	<c:when test="${param.page == 4}">
     ${modifycontent}
	</c:when>
    <c:otherwise>
     ${productlistcontent}
    </c:otherwise>
	</c:choose>
  </div>
 </div>
 <hr>
<div class="footer">
	<p>Last updated: Sunday, May 22nd, 2022 </p>
	<p>This is not copyrighted. But don't use this illegally. </p>
</div>
</body>
</html>