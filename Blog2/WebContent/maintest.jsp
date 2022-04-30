<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
<c:when test="${param.page == 19}"><c:set var="titlename" value="Open Source" /></c:when>
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
 <div class="container" style="margin-top:20px">
<div class="row">
   <div class="col-md-6">
     <h2>Welcome to MyBlog! </h2>
     <hr>
     <h5> This Web Site is designed for Personal Blog Site. </h5>
     <h5> This Web Site is being developed yet. </h5>
   </div>
   <div class="col-md-6">
     <h2>Why I make this?</h2>
     <hr>
     <h5>Under Construction</h5>
  </div>
</div>
<hr>
 <div class="row">
  <div class="col-md-12">
  <h2>Under Construction</h2>
  <hr>
  <h5>Under Construction</h5>
  </div>
 </div>
</div>
</div>
</c:when>
<c:when test="${param.page ==2}"> 
<div class="container" style="margin-top:20px">
<div class="row">
  <div class="col-sm-12">
<c:choose>
<c:when test="${sessionScope.id eq null}">
<form class="signup-content" method="post" action="./checksignup.do">
<H2> Sign-up Menu. </H2>
<hr>
<p> if you use this website perfectly,  you need to make your account. </p>
<p> you need to type id, password, confirmed password to make your account. </p>
<p>  
But typing your birthday your name(First name, Last name)  is optional. 
</p>
<p>Birthday: for example: 1999-12-31 or 2000-01-01 </p>
<p>
<hr>
<table>
   <thead>
     <tr>
       <td><label for="id"><b>ID:</b></label></td>
       <td><input type="text" placeholder="ID" name="id" ></td>
     </tr>
     <tr>
       <td><label for="password"><b>Password:</b></label></td>
       <td><input type="password" placeholder="password" name="password" required></td>
     </tr>
     <tr>
      <td><label for="password"><b>Confirmed Password:</b></label></td>
      <td><input type="password" placeholder="Confirmed Password" name="cpassword" required></td>
     </tr>
     <tr>
       <td><label for="first_name"><b>First Name(optional):</b></label></td>
       <td><input type="text" placeholder="First Name" name="first_name"></td>
     </tr>
     <tr>
      <td><label for="last_name"><b>Last Name(optional):</b></label></td>
      <td><input type="text" placeholder="Last Name" name="last_name"></td>
     </tr>  
     <tr>
     <td> <label for="birthday"><b> Your Birthday(optional/YYYY-MM-DD): </b></label> </td>
     <td> <input type="text" placeholder="Birthday(YYYY-MM-DD)" name="birthday"> </td>
     </tr>
   </tbody>
</table>
<hr>
  <button class="btn btn-success" type="submit"> Sign up </button>
 <button class="btn btn-warning" type="button" onclick="location.href='./maintest.jsp' "> Back to Main Page </button>
</form>
</c:when>
<c:otherwise>
   <p>Logined User can't use Signup Page. </p>
   <hr>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-danger" onclick="location.href='signout.do'">Logout</button>
