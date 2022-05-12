<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="MyBlogContent/default.jsp" var="defaultcontent"></c:import>
<c:import url="MyBlogContent/signup.jsp" var="signupcontent"></c:import>
<c:import url="MyBlogContent/about.jsp" var="aboutcontent"></c:import>
<c:import url="MyBlogContent/boardlist.jsp" var="boardlistcontent"></c:import>
<c:import url="MyBlogContent/manage.jsp" var="homepagemanagecontent"></c:import>
<c:import url="MyBlogContent/writeboard.jsp" var="writeboardcontent"></c:import>
<c:import url="MyBlogContent/etc.jsp" var="etccontent"></c:import>
<c:import url="MyBlogContent/memberinfo.jsp" var="memberinfocontent"></c:import>
<c:import url="MyBlogContent/membermodify.jsp" var="membermodifycontent"></c:import>
<c:import url="MyBlogContent/memberdelete.jsp" var="memberdeletecontent"></c:import>
<c:import url="MyBlogContent/totalmember.jsp" var="totalmembercontent"></c:import>
<c:import url="MyBlogContent/detailboard.jsp" var="detailboardcontent"></c:import>
<c:import url="MyBlogContent/modifyboard.jsp" var="modifyboardcontent"></c:import>
<c:import url="MyBlogContent/deleteboard.jsp" var="deleteboardcontent"></c:import>
<c:choose>
<c:when test="${param.page == 1}"><c:set var="titlename" value="Main Page" /></c:when>
<c:when test="${param.page == 2}"><c:set var="titlename" value="Sign up" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="Board" /></c:when>
<c:when test="${param.page == 6}"><c:set var="titlename" value="HomePage Manage Center" /></c:when>
<c:when test="${param.page == 7}"><c:set var="titlename" value="Member Info" /></c:when>
<c:when test="${param.page == 8}"> <c:set var="titlename" value="Modify Member" /></c:when>
<c:when test="${param.page == 9}"><c:set var="titlename" value="Delete Member" /></c:when>
<c:when test="${param.page == 11}"><c:set var="titlename" value="DataBase Administration Center" /></c:when>
<c:when test="${param.page == 12}"><c:set var="titlename" value="Write Bulletin Board" /></c:when>
<c:when test="${param.page == 13}"><c:set var="titlename" value="ETC Service Link" /></c:when>
<c:when test="${param.page == 14}"><c:set var="titlename" value="Bulletin Board Detail" /></c:when>
<c:when test="${param.page == 17}"><c:set var="titlename" value="Modify Bulletin Board" /></c:when>
<c:when test="${param.page == 16}"><c:set var="titlename" value="About" /></c:when>
<c:when test="${param.page == 0}"><script>window.location.href="https://home.yspersonal.com/non.htm";</script></c:when>
<c:otherwise><c:set var="titlename" value="Main Page" /></c:otherwise></c:choose>
<!DOCTYPE HTML>
<html>
<head>
<title> MyBlog/ETC <c:out value="${titlename}" /> </title>
<meta charset = "utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./BS/bootstrap.min.css">
<link rel="stylesheet" href="./BS/bootstrap.css">
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
<style>
  .footer{
      left: 0;
      bottom: 0;
      width: 100%;
      text-align: center;
  }
  .jumbotron{
      padding-top: 0px;
      padding-bottom: 0px;
      text-align: center;
}
.class_tp {
  display: none; 
  position: fixed;
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: lightblue;
  padding-top: 50px;
}
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: black;
}
   </style>
