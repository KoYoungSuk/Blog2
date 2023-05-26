<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:import url="../DiaryContent/diarylist.jsp" var="diarylistcontent"></c:import>
<c:import url="../DiaryContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../DiaryContent/write.jsp" var="writecontent"></c:import>
<c:import url="../DiaryContent/modify.jsp" var="modifycontent"></c:import>
<c:import url="../DiaryContent/delete.jsp" var="deletecontent"></c:import>
<c:choose>
<c:when test="${param.page == 2}"><c:set var="titlename" value="(Detail Diary)" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="(Write Diary)" /></c:when>
<c:when test="${param.page == 4}"><c:set var="titlename" value="(Modify Diary)" /></c:when>
<c:when test="${param.page == 5}"><c:set var="titlename" value="(Delete Diary)" /></c:when>
<c:otherwise></c:otherwise>
</c:choose>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}"> <!-- 관리자 모드로만 사용가능 -->
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>MyDiary (Web) ${titlename} </title>
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
<script>
 //파일 열기 
  function openTextFile(){
	  var input = document.createElement("input");
	  input.type = "file";
	  input.accept = "text/plain";
	  
	  input.click(); 
	  input.onchange = function (event) {
		  processFile(event.target.files[0]);
	  };
  }
 //파일 처리 
  function processFile(file){
	  var reader = new FileReader();
	  reader.readAsText(file, "UTF-8")
	  reader.onload = function() {
		  title.innerHTML = file; 
		  txtcontext.innerHTML = reader.result;
	  };
  }
 //파일 저장 
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
<div class= "col-sm-8" style="padding: 0px; margin: 70px; background-color: #DCDCDC; ">
    <h3 class="htitle">
    MyDiary (Current User: ${sessionScope.id} ) ${titlename} 
    <button type="button" onclick="history.go(-1);" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
    <button type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
	<button type="button" onclick="location.href='../signout.do?check=2'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
    </h3>
	<p>&nbsp;&nbsp;Only Administrator can use WebDiary Web Mode. Sorry.... </p>
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
<div class="footer">
	<p>Last updated: Saturday, May 27th, 2023 </p>
	<p>This is not copyrighted. But Don't use this illegally.</p>
</div>
</body>
</html>