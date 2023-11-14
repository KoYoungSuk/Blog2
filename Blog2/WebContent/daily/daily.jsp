<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../DailyContent/detaildaily.jsp" var="detailcontent"></c:import>
<c:import url="../DailyContent/write.jsp" var="writecontent"></c:import>
<c:import url="../DailyContent/modify.jsp" var="modifycontent"></c:import>
<c:import url="../DailyContent/delete.jsp" var="deletecontent"></c:import>
<c:choose>
<c:when test="${param.page == 2}"><c:set var="titlename" value="(Detail Daily)" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="(Write Daily)" /></c:when>
<c:when test="${param.page == 4}"><c:set var="titlename" value="(Modify Daily)" /></c:when>
<c:when test="${param.page == 5}"><c:set var="titlename" value="(Delete Daily)" /></c:when>
<c:otherwise></c:otherwise>
</c:choose>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}"> <!-- 관리자 모드로만 사용가능 -->
<c:redirect url="../3217"></c:redirect>
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
<title> DailyManager(Web) | ${titlename} </title>
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
<body>
<div class="container-fluid">
<div class="row"> 
<div class= "col-lg-8" style="padding: 0px; margin: 70px; background-color: #DCDCDC; ">
    <h3 class="htitle">
    DailyManager(Web) (Current User: ${sessionScope.id} ) ${titlename} 
    </h3>
    <div style="text-align: center;">
	<button type="button" onclick="location.href='../signout.do?check=5'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
	<button type="button" onclick="location.href='./daily_new.jsp'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">home</span>Daily Main Page</button>
    </div>
	<hr> 
	<c:choose>
	 <c:when test="${param.page == 2}"> <!--  Detail Daily -->
	 ${detailcontent}
	</c:when>
	<c:when test="${param.page == 3}"> <!--  Write Daily -->
	 ${writecontent}
	</c:when>
	<c:when test="${param.page == 4}"> <!--  Modify Daily -->
     ${modifycontent}
	</c:when>
    <c:when test="${param.page == 5}"> <!--  Delete Daily -->
     ${deletecontent}
    </c:when>
    <c:otherwise>
     <c:redirect url="./daily_new.jsp"></c:redirect>
    </c:otherwise>
	</c:choose>
</div>
</div>
</div> 
<div class="footer">
	<p>Last updated: Tuesday, November 14nd,  2023 </p>
	<p>This is not copyrighted. But Don't use this illegally.</p>
</div>
</body>
</html>