</head>
<body>
  <nav class="navbar navbar-expand-md bg-warning navbar-light">
       <a class="navbar-brand" href="./main.do?page=1">MyBlog</a>
         <div class="navbar-collapse">
       <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="./main.do?page=1">Home </a> </li> 
        <li class="nav-item"><a class="nav-link" href="./boardlist.do"> Board </a> </li>
       <c:choose>
      <c:when test="${sessionScope.id ne null}">
        <li class="nav-item"><a class="nav-link" href="./main.do?page=6"> HomePage Manage Center(Administrator Only) </a></li>
      </c:when>
        <c:otherwise>
        <li class="nav-item"><a class="nav-link" href="./main.do?page=2">Sign up </a> </li>
        </c:otherwise>
      </c:choose>
       <li class="nav-item"><a class="nav-link" href="./main.do?page=13">ETC Service Link </a> </li>
       <li class="nav-item"><a class="nav-link" href="./main.do?page=16">About </a> </li>
       </ul>
       <ul class="navbar-nav ml-auto">
      <c:choose>
      <c:when test="${sessionScope.id ne null}">
      <button class="btn btn-default" onclick="location.href='totalmember.do?id=${id}'"> Current User ID: ${id}, Current User Name: ${sessionScope.fullname} </button>
      <button class="btn btn-danger" onclick="location.href='signout.do'">Logout</button>
      </c:when>
      <c:otherwise>
      <form class="form-inline" action="login.do" method="post" >
      <input class="form-control mr-sm-2" type="text" placeholder="ID" name="id" required />
      <input class="form-control mr-sm-2" type="password" placeholder="Password" name="password" required />
      <li class="nav-item">
      <button class="btn btn-success" type="submit">Login</button>
      </li>
      </form>
      </c:otherwise>
      </c:choose>
</ul>
</div>
</nav>
<div class="jumbotron" >
   <H1> MyBlog&ETC </H1>
   <H5> <c:out value="${titlename}" /> </H5>
</div>
<c:choose>
<c:when test="${param.page == 1}">
${defaultcontent}
</c:when>
<c:when test="${param.page ==2}"> 
${signupcontent}
</c:when>
<c:when test="${param.page == 3}">
${boardlistcontent}
</c:when> 
<c:when test="${param.page ==6}">
${homepagemanagecontent}
</c:when> 
<c:when test="${param.page ==7}">
${memberinfocontent}
</c:when> 
<c:when test="${param.page == 8}">
${membermodifycontent}
</c:when> 
<c:when test="${param.page == 9}">
${memberdeletecontent}
</c:when>
<c:when test="${param.page == 11 }">
${totalmembercontent}
</c:when>
<c:when test="${param.page == 12}">
${writeboardcontent}
</c:when> 
<c:when test="${param.page == 13}">
${etccontent}
</c:when>
<c:when test="${param.page == 14}">
${detailboardcontent}
</c:when>
<c:when test="${param.page == 16}">
${aboutcontent}
</c:when>
<c:when test="${param.page == 17}">
${modifyboardcontent}
</c:when>
<c:when test="${param.page == 20}">
${deleteboardcontent}
</c:when>
<c:otherwise>
${defaultcontent}
</c:otherwise>
</c:choose>
<hr>
   <div class="footer" style="margin-bottom:0">
   <p> Last updated: Thursday, December 16th, 2021 </p>
   <p> This is not copyrighted. But Don't use this web site to make illegal stuff </p>
   <p id=currentDate></p>
   </div>
   <c:choose>
     <c:when test="${id ne null}">
        <p><a href="oldmain.jsp?num=3702">....</a></p>
     </c:when>
     <c:otherwise></c:otherwise>
   </c:choose>
</body>
</html> 
  <!--Clock JavaScript Start -->
  <script>
     function clock(){
     	var currdate = new Date();
     	var nowyear = currdate.getFullYear();	
        var nowmonth = currdate.getMonth()+1;
        var nowdate = currdate.getDate();
        var nowhour = currdate.getHours();
        var nowminute = currdate.getMinutes();
        var nowsecond = currdate.getSeconds();
        document.getElementById("currentDate").innerHTML = "현재 날짜/시간: " + nowyear + "년 " + nowmonth + "월 " + nowdate + "일 " + nowhour + "시 " + nowminute + "분 " + nowsecond + "초";
     }
    function init(){
     	clock();
     	setInterval(clock,1000);
     }
     init();
  </script>
  <!--Clock JavaScript Ends -->
