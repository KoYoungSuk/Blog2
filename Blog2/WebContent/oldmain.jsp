<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="id" value="${sessionScope.id}" />
<c:choose>
   <c:when test="${param.page == 1}"><c:set var="titlename" value="Main Page" /></c:when>
   <c:when test="${param.page == 2}"><c:set var="titlename" value="Sign up Page " /></c:when>
   <c:when test="${param.page == 3}"><c:set var="titlename" value="Login Page " /></c:when>
   <c:when test="${param.page == 4}"> <c:set var="titlename" value="NonMember Mode Page" /></c:when>
   <c:when test="${param.page == 5}"><c:set var="titlename" value="ETC Service Link" /></c:when>
   <c:when test="${param.page == 6}"><c:set var="titlename" value="A B O U T" /></c:when>
   <c:when test="${param.page == 7}"><c:set var="titlename" value="Board(Administrator Mode)" /></c:when>
   <c:when test="${param.page == 8}"><c:set var="titlename" value="Board(Member Mode)" /></c:when>
   <c:when test="${param.page == 9}"><c:set var="titlename" value="HomePage Manage Center(Administrator Only)" /></c:when>
   <c:otherwise><c:set var="titlename" value="Main Page" /></c:otherwise>
</c:choose>
<c:choose>
<c:when test="${param.num == 3702}"></c:when>
<c:otherwise>
  <c:redirect url="/403"></c:redirect>
</c:otherwise>
</c:choose>
<!DOCTYPE HTML> 
<HTML>
<HEAD>
 <TITLE> MyBlog&ETC <c:out value="${titlename}" /> </TITLE>
 <META CHARSET = "UTF-8">
 <META NAME="VIEWPORT" CONTENT="WIDTH=DEVICE-WIDTH, INITIAL-SCALE=1">
 <style>
 ul{
  list-style-type: none;
  overflow: hidden;
  margin: 0;
  padding: 0;
  background-color: grey;
 }
 li{
  float: left;
 }
 li a {
   display: block;
   color: white;
   text-align: center;
   text-decoration: none;
   padding: 14px 15px;
  }
 li a:hover{
    background-color: green;
 }
  .header{
  	 text-align: center;
  	 background-color: yellow;
  }
  .divbody{
    text-align: center;
  }
  .footer {
    background-color: lightgreen;
  	text-align: center;
  }
</style>
</HEAD>
<BODY>
   <div class="header">
      <H1> MyBlog&ETC </H1>
      <H5> <c:out value="${titlename}" /> </H5>
   </div>
  <ul>
     <li><a href="./oldmain.jsp?num=3702&page=1"> MyBlog </a></li> 
     <li><a href="./oldmain.jsp?num=3702&page=1"> Home </a></li> 
     <c:choose>
     <c:when test="${id ne null}">
       <li><a href="./oldmain.jsp?num=3702&page=7">Board(Administrator Mode)</a></li>
       <li><a href="./oldmain.jsp?num=3702&page=8">Board(Member Mode)</a></li>
       <li><a href="./oldmain.jsp?num=3702&page=9">HomePage Manage Center(Administrator Only)</a></li>
     </c:when>
     <c:otherwise>
     <li><a href="./oldmain.jsp?num=3702&page=2">Signup Page </a>  </li>
     <li><a href="./oldmain.jsp?num=3702&page=3">Login Page </a>  </li>
     <li><a href="./oldmain.jsp?num=3702&page=4">NonMember Mode </a> </li>
     </c:otherwise>
     </c:choose>
     <li><a href="./oldmain.jsp?num=3702&page=5">ETC Service Page </a></li>
     <li><a href="./oldmain.jsp?num=3702&page=6">About Page</a></li>
     <c:choose>
     <c:when test="${id ne null }">
       <li><a href="#">Current User: ${id}</a></li>
       <li><a href="oldsignout.do">Logout</a></li>
     </c:when>
     </c:choose>
  </ul>

<c:choose>
<c:when test="${param.page == 1}"> 
  <div class="divbody" id="divbody">
   <p>This Site is designed for My Personal Blog </p>
       <p>And This Site is for Old Web Browser User!! </p>
       <p>If You use Modern Browser Like IE11, Latest Version of FireFox and Chrome, Please use <a href="./maintest.jsp?page=1">this ver of MyBlog</a></p>
      <p></p>
     <hr>
       <p>Latest Web Browser Download Link</p>
     <hr>
       <p><a href="http://kysot.yspersonal.com/ChromeSetup(2018).exe">Google Chrome(Windows 7 or Higher)</a></p>
       <p><a href="http://kysot.yspersonal.com/FireFox52Setup.exe">Mozilla FireFox(Windows XP)</a></p>
       <hr>
       <p>NOTICE: if you use Windows Me Millennium Edition or older Operating System, Please Upgrade. </p> 
 </div>
</c:when>
<c:when test="${param.page == 2}">
<c:choose>
<c:when test="${id ne null }">
    <p>Loginned User can't use Signup Page. You must logout. </p>
    <p><a href="oldsignout.do">Logout</a>
