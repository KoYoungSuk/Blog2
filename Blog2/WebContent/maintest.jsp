﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<c:choose>
<c:when test="${param.page == 1}"><c:set var="titlename" value="Main Page" /></c:when>
<c:when test="${param.page == 2}"><c:set var="titlename" value="Sign up" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="Board(Administrator Mode)" /></c:when>
<c:when test="${param.page == 4}"><c:set var="titlename" value="NonMember Mode" /></c:when>
<c:when test="${param.page == 5}"><c:set var="titlename" value="Board(Member Mode)" /></c:when>
<c:when test="${param.page == 6}"><c:set var="titlename" value="HomePage Manage Center" /></c:when>
<c:when test="${param.page == 7}"><c:set var="titlename" value="Member Info" /></c:when>
<c:when test="${param.page == 8}"> <c:set var="titlename" value="Modify Member" /></c:when>
<c:when test="${param.page == 9}"><c:set var="titlename" value="Delete Member" /></c:when>
<c:when test="${param.page == 11}"><c:set var="titlename" value="DataBase Administration Center" /></c:when>
<c:when test="${param.page == 12}"><c:set var="titlename" value="Write Bulletin Board" /></c:when>
<c:when test="${param.page == 13}"><c:set var="titlename" value="ETC Service Link" /></c:when>
<c:when test="${param.page == 14}"><c:set var="titlename" value="Bulletin Board Detail" /></c:when>
<c:when test="${param.page == 15}"><c:set var="titlename" value="Modify Bulletin Board" /></c:when>
<c:when test="${param.page == 16}"><c:set var="titlename" value="About" /></c:when>
<c:when test="${param.page == 17}"><c:set var="titlename" value="Bulletin Board" /></c:when>
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
        <li class="nav-item"><a class="nav-link" href="./boardlist.do?access=anonymous">NonMember Mode </a> </li>
       <c:choose>
      <c:when test="${sessionScope.id ne null}">
        <li class="nav-item"><a class="nav-link" href="./boardlist.do?access=admin"> Board(Administrator Mode)</a></li>
        <li class="nav-item"><a class="nav-link" href="./boardlist.do?access=member"> Board(Member Mode) </a></li>
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
    <div class="container" style="margin-top:20px"> 
       <div class="row">
       <div class="col-sm-12">
      <h3>Bulletin Board(Administrator Mode)</h3>
     <hr>
       <c:choose>
       <c:when test="${sessionScope.id eq 'admin'}">
       <p> Current User: ${sessionScope.id} </p>
       <hr>
        ${boardlistcontent}
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
       <button class="btn btn-success" onclick="location.href='main.do?page=12'">Go To Write</button>
     </c:when>
     <c:otherwise>
       <p>Administrator Only. </p>
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
    </c:otherwise>
   </c:choose>
 </div>
</div>
</div>
</c:when> 
<c:when test="${param.page == 4}">
<div class="container" style="margin-top:20px">
<div class="row">
<div class="col-sm-12">
<h3>NonMember Mode</h3>
<hr>
    <c:choose>
     <c:when test="${sessionScope.id ne null}">
       <p> You are already Member. </p>
       <p> Current User: ${sessionScope.id} </p>
     </c:when> 
     <c:otherwise></c:otherwise>
   </c:choose>
  <hr>
   ${boardlistcontent}
</div>
</div>
</div>
</c:when>
<c:when test="${param.page == 5}">
<div class="container" style="margin-top:20px">
<div class="row">
<div class="col-sm-12">
     <h3> Bulletin Board(Member Mode) </h3>
     <hr>
     <c:choose>
     <c:when test="${sessionScope.id ne null}">
     <p> Current User: ${sessionScope.id} </p>
     <hr>
     ${boardlistcontent}
     <hr>
     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     </c:when> 
     <c:otherwise>
     <p>You need Login.</p>
     <hr>
     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     </c:otherwise>
   </c:choose>
</div>
</div>
</div>
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
    <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-12">
                 <H3>DataBase Administration Center </H3>
                 <hr>
                 <c:choose>
                   <c:when test="${sessionScope.id eq 'admin'}">
                         <table border=1>
                         <thead>
                         <tr>
                            <th>Number</th>
                            <th>ID</th>
                            <th>Password</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Birthday</th>
                            <th>Join Date</th>
                            <th>Detail</th>
                            <th>Delete</th>
                         </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="memberDO" items="${sessionScope.memberlist}" varStatus="status">
                            <tr>
                            <td>${status.count}</td>
                            <td><c:out value="${memberDO.id}" /></td>
                            <td><c:out value="${memberDO.password}" /></td>
                            <td><c:out value="${memberDO.firstname}" /></td>
                            <td><c:out value="${memberDO.lastname}" /></td>
                            <td><c:out value="${memberDO.birthday}" /></td>
                            <td><c:out value="${memberDO.joindate}" /></td>
                            <td><a href="totalmember.do?id=${memberDO.id}">Detail</a></td>
                            <td><a href="deleteMember.do?id=${memberDO.id}&number=2">Delete</a></td>
                            </tr>
                             </c:forEach>
                         </tbody>
                         </table>
                         <hr>
                        <button class="btn btn-primary" onclick="location.href='totaldb.do'">Refresh</button>
                   </c:when>
                   <c:otherwise>
                     <p>Administrator Only.</p>
                     <hr>
                   </c:otherwise>
                 </c:choose>
                 <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
             </div>
        </div>
    </div>
