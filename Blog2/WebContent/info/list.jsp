<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!--  JSP 모듈 파일 임포트 -->
<c:import url="../InfoContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../InfoContent/write.jsp" var="writecontent"></c:import>
<c:import url="../InfoContent/modify.jsp" var="modifycontent"></c:import>
<!--  파라미터에 따라 사이트 제목 정하기 -->
<c:choose>
   <c:when test="${param.page == 2}"><c:set var="titlename" value="(Detail Information)" /></c:when>
   <c:when test="${param.page == 3}"><c:set var="titlename" value="(Write Information)" /></c:when>
   <c:when test="${param.page == 4}"><c:set var="titlename" value="(Modify Information)" /></c:when>
   <c:otherwise><c:set var="titlename" value="" /></c:otherwise>
</c:choose>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}">
  <c:redirect url="../3217"></c:redirect>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Friendly Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Ignore Internet Explorer 8 Compatible Mode -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap 4.4  -->
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<!-- Google Span Icon  -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title> Oracle DataBase | ${titlename} </title>
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

<div class="col-lg-8" style="background-color: #DCDCDC; padding: 0px; margin: 50px; ">
    <h3 class="htitle">
      (Current User: ${sessionScope.id}) ${titlename}
    </h3>
    <div style="text-align: center;">
	<button type="button" onclick="location.href='info_new.jsp'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">home</span>Info Main Page</button>
	</div>
	<!-- 파라미터에 따라 출력할 JSP 모듈 내용 지정 -->
	<c:choose>
	 <c:when test="${param.page == 2}"> <!--  Detail Info List -->
	 ${detailcontent}
	</c:when>
	<c:when test="${param.page == 3}"> <!--  Write Info List -->
	 ${writecontent}
	</c:when>
	<c:when test="${param.page == 4}"> <!--  Modify Info List -->
     ${modifycontent}
	</c:when>
    <c:otherwise>
     <c:redirect url="../info_new.jsp"></c:redirect>
    </c:otherwise>
	</c:choose>
</div>
 <hr>
<div class="footer">
	<p>Last updated: Wednesday, November 15th, 2023 </p>
	<p>This is not copyrighted. But don't use this illegally. </p>
</div>
</body>
</html>