</c:when>
<c:otherwise>
<form class="signup-content" method="post" action="./oldchecksignup.do">
<H2> Sign-up Menu. </H2>
<p> if you use this website perfectly,  you need to make your account. </p>
<p> you need to type id, password, confirmed password to make your account. </p>
<p>  
But typing your birthday your name(First name, Last name)  is optional. 
</p>
<p>
<label for="id"><b>ID:</b></label>
<input type="text" placeholder="ID" name="id" required>
</p>
<p>
<label for="password"><b>Password:</b></label>
<input type="password" placeholder="password" name="password" required>
</p>
<p>
<label for="password"><b>Confirmed Password:</b></label>
<input type="password" placeholder="Confirmed Password" name="cpassword" required>
</p>
<p>
<label for="first_name"><b>First Name(optional):</b></label>
<input type="text" placeholder="First Name" name="first_name">
</p>
<p>
<label for="last_name"><b>Last Name(optional):</b></label>
<input type="text" placeholder="Last Name" name="last_name">
</p>
<p>
<label for="birthday"><b> Your Birthday(optional/YYYY-MM-DD): </b></label>
<input type="text" placeholder="Birthday(YYYY-MM-DD)" name="birthday">for example: 1999-12-31
</p>
<p>
 <button type="submit"> Sign up </button>
 <button type="button" onclick="location.href='./oldmain.jsp' "> Back to Main Page </button>
</p>
</form>
</c:otherwise>
</c:choose>
</c:when> 
<c:when test="${param.page == 3}">
   <h3>Login </h3>
   <hr>
   <c:choose>
   <c:when test="${id ne null}">
      <p>Already Loginned!! Current User: ${id}</p>
      <p><a href="signout.do">Logout</a>
   </c:when>
   <c:otherwise>
    <form action="./login.do" method="post">
         <label for="ID">ID:</label>
         <input type="text" placeholder="ID" name="id" required />
       <br>
         <label for="Password">Password:</label>
        <input type="password" placeholder="Password" name="password" required />
     <br>
       <button type="submit">Login</button>
     </form>
     </c:otherwise>
     </c:choose>
   <hr>
</c:when> 

<c:when test="${param.page == 4}">
   <h3>Non Member Mode Page </h3>
    <hr>
    Under Construction
</c:when> 
<c:when test="${param.page == 5}">
   <H3>ETC Service Link</H3>
    <hr>
    <a href="./timer.html">Timer(JavaScript&HTML5 Clock)</a>
     <br>
    <a href="./Classic.html">Classic Web Archive Page(Administrator Only)</a>
      <br>
          <a href="http://kyshome.iptime.org:81">Adminstrate Home DataBase</a>
         <br>
        <a href="http://kysot.yspersonal.com">Under Construction</a>
       <br>
  <hr>
</c:when> 
<c:when test="${param.page == 6}">
   <H3>About</H3>
    <hr>
    <p>First Updated: Feb 2020  </p>
    <p>Last Updated:    </p>
   <p>NO Copyright Required, But Don't use this for illegal purpose. </p>
   <p> <%= application.getServerInfo() %></p> 
    <hr>
      <c:choose> 
          <c:when test="${id ne null}">
    <p><a href="./About.jsp">Full Ver(HTTPS Required)</a></p>      
    </c:when>
      <c:otherwise> </c:otherwise>
     </c:choose>
</c:when> 
<c:when test="${param.page == 7}">
         <H3>Board(Administrator Mode)</H3>
        <hr>
     <c:choose> 
      <c:when test="${id eq 'admin'}">
        <p>Current User: ${id} </p> 
    </c:when>
   <c:otherwise> <p>Administrator Only. </p> </c:otherwise>
  </c:choose>
</c:when> 
<c:when test="${param.page == 8}">
        <H3>Board(Member Mode)</H3>
        <hr>
     <c:choose> 
      <c:when test="${id ne null}">
        <p>Current User: ${id} </p> 
    </c:when>
   <c:otherwise> <p>You need Login. </p> </c:otherwise>
  </c:choose>
</c:when> 
<c:when test="${param.page == 9}">
       <H3>HomePage Manage Center(Administrator Only)</H3>
        <hr>
     <c:choose> 
      <c:when test="${id eq 'admin'}">
        <p>Current User: ${id} </p> 
        <p><a href="./manager/status">Tomcat Server Status(ID: ${id})</a></p> 
    </c:when>
   <c:otherwise> <p>Administrator Only. </p> </c:otherwise>
  </c:choose>
</c:when> 
<c:otherwise>
   <div class="divbody" id="divbody">
  <p>This Site is designed for My Personal Blog </p>
        <p>And This Site is for Old Web Browser User!! </p>
       <p>If You use Modern Browser Like IE11, Latest Version of FireFox and Chrome, Please use <a href="./maintest.jsp?page=1">this ver of MyBlog</a></p>
      <p></p>
     <hr>
        <p>Latest Web Browser Download Link</p>
            <hr>
           <p><a href="./ChromeSetup(2018).exe">Google Chrome(Windows 7 or Higher)</a></p>
          <p><a href="./FireFox52Setup.exe">Mozilla FireFox(Windows XP)</a></p>
         <hr>
       <p>NOTICE: if you use Windows Me Millennium Edition or older Operating System, Please Upgrade. </p> 

 </div>
</c:otherwise>
</c:choose>
   <div class="footer" style="margin-bottom:0">
   <p> Last updated: July 18th, 2021 </p>
   <p> NO Copyright Required. But Don't use this web site to make illegal stuff </p>
   <p id=currentDate></p>
   </div> 
</BODY>
</HTML> 
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

