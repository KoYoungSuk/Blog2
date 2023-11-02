<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<c:import url="MyBlogContent/login.jsp" var="logincontent"></c:import> 
<c:import url="MyBlogContent/FindIDPasswordContent.jsp" var="FindIDPasswordContent"></c:import> 
<c:import url="MyBlogContent/findid.jsp" var="findidcontent"></c:import>
<c:import url="MyBlogContent/findpw.jsp" var="findpwcontent"></c:import> 
<c:import url="MyBlogContent/changepassword.jsp" var="changepwcontent"></c:import> 
<!-- 파라미터에 따라 사이트 제목 정하기 -->
<c:choose>
<c:when test="${param.page == 1}"><c:set var="titlename" value="Main Page" /></c:when>
<c:when test="${param.page == 2}"><c:set var="titlename" value="Sign up" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="MemoList" /></c:when>
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
<c:when test="${param.page == 18}"><c:set var="titlename" value="Login" /></c:when> 
<c:when test="${param.page == 19}"><c:set var="titlename" value="Find Your ID and Password" /></c:when> 
<c:when test="${param.page == 20}"><c:set var="titlename" value="Delete Board" /></c:when> 
<c:when test="${param.page == 21}"><c:set var="titlename" value="Find ID" /></c:when>
<c:when test="${param.page == 22}"><c:set var="titlename" value="Find Password" /></c:when> 
<c:when test="${param.page == 23}"><c:set var="titlename" value="Change Password" /></c:when> 
<c:when test="${param.page == 0}">
  <script>
        var host_url = window.location.host; 
        console.log("url: " + host_url); 
        window.location.href= "http://" + host_url + "/non.htm"; 
 </script>
</c:when>
<c:otherwise><c:set var="titlename" value="Main Page" /></c:otherwise></c:choose>
<!DOCTYPE HTML>
<html>
<head>
<title> PersonalMemo ( <c:out value="${titlename}" /> ) </title>
<meta charset = "utf-8">
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
  <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
      <a class="nav-item navbar-brand" href="./main.do?page=1"><span class="material-symbols-outlined">sticky_note_2</span>PersonalMemo</a>
      <!-- 햄버거 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#ToggleMenu" aria-controls="ToggleMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="material-symbols-outlined">menu</span></button>
      
      <div class="collapse navbar-collapse" id="ToggleMenu">
      <div class="navbar-nav">
           <a class="nav-item nav-link" href="./main.do?page=1"><span class="material-symbols-outlined">home</span>Home </a> 
           <a class="nav-item nav-link" href="./boardlist.do"> <span class="material-symbols-outlined">list</span>MemoList </a>
        <c:choose>
        <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
           <a class="nav-item nav-link" href="./main.do?page=6"><span class="material-symbols-outlined">manage_accounts</span>Manage Center </a>
        </c:when>
        <c:otherwise></c:otherwise>
        </c:choose>
        <a class="nav-item nav-link" href="./main.do?page=13"><span class="material-symbols-outlined">more</span>ETC</a>
        <a class="nav-item nav-link" href="./main.do?page=16"><span class="material-symbols-outlined">info</span>About </a>
       </div>
       <div class="navbar-nav ml-auto">
       <c:choose>
       <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
         <button class="btn btn-dark" onclick="location.href='totalmember.do?id=${id}'"> Current User ID: ${id}, Current User Name: ${sessionScope.fullname} </button>
         <button class="btn btn-danger btn-sm" onclick="location.href='signout.do?check=1'"><span class="material-symbols-outlined">logout</span>Logout</button>
       </c:when>
       <c:otherwise>
          <!-- 로그인 되어 있지 않을때 아이디 및 비밀번호 입력창 출력  -->
            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href= './main.do?page=18'"><span class="material-symbols-outlined">login</span>Login</button>
            &nbsp;&nbsp; 
            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='./main.do?page=2'"><span class="material-symbols-outlined">person_add</span>Sign up</button>
      </c:otherwise>
      </c:choose>
      </div>
   </div>
   
</nav>
<div class="jumbotron" >
   <H1> PersonalMemo </H1>
   <H4><c:out value="${titlename}" /> </H4>
</div>
<!-- 파라미터에 따라 출력할 JSP 모듈 내용 지정 -->
<div class="container-fluid">
<div class="row">
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
<c:when test="${param.page == 5}">
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
<c:when test="${param.page == 18}">
${logincontent}
</c:when>
<c:when test="${param.page == 19}">
${FindIDPasswordContent}
</c:when>
<c:when test="${param.page == 20}">
${deleteboardcontent}
</c:when>
<c:when test="${param.page == 21}">
${findidcontent}
</c:when>
<c:when test="${param.page == 22}">
${findpwcontent}
</c:when> 
<c:when test="${param.page == 23}">
${changepwcontent}
</c:when>
<c:otherwise>
${defaultcontent}
</c:otherwise>
</c:choose>
</div>
</div> 
<div class="footer">
   <p> Last updated: Friday, November 3rd, 2023 </p>
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