</c:when>
<c:when test="${param.page == 12}">
  ${writeboardcontent}
</c:when> 
<c:when test="${param.page == 13}">
${etccontent}
</c:when>
<c:when test="${param.page == 14}">
    <div class="container" style="margin-top: 20px">
      <div class="row">
        <div class="col-sm-12">
          <h1>게시글 내용</h1>
          <hr>
          <c:choose>
          <c:when test="${sessionScope.id ne null}">
          <c:choose>
          <c:when test="${sessionScope.id eq 'admin'}">
           <table border=1>
           <tr>
            <td>작성자 ID:</td>
            <td>${requestScope.boardlist[1]}</td>
           </tr>
           <tr>
            <td>글 번호:</td>
            <td>${requestScope.boardlist[0]}</td>
           </tr>
           <tr>
            <td>제목:</td>
            <td>${requestScope.boardlist[2]}</td>
           </tr>
           <tr>
            <td>내용:</td>
            <td>${requestScope.boardlist[3]}</td>
           </tr>
           <tr>
            <td>작성 시간:</td>
            <td>${requestScope.boardlist[4]}</td>
           </tr>
           <tr>
            <td>수정 시간:</td>
            <td>${requestScope.boardlist[5]}</td>
           </tr>
           <tr>
             <td>접근 모드:</td>
             <td>${requestScope.boardlist[6]}</td>
           </tr>
            <tr>
             <td>조회수:</td>
             <td>${requestScope.boardlist[7]}</td>
           </tr>
          </table>
          </c:when>
          <c:otherwise>
           <c:choose>
           <c:when test="${param.access ne 'admin'}">
           <table border=1>
           <tr>
            <td>작성자 ID:</td>
            <td>${requestScope.boardlist[1]}</td>
           </tr>
           <tr>
            <td>글 번호:</td>
            <td>${requestScope.boardlist[0]}</td>
           </tr>
           <tr>
            <td>제목:</td>
            <td>${requestScope.boardlist[2]}</td>
           </tr>
           <tr>
            <td>내용:</td>
            <td>${requestScope.boardlist[3]}</td>
           </tr>
           <tr>
            <td>작성 시간:</td>
            <td>${requestScope.boardlist[4]}</td>
           </tr>
           <tr>
            <td>수정 시간:</td>
            <td>${requestScope.boardlist[5]}</td>
           </tr>
           <tr>
             <td>접근 모드:</td>
             <td>${requestScope.boardlist[6]}</td>
           </tr>
            <tr>
             <td>조회수:</td>
             <td>${requestScope.boardlist[7]}</td>
           </tr>
          </table>
          </c:when>
          <c:otherwise><p>illegal access detected.</p></c:otherwise>
          </c:choose>
          </c:otherwise>
          </c:choose>
          </c:when>
          <c:otherwise>
           <c:choose>
           <c:when test="${param.access eq requestScope.boardlist[6]}">
           <c:choose>
           <c:when test="${param.access eq 'anonymous' }">
           <table border=1>
           <tr>
            <td>작성자 ID:</td>
            <td>${requestScope.boardlist[1]}</td>
           </tr>
           <tr>
            <td>글 번호:</td>
            <td>${requestScope.boardlist[0]}</td>
           </tr>
           <tr>
            <td>제목:</td>
            <td>${requestScope.boardlist[2]}</td>
           </tr>
           <tr>
            <td>내용:</td>
            <td>${requestScope.boardlist[3]}</td>
           </tr>
           <tr>
            <td>작성 시간:</td>
            <td>${requestScope.boardlist[4]}</td>
           </tr>
           <tr>
            <td>수정 시간:</td>
            <td>${requestScope.boardlist[5]}</td>
           </tr>
           <tr>
             <td>접근 모드:</td>
             <td>${requestScope.boardlist[6]}</td>
           </tr>
           <tr>
             <td>조회수:</td>
             <td>${requestScope.boardlist[7]}</td>
           </tr>
          </table>
          </c:when>
          <c:otherwise><p>illegal access detected.</p>
          </c:otherwise>
          </c:choose>
             </c:when>
             <c:otherwise>
              <p>illegal access detected.</p>
             </c:otherwise>
           </c:choose>
          </c:otherwise>
          </c:choose>
          <hr>
          <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
          <button class="btn btn-success" onclick="location.href='modifyboard.do?serial=${requestScope.boardlist[0]}'">Modify</button>
        </div>
      </div>
    </div>
