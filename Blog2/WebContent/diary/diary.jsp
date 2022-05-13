<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../DiaryContent/diarylist.jsp" var="diarylistcontent"></c:import>
<c:import url="../DiaryContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../DiaryContent/write.jsp" var="writecontent"></c:import>
<c:import url="../DiaryContent/modify.jsp" var="modifycontent"></c:import>
<c:import url="../DiaryContent/delete.jsp" var="deletecontent"></c:import>
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
	<input type="button" type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-primary" value="Write" />
	<input type="button" type="button" onclick="history.go(-1);" class="btn btn-primary" value="Back" />
	<input type="button" type="button" onclick="location.href='../main.do'" class="btn btn-primary" value="Back To Main Page" />
	<input type="button" type="button" onclick="location.href='../signout.do?check=2'" class="btn btn-primary" value="Logout" />
	<hr>
	<c:choose>
	 <c:when test="${page.param == 1}">
      ${diarylistcontent}
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
    <c:when test="${param.page == 5}">
     ${deletecontent}
    </c:when>
    <c:otherwise>
     ${diarylistcontent}
    </c:otherwise>
	</c:choose>
  </div>
 </div>
 <hr>
  <div class="footer">
	<p>Last updated: May 13th, 2022 </p>
	<p>This is not copyrighted. But Don't use this illegally.</p>
</div>
</body>
</html>