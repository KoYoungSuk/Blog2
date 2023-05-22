﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- JSP 모듈 파일 임포트 -->
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
<c:import url="MyBlogContent/whyimakethis.jsp" var="whyimakethiscontent"></c:import>
<!-- 파라미터에 따라 사이트 제목 정하기 -->
<c:choose>
<c:when test="${param.page == 1}"><c:set var="titlename" value="Main Page" /></c:when>
<c:when test="${param.page == 2}"><c:set var="titlename" value="Sign up" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="MemoList" /></c:when>
<c:when test="${param.page == 4}"><c:set var="titlename" value="" /></c:when>
<c:when test="${param.page == 6}"><c:set var="titlename" value="Manage Center" /></c:when>
<c:when test="${param.page == 7}"><c:set var="titlename" value="Member Info" /></c:when>
<c:when test="${param.page == 8}"><c:set var="titlename" value="Modify Member" /></c:when>
<c:when test="${param.page == 9}"><c:set var="titlename" value="Delete Member" /></c:when>
<c:when test="${param.page == 11}"><c:set var="titlename" value="Member Management Center" /></c:when>
<c:when test="${param.page == 12}"><c:set var="titlename" value="Write Memo" /></c:when>
<c:when test="${param.page == 13}"><c:set var="titlename" value="ETC" /></c:when>
<c:when test="${param.page == 14}"><c:set var="titlename" value="Memo Detail" /></c:when>
<c:when test="${param.page == 16}"><c:set var="titlename" value="About" /></c:when>
<c:when test="${param.page == 17}"><c:set var="titlename" value="Modify Memo" /></c:when>
<c:when test="${param.page == 0}"><script>window.location.href="http://192.168.55.126/nossl/non.htm";</script></c:when>
<c:otherwise><c:set var="titlename" value="Main Page" /></c:otherwise></c:choose>
<!DOCTYPE HTML>
<html>
<head>
<title> PersonalMemo ( <c:out value="${titlename}" /> ) </title>
<meta charset = "utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./BS/bootstrap.min.css">
<link rel="stylesheet" href="./BS/bootstrap.css">
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
<!--  Span Icon By Google -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
  .footer{
      text-align: right;
      color: white; 
  }
  .jumbotron{
      padding-top: 0px;
      padding-bottom: 0px;
      text-align: center;
  }

body {
  background-color: #008080; 
}

.htitle{
  text-align: center; 
  background-color: blue;
  color: white; 
}
</style>
</head>
<body>
  <nav class="navbar navbar-expand-md bg-dark navbar-dark">
       <a class="navbar-brand" href="./main.do?page=1"><span class="material-symbols-outlined">sticky_note_2</span>PersonalMemo</a>
         <div class="navbar-collapse">
       <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="./main.do?page=1"><span class="material-symbols-outlined">home</span>Home </a> </li> 
        <li class="nav-item"><a class="nav-link" href="./boardlist.do"> <span class="material-symbols-outlined">list</span>MemoList </a> </li>
       <c:choose>
      <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
        <li class="nav-item"><a class="nav-link" href="./main.do?page=6"><span class="material-symbols-outlined">manage_accounts</span>Manage Center </a></li>
      </c:when>
        <c:otherwise></c:otherwise>
      </c:choose>
       <li class="nav-item"><a class="nav-link" href="./main.do?page=13"><span class="material-symbols-outlined">more</span>ETC</a> </li>
       <li class="nav-item"><a class="nav-link" href="./main.do?page=16"><span class="material-symbols-outlined">info</span>About </a> </li>
       </ul>
       <ul class="navbar-nav ml-auto">
      <c:choose>
      <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
      <button class="btn btn-dark" onclick="location.href='totalmember.do?id=${id}'"> Current User ID: ${id}, Current User Name: ${sessionScope.fullname} </button>
      <button class="btn btn-danger btn-sm" onclick="location.href='signout.do?check=1'"><span class="material-symbols-outlined">logout</span>Logout</button>
      </c:when>
      <c:otherwise>
      <form class="form-inline" action="login.do" method="post" >
      <input class="form-control mr-sm-2" type="text" placeholder="ID" name="id" required />
      <input class="form-control mr-sm-2" type="password" placeholder="Password" name="password" required />
      <li class="nav-item">
      <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">login</span>Login</button>
      </li>
      &nbsp;&nbsp; 
      <li class="nav-item">
      <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='./main.do?page=2'"><span class="material-symbols-outlined">person_add</span>Sign up</button>
      </li>
      </form>
      </c:otherwise>
      </c:choose>
</ul>
</div>
</nav>
<div class="jumbotron" >
   <H1> PersonalMemo </H1>
   <H4><c:out value="${titlename}" /> </H4>
</div>
<!-- 파라미터에 따라 출력할 JSP 모듈 내용 지정 -->
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
<c:when test="${param.page == 4}">
${whyimakethiscontent}
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
<div class="footer">
   <p> Last updated: Saturday, May 27th, 2023 </p>
   <p> This is not copyrighted. But Don't use this web site to make illegal stuff. </p>
   <p id=currentDate></p>
</div>
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