</c:when>
<c:when test="${param.page == 15}">
  <div class="container" style="margin-top: 20px">
   <div class="row">
     <div class="col-sm-12">
      <H1>Board Modify</H1>
      <hr>
      <c:choose>
       <c:when test="${sessionScope.id eq 'admin'}">
       <p>TEST</p>
       </c:when>
       <c:otherwise>
        <p>Administrator Only</p>
        <hr>
        <button class="btn btn-primary" onclick="history.go(-1);">Back</button> 
      </c:otherwise>
      </c:choose>
     </div>
   </div>
  </div>
</c:when>
<c:when test="${param.page == 16}">
${aboutcontent}
</c:when>
<c:when test="${param.page == 17}">
 <div class="container" style="margin-top:20px">
  <div class="row">
    <div class="col-sm-12">
     <h1>Modify Bulletin Board</h1>
     <hr>
     <c:choose>
      <c:when test="${sessionScope.id eq 'admin'}">
        <form action="modifyboard.do" method="POST">
          <table>
           <tr>
            <td><label for="Number">Number:</label></td>
            <td><input type="text" name="number"  style="width:500px;" value="${requestScope.boardlist[0]}" readonly /></td>
           </tr>
           <tr>
            <td><label for="UserId">UserId:</label></td>
            <td><input type="text" name="userid" style="width:500px;" value="${requestScope.boardlist[1]}" readonly /></td>
           </tr>
           <tr>
            <td><label for="Title">Title:</label></td>
            <td><input type="text" name="title" style="width:500px;" value='${requestScope.boardlist[2]}' required /></td>
           </tr>
           <tr>
            <td><label for="content">Content:</label></td>
           <td><textarea rows="15" cols="68" autofocus name="content" wrap="hard" >${requestScope.boardlist[3]}</textarea></td>
           </tr>
            <tr>
           <td><label for="anonymous">Choose Access Mode</label></td>
           <td><input type="radio" name="access" value="admin" checked>Administrator Mode&nbsp;&nbsp;<input type="radio" name="access" value="member">Member Mode
           &nbsp;&nbsp;<input type="radio" name="access" value="anonymous">NonMember Mode</td>
          </tr>
          </table>
          <hr>
          <button class="btn btn-success" type="submit">Modify</button>
          <button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
        </form>
      </c:when>
      <c:otherwise><p>Administrator Only</p><hr><button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button></c:otherwise>
     </c:choose>
    </div>
  </div>
 </div>
</c:when>
<c:when test="${param.page == 19}">
  <div class="container" style="margin-top:20px">
    <div class="row">
       <div class="col-md-12">
           <h1>Under Construction</h1>
       </div>
    </div>
  </div>
</c:when>
<c:when test="${param.page == 20}">
  <div class="container" style="margin-top:20px">
    <div class="row">
        <div class="col-md-12">
           <h2>Delete Bullet Board</h2>
           <hr>
           <c:choose>
           <c:when test="${sessionScope.id eq 'admin'}">
           <form action="deleteboard.do" method="POST">
           <h5>CAUTION: YOU CAN'T CANCEL THIS JOB. </h5>
           <h5>Do you want to delete it?</h5>
           <hr>
           <table border=1>
           <tr>
            <td><Label for="id">작성자 ID:</Label></td>
            <td><input type="text" name="id" value="${requestScope.boardlist[1]}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="number">글 번호:</Label></td>
            <td><input type="text" name="number" value="${requestScope.boardlist[0]}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="title">제목:</Label></td>
            <td><input type="text" name="title" value="${requestScope.boardlist[2]}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="content">내용:</Label></td>
            <td><textarea rows="15" cols="68" autofocus name="content" wrap="hard" readonly>${requestScope.boardlist[3]}</textarea></td>
           </tr>
           <tr>
            <td><Label for="savedate">작성 시간:</Label></td>
            <td><input type="text" name="savedate" value="${requestScope.boardlist[4]}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="modifydate">수정 시간:</Label></td>
            <td><input type="text" name="modifydate" value="${requestScope.boardlist[5]}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="access">접근 모드:</Label></td>
            <td><input type="text" name="access" value="${requestScope.boardlist[6]}" readonly /></td>
           </tr>
            <tr>
             <td><Label for="clicks">조회수:</Label></td>
             <td><input type="text" name="clicks" value="${requestScope.boardlist[7]}" readonly /></td>
           </tr>
          </table>
          <hr>
          <button type="submit" class="btn btn-danger" >YES, DELETE!</button>
          <button type="button" class="btn btn-primary" onclick="history.go(-1);">NO, BACK!</button>
          <button type="button" class="btn btn-primary" onclick="location.href='boardlist.do?access=admin'">NO, BACK TO BOARD LIST!</button>
          <button type="button" class="btn btn-primary" onclick="location.href='main.do?page=1'">NO, BACK TO MAIN PAGE!</button>
          <hr>
           </form>
           </c:when>
           <c:otherwise>
           <p>Administrator Only</p>
           </c:otherwise>
           </c:choose>
           <hr>
        </div>
    </div>
  </div>
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