</c:otherwise>
</c:choose>
</div>
</div>
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
        <table>
            <thead>
                         <tr>
                            <th>Number</th>
                            <th>Title</th>
                            <th>Save Date</th>
                            <th>Modify Date</th>
                            <th>Access</th>
                            <th>Clicks</th>
                            <th>Delete</th>
                         </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="boardDO" items="${requestScope.boardlist}" varStatus="status">
                            <tr>
                            <td><c:out value="${boardDO.serialnumber}" /></td>
                            <td><a href="detailboard.do?number=${boardDO.serialnumber}&access=admin&clicks=${boardDO.clicks}"><c:out value="${boardDO.title}" /></a></td>
                            <td><c:out value="${boardDO.savedate}" /></td>
                            <td><c:out value="${boardDO.modifydate}" /></td>
                            <td><c:out value="${boardDO.anonymous}" /></td>
                            <td><c:out value="${boardDO.clicks}" /></td>
                            <td><a href="deleteboard.do?number=${boardDO.serialnumber}">Delete</a></td>
                            </tr>
                             </c:forEach>
           </tbody>
        </table>
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
    <table>
          <thead>
              <tr>
                  <th>Number</th>
                  <th>Title</th>
                  <th>Save Date</th>
                  <th>Modify Date</th>
                  <th>Access</th>
                  <th>Clicks</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="boardDO" items="${requestScope.boardlist}" varStatus="status">       
                  <c:choose>
                  <c:when test="${boardDO.anonymous eq 'anonymous'}">
                  <tr>
                  <td><c:out value="${boardDO.serialnumber}" /></td>
                  <td><a href="detailboard.do?number=${boardDO.serialnumber}&access=anonymous&clicks=${boardDO.clicks}"><c:out value="${boardDO.title}" /></a></td>
                  <td><c:out value="${boardDO.savedate}" /></td>
                  <td><c:out value="${boardDO.modifydate}" /></td>
                  <td><c:out value="${boardDO.anonymous}" /></td>
                  <td><c:out value="${boardDO.clicks}" /></td>
                  </tr>
                  </c:when>
                  <c:otherwise></c:otherwise>
                  </c:choose>
                  </c:forEach>
                  </tbody>
                  </table>
                  <hr>
                  <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
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
     <table>
          <thead>
              <tr>
                  <th>Number</th>
                  <th>Title</th>
                  <th>Save Date</th>
                  <th>Modify Date</th>
                  <th>Access</th>
                  <th>Clicks</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="boardDO" items="${requestScope.boardlist}" varStatus="status">
                  <c:choose>
                  <c:when test="${boardDO.anonymous eq 'member'}">
                  <tr>
                  <td><c:out value="${boardDO.serialnumber}" /></td>
                  <td><a href="detailboard.do?number=${boardDO.serialnumber}&access=member&clicks=${boardDO.clicks}"><c:out value="${boardDO.title}" /></a></td>
                  <td><c:out value="${boardDO.savedate}" /></td>
                  <td><c:out value="${boardDO.modifydate}" /></td>
                  <td><c:out value="${boardDO.anonymous}" /></td>
                  <td><c:out value="${boardDO.clicks}" /></td>
                  </tr>
                  </c:when>
                  <c:otherwise></c:otherwise>
                  </c:choose>
                  </c:forEach>
                  </tbody>
                  </table>
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
<div class="container" style="margin-top:20px">
<div class="row">
<div class="col-sm-12">
 <h3>HomePage Manage Center </h3>
   <hr>  
    <c:choose>
     <c:when test="${sessionScope.id eq 'admin'}">
       <p>Current User: ${sessionScope.id} </p>
       <p><a href="/manager/status">Tomcat Server Status(ID: ${id})</a></p>
       <p><a href="/dbmanager">JSPOracleManager</a></p>
       <p><a href="/totaldb.do">DataBase Administration Center</a>
      </c:when>
     <c:otherwise>
       <p>Administrator Only. </p> 
    </c:otherwise>
   </c:choose> 
</div>
</div>
</div>
</c:when> 
<c:when test="${param.page ==7}">
  <div class="container" style="margin-top:20px">
   <div class="row">
   <div class="col-sm-12">
 <h3>Member Info </h3>
       <hr> 
     <c:choose> 
     <c:when test="${sessionScope.id ne null}">
        <table border=1>
         <tr>
            <td>ID:</td>
            <td><c:out value="${sessionScope.memberidlist[0]}" /></td>
         </tr>
         <tr>
            <td>First Name:</td>
            <td><c:out value="${sessionScope.memberidlist[2]}" /></td>
         </tr>    
         <tr>
            <td>Last Name:</td>
            <td><c:out value="${sessionScope.memberidlist[3]}" /></td>
         </tr>    
         <tr>
            <td>Full Name:</td>
            <td><c:out value="${sessionScope.memberidlist[2]}" /><c:out value="${sessionScope.memberidlist[3]}" /></td>
         </tr>
         <tr>
            <td>Birthday:</td>
            <td><c:out value="${sessionScope.memberidlist[4]}" /></td>
         </tr>   
         <tr>
            <td>Join Date:</td>
            <td><c:out value="${sessionScope.memberidlist[5]}" /></td>
         </tr>        
        </table>
     <hr>
     <button class="btn btn-success" onclick="location.href='main.do?page=8'">Modify Member</button>            
     <button class="btn btn-danger"onclick="location.href='main.do?page=9'">Delete Member</button>
     </c:when>
     <c:otherwise>
       <p>Please Login. </p> 
    </c:otherwise>
   </c:choose>
 </div>
 </div>
