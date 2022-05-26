<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../DiaryContent/diarylist.jsp" var="diarylistcontent"></c:import>
<c:import url="../DiaryContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../DiaryContent/write.jsp" var="writecontent"></c:import>
<c:import url="../DiaryContent/modify.jsp" var="modifycontent"></c:import>
<c:import url="../DiaryContent/delete.jsp" var="deletecontent"></c:import>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}">
<c:redirect url="/error_3217.html"></c:redirect>
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
<script>
  function openTextFile(){
	  var input = document.createElement("input");
	  input.type = "file";
	  input.accept = "text/plain";
	  
	  input.onchange = function (event) {
		  processFile(event.target.files[0]);
	  };
	  
	  input.click();
  }
  
  function processFile(file){
	  var reader = new FileReader();
	  reader.onload = function() {
		  txtcontext.innerHTML = reader.result;
	  };
	  reader.readAsText(file, "utf-8");
  }
  
  function saveAsFile(){
	  var fileName = document.getElementById("txttitle").innerText; 
	  var content = document.getElementById("txtcontent").innerText;
	  var blob = new Blob([content], {type: 'text/plain'});
	  objURL = window.URL.createObjectURL(blob);
	  if(window.__Xr_objURL_forCreatingFile__){
		  window.URL.revokeObjURL(window.__Xr_objURL_forCreatingFile__);
	  }
	  window.__Xr_objURL_forCreatingFile__ = objURL;
	  var a = document.createElement('a');
	  a.download = fileName;
	  a.href = objURL;
	  a.click();
  }
</script>
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
	<p>Last updated: May 21st, 2022 </p>
	<p>This is not copyrighted. But Don't use this illegally.</p>
</div>
</body>
</html>