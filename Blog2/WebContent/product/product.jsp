<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../ProductContent/productlist.jsp" var="productlistcontent"></c:import>
<c:import url="../ProductContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../ProductContent/write.jsp" var="writecontent"></c:import>
<c:import url="../ProductContent/modify.jsp" var="modifycontent"></c:import>
<c:choose>
   <c:when test="${page.param == 1}"><c:set var="titlename" value="" /></c:when>
   <c:when test="${param.page == 2}"><c:set var="titlename" value="(Product Detail)" /></c:when>
   <c:when test="${param.page == 3}"><c:set var="titlename" value="(Write Information)" /></c:when>
   <c:when test="${param.page == 4}"><c:set var="titlename" value="(Modify Information)" /></c:when>
   <c:otherwise><c:set var="titlename" value="" /></c:otherwise>
</c:choose>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title> HomeProduct(Web) ${titlename} </title>
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
<script>
</script>
</head>
<body>

<div class="col-sm-8" style="background-color: #DCDCDC; padding: 0px; margin: 50px; ">
    <h3 class="htitle">
      HomeProduct(Web) (Current User: ${sessionScope.id}) ${titlename}
      <button type="button" onclick="history.go(-1);" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
	  <button type="button" onclick="location.href='product.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
	  <button type="button" onclick="location.href='../signout.do?check=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
    </h3>
	<p>&nbsp;&nbsp;Only Administrator can use HomeProduct(Web). Sorry.... </p>
	<hr>
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
 <hr>
<div class="footer">
	<p>Last updated: Thursday, May 18th, 2023 </p>
	<p>This is not copyrighted. But don't use this illegally. </p>
</div>
</body>
</html>