</div>
</c:when> 
<c:when test="${param.page == 8}">
  <div class="container" style="margin-top:20px">
         <div class="row">
             <div class="col-sm-12">
                  <H3> Modify Member Information </H3>
                  <h6>NOTICE: After modify member, You must login again.</h6>
                  <hr>
                 <c:choose>
                       <c:when test="${sessionScope.id ne null}">
                           <form action="modifymember.do" method="POST">
                           <table>
                              <tr>
                               <td><label for="id">ID:</label></td>
                               <td><input type="text" value= ${sessionScope.id} name="ID"  readonly /></td>
                              </tr>
                              <tr>
                                <td><label for="password">New Password:</label></td>
                                <td><input type="password" name="password" required /></td>
                              </tr>
                              <tr>
                                <td><label for="cpassword">New Password Confirmed:</label></td>
                                <td><input type="password" name="cpassword" required /></td>
                              </tr>
                              <tr>
                              <td><label for="firstname">First Name:</label></td>
                              <td><input type="text" name="firstname" value= ${sessionScope.firstname}   /></td>
                              </tr>
                              <tr>
                              <td><label for="lastname">Last Name:</label></td>
                              <td><input type="text" name="lastname" value= ${sessionScope.lastname} /></td>
                              </tr>
                              <tr>
                              <td><label for="birthday">Birthday:</label></td>
                              <td><input type="text" name="birthday" value= ${sessionScope.birthday} /></td>
                              </tr>
                           </table>
                           <hr>
                            <button class="btn btn-success" type="submit">Modify</button>
                           <button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
                           <button class="btn btn-primary" type="button" onclick="location.href='maintest.jsp'">Back to Main Page</button>
                            </form>
                       </c:when>
                       <c:otherwise> <p> You need to Login. </p> </c:otherwise>
                      </c:choose>
           </div>
        </div>
   </div>
