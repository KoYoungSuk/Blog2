<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<title>PersonalDiary Web Mode</title>
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
</head>
<body>
 <div class="jumbotron">
	<h1>PersonalDiary Web Mode</h1>
	<h5>2022-04-24</h5>
</div>
<hr>
<div class="container" style="margin-top: 15px">
   <div class="col-sm-12">
	<p>Only Administrator can use PersonalDiary Web Mode. Sorry.... </p>
	<hr>
	<c:choose>
	 <c:when test="${page.param == 1}">
	<input type="button" type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-primary" value="Write" />
	<input type="button" type="button" onclick="history.go(-1);" class="btn btn-primary" value="Back" />
	<input type="button" type="button" onclick="location.href='../main.do'" class="btn btn-primary" value="Back To Main Page" />
	<input type="button" type="button" onclick="location.href='../signout.do'" class="btn btn-primary" value="Logout" />
	<hr>
	<c:choose>
	  <c:when test="${sessionScope.id eq 'admin'}">
	   <p> Current User: ${sessionScope.id} </p>
       <hr>
        <table border="1">
            <thead>
                <tr>
                 <th>Number</th>
                 <th>Title</th>
                 <th>Save Date</th>
                 <th>Modify Date</th>
                 <th>Delete</th>
               </tr>
               </thead>
            <tbody>
               <c:forEach var="DiaryDO" items="${sessionScope.diarylist}" varStatus="status">
               <tr>
                   <td><c:out value="${status.index}" /></td>
                   <td><a href="detaildiary?title=${DiaryDO.title}"><c:out value="${DiaryDO.title}" /></a></td>
                   <td><c:out value="${DiaryDO.savedate}" /></td>
                   <td><c:out value="${DiaryDO.modifydate}" /></td>
                   <td><a href="deletediary?title=${DiaryDO.title}">Delete</a></td>
               </tr>
              </c:forEach>
           </tbody>
        </table>
	  </c:when>
	  <c:otherwise>
	  <p>Administrator Only.</p>
	  </c:otherwise>
	</c:choose>
    <hr>
	 </c:when>
	 <c:when test="${param.page == 2}">
	 <c:choose>
	    <c:when test="${sessionScope.id eq 'admin' }">
	    <table border="1">
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><c:out value="${requestScope.diarylist[0]}" /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><c:out value="${requestScope.diarylist[1]}" /></td>
	</tr>
	<tr>
	  <td><label for="savedate">작성 날짜:</label></td>
	  <td><c:out value="${requestScope.diarylist[2]}" /></td>
	</tr>
	<tr>
	  <td><label for="modifydate">수정 날짜:</label></td>
	  <td><c:out value="${requestScope.diarylist[3]}" /></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" onclick="location.href='modifydiary?title=${requestScope.title}'" type="button">Modify</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diary.jsp?page=1'" type="button">Back To Main Page(PersonalDiary)</button>
	<button class="btn btn-primary" onclick="location.href='../main.do'" type="button">Back To Main Page(MyBlog)</button>
	  </c:when>
	 <c:otherwise>
	   <p>Administrator Only.</p>
	 </c:otherwise>
	 </c:choose>
	</c:when>
	<c:when test="${param.page == 3}">
	<c:choose>
	 <c:when test="${sessionScope.id eq 'admin' }">
	   <form action="writediary" method="POST">
	  <table>
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><input type="text" name="title" required /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea rows="15" cols="61" name="context" autofocus wrap="hard"></textarea></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" type="submit">Write</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diarylist.jsp'" type="button">Back To The Main Page(PersonalDiary)</button>
	<button class="btn btn-primary" onclick="location.href='../maintest.jsp'" type="button">Back To The Main Page(MyBlog)</button>
	</form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
	</c:choose>
	</c:when>
	<c:when test="${param.page == 4}">
    <c:choose>
	 <c:when test="${sessionScope.id eq 'admin' }">
	 <form action="modifydiary" method="POST">
	  <table>
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><input type="text" name="title" value= "${requestScope.diarylist[0]}" readonly /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea rows="15" cols="61" name="context" autofocus wrap="hard">${requestScope.diarylist[1]}</textarea></td>
	</tr>
	</table>
	<hr> 
	<button class="btn btn-primary" type="submit">Modify</button>
	<button class="btn btn-primary" onclick="history.go(-1);" type="button">Back</button>
	<button class="btn btn-primary" onclick="location.href='diarylist.jsp'" type="button">Back To The Main Page(PersonalDiary)</button>
	<button class="btn btn-primary" onclick="location.href='../maintest.jsp'" type="button">Back To The Main Page(MyBlog)</button>
	</form>
	 </c:when>
	 <c:otherwise>
	  <p>Administrator Only</p>
	 </c:otherwise>
	</c:choose>
	</c:when>
    <c:when test="${param.page == 5}">
     <c:choose>
      <c:when test="${sessionScope.id eq 'admin' }">
       Delete 
      </c:when>
      <c:otherwise>
      <p>Administrator Only</p>
      </c:otherwise>
     </c:choose>
    </c:when>
    <c:otherwise>
      <input type="button" type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-primary" value="Write" />
	<input type="button" type="button" onclick="history.go(-1);" class="btn btn-primary" value="Back" />
	<input type="button" type="button" onclick="location.href='../maintest.jsp'" class="btn btn-primary" value="Back To The Main Page" />
	<hr>
	<c:choose>
	  <c:when test="${sessionScope.id eq 'admin'}">
	   <p> Current User: ${sessionScope.id} </p>
       <hr>
        <table border="1">
            <thead>
                <tr>
                 <th>Number</th>
                 <th>Title</th>
                 <th>Save Date</th>
                 <th>Modify Date</th>
                 <th>Delete</th>
               </tr>
               </thead>
            <tbody>
               <c:forEach var="DiaryDO" items="${sessionScope.diarylist}" varStatus="status">
               <tr>
                   <td><c:out value="${status.index}" /></td>
                   <td><a href="detaildiary?title=${DiaryDO.title}"><c:out value="${DiaryDO.title}" /></a></td>
                   <td><c:out value="${DiaryDO.savedate}" /></td>
                   <td><c:out value="${DiaryDO.modifydate}" /></td>
                   <td><a href="deletediary?title=${DiaryDO.title}">Delete</a></td>
               </tr>
              </c:forEach>
           </tbody>
        </table>
         </c:when>
	  <c:otherwise>
	  <p>Administrator Only.</p>
	  </c:otherwise>
	</c:choose>
    <hr>
    </c:otherwise>
	</c:choose>
  </div>
 </div>
 <hr>
  <div class="footer">
	<p>Last updated:  </p>
	<p>This is not copyrighted.</p>
</div>
</body>
</html>