</c:when> 
<c:when test="${param.page == 9}">
     <div class="container" style="margin-top:20px">
          <div class="row">
                 <div class="col-sm-12">
                       <H3> Delete Member Information </H3>
                       <hr>
                       <c:choose>
                      <c:when test="${sessionScope.id ne null}">
                         <table border="1">           
                         <tr>
                         <td>ID:</td>
                         <td><c:out value="${sessionScope.memberidlist[0]}" /></td>
                         </tr>  
                         <tr>
                         <td>First Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[2]}" /></td>
                         </tr>    
                          <tr>
                         <td>Last Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[3]}" /></td>
                        </tr> 
                           <tr>
                         <td>Full Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[2]}" /><c:out value="${sessionScope.memberidlist[3]}" /></td>
                           </tr>   
                        <tr>
                         <td>Birthday:</td>
                         <td><c:out value="${sessionScope.memberidlist[4]}" /></td>
                        </tr>   
                        <tr>
                         <td>Join Date:</td>
                         <td><c:out value="${sessionScope.memberidlist[5]}" /></td>
                        </tr>        
                        </table>
                         <p></p>
                         <p>If you click Delete Button, this Member is Deleted. Continue? </p>
                         <button class="btn btn-success" type="button" onclick="location.href='deleteMember.do?id=${id}'">Yes!, Delete </button>
                         <button class="btn btn-success" type="button" onclick="location.href='maintest.jsp'">NO! Back to Main Page</button>
                         <button class="btn btn-success" type="button" onclick="history.go(-1)">NO! Back</button>
                      </c:when>
                      <c:otherwise>
                          <p>You need to Login. </p>
                      </c:otherwise>
                     </c:choose>
                 </div>
          </div>
    </div>
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
    <div class="container" style="margin-top:20px">
         <div class="row">
             <div class="col-sm-12">
                 <h1>Write Board</h1> 
                <hr>
                 <c:choose>
                    <c:when test="${sessionScope.id eq 'admin'}">
                           <form action="board.do" method="POST">
                            <table>
                           <tr>
                           <td><p><label for="title">Title:</label></td><td><input type="text" name="title" style="width:500px;" required /></p></td>
                           </tr>
                           <tr>
                           <td><p><label for="user">User ID:</label></td><td><input type="text" name="id" value='${sessionScope.id}'  style="width:500px;"  readonly  /></p></td>
                            <tr>
                            <td> <p><label for="content">Content:</label></p></td>
                           <td><p><textarea rows="15" cols="68" autofocus name="content" wrap="hard" ></textarea></p></td>
                            </tr>
                            <tr>
                           <td><p><label for="anonymous">Choose Access Mode</label></p></td>
                           <td><input type="radio" name="access" value="admin" checked>Administrater Mode&nbsp;&nbsp;<input type="radio" name="access" value="member">Member Mode
                           &nbsp;&nbsp;<input type="radio" name="access" value="anonymous">NonMember Mode</td>
                           </tr>
                           </table>
                           <hr>
                           <button class="btn btn-success" type="submit">Post Board</button>
                          <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
                           </form>
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
<c:when test="${param.page == 13}">
  <div class="container" style="margin-top: 20px">
    <div class="row">
       <div class="col-sm-12">
          <h1>ETC Service Link</h1>
          <hr>
         <p><a href="timer.html">Timer Page</a></p>
         <p><a href="/diary">PersonalDiary Web Mode</a>
         <p><a href="https://kysot.yspersonal.com:1443">Total DataBase Administrate System</a></p>
         <p><a href="https://kysot.yspersonal.com">MyBlog&ETC(Second Server)</a></p>
      </div>
    </div>
    </div>
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
           <c:when test="${param.access eq sessionScope.boardlist[6]}">
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
   <div class="container" style="margin-top:20px">
    <div class="row">
     <div class="col-sm-12">
       <H1>About</H1>
       <hr>
       <p>First Updated: Tuesday, February 25th 2020 </p>
       <p>Last Updated: Thursday, January 27th 2022 </p>
       <c:choose>
       <c:when test="${sessionScope.id ne null }">
       <p>Based Language: HTML5, CSS, JavaScript, JSP(Java Server Page)</p>
       <p>Server Operating System: <% out.println(System.getProperty("os.name")); %></p>
       <p>Server Info: <%= application.getServerInfo() %></p>
       <p>OpenJDK Version: OpenJDK Ver 8(Development)/OpenJDK Ver 11(Real Server) </p>
       <p>DataBase: Oracle DataBase 18c Express Edition </p>
       <p>
       <a href="http://www.dnsever.com" target="dnsever"><img src="http://banner.dnsever.com/dnsever-banner_170x35.gif" border="0" alt="DNS server, DNS service"></a>
       </p>
       <p><a href="/download"> Download Center(Source and Tools)</a><p>
       <p><a href="https://github.com/KoYoungSuk/Blog2.git">GitHub Source</a></p>
       </c:when>
       </c:choose>
       <p>This is not copyrighted. But don't use this illegally.</p>
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     </div>
    </div>
   </div>
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
           <td><input type="radio" name="access" value="admin" checked>Administrater Mode&nbsp;&nbsp;<input type="radio" name="access" value="member">Member Mode
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
          <button type="button" class="btn btn-primary" onclick="location.href='maintest.jsp?page=1'">NO, BACK TO MAIN PAGE!</button>
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
   <div class="container" style="margin-top:20px">
   <div class="row">
   <div class="col-md-6">
     <h2> Welcome to MyBlog! </h2>
     <hr>
     <h5> This Web Site is designed for Personal Blog Site. </h5>
     <h5> This Web Site is being developed yet. </h5>
   </div>
   <div class="col-md-6">
     <h2>Why I make this? </h2>
     <hr>
     <h5>Under Construction.</h5>
  </div>
</div>
<hr>
 <div class="row">
  <div class="col-md-12">
  <h2>Under Construction</h2>
  <hr>
  <h5>Under Construction.</h5>
  </div>
 </div>
</div>
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

