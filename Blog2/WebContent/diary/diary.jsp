<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- JSP 모듈 파일 임포트  -->
<c:import url="../DiaryContent/diarylist.jsp" var="diarylistcontent"></c:import>
<c:import url="../DiaryContent/detail.jsp" var="detailcontent"></c:import>
<c:import url="../DiaryContent/write.jsp" var="writecontent"></c:import>
<c:import url="../DiaryContent/modify.jsp" var="modifycontent"></c:import>
<c:import url="../DiaryContent/delete.jsp" var="deletecontent"></c:import>
<!-- 파라미터에 따른 제목 설정 -->
<c:choose>
<c:when test="${param.page == 2}"><c:set var="titlename" value="(Detail Diary)" /></c:when>
<c:when test="${param.page == 3}"><c:set var="titlename" value="(Write Diary)" /></c:when>
<c:when test="${param.page == 4}"><c:set var="titlename" value="(Modify Diary)" /></c:when>
<c:when test="${param.page == 5}"><c:set var="titlename" value="(Delete Diary)" /></c:when>
<c:otherwise></c:otherwise>
</c:choose>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}"> <!-- 관리자 모드로만 사용가능 -->
<c:redirect url="../3217"></c:redirect>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Friendly Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap 4.4 CSS -->
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<!-- Google Span Buttons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>MyDiary(Web) | ${titlename} </title>
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
	  reader.readAsText(file, file.encoding)
	  reader.onload = function() {
		  txttitle.innerText = file.name; 
		  console.log("file: ", file.name);
		  txtcontext.innerHTML =  reader.result; 
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
 
  document.addEventListener('keydown', (event) => {
	  
      var address = window.location.href; 
  
      //방향키를 이용하여 페이지를 앞뒤로 왔다갔다 하는 기능 
      if(address.includes("diary.jsp?page=1") || address.includes("diary/diarylist")){
          if(event.key === "ArrowLeft"){ //왼쪽 방향키를 눌렀을때 
        	  if(address.includes("?page_count_diary=")){
        		  address = address.slice(0, -1);
        		  var pagenum_minus = ${param.page_count_diary} - 1; //JSTL Code 
        		  if(pagenum_minus >= 9){ //페이지 번호가 10자리수를 넘어갈때 
        			  address = address.slice(0, -1); 
        		  }
        		  else if(pagenum_minus < 0){ //첫 페이지 번호에 도달했을때 
        			  pagenum_minus = 0; 
        		  }
        		  address = address + pagenum_minus;
        		  window.location.replace(address); 
        	  }
          }
          else if(event.key === "ArrowRight"){ //오른쪽 방향키를 눌렀을때 
              if(address.includes("?page_count_diary=")){
            	  address = address.slice(0, -1);
        		  var pagenum_plus = ${param.page_count_diary} + 1; //JSTL Code 
                  if(pagenum_plus >= 11){ //페이지 번호가 10자리수를 넘어갈때 
                	  address = address.slice(0, -1); 
                  } 
                  
                  if(pagenum_plus > ${sessionScope.page_num_diary}){ //마지막 페이지 번호에 도달했을때 
                	  pagenum_plus = pagenum; 
                  }
        		  address = address + pagenum_plus; 
        		  window.location.replace(address); 
        	  }
        	  else{ //첫 페이지일때(첫 접속)
        		  address = address + "?page_count_diary=2"; //2번째 페이지로 이동 
        		  window.location.replace(address); 
        	  }
          }
      }
      
  });

</script>
</head>
<body>
<div class="container-fluid"> 
<div class="row"> 
<div class= "col-lg-8" style="padding: 0px; margin: 70px; background-color: #DCDCDC; ">
    <h3 class="htitle">
    MyDiary(Web) (Current User: ${sessionScope.id} ) ${titlename} 
    </h3>
    <c:choose>
    <c:when test="${param.checkcal ne 'cal'}">
    <div style="text-align: center;">
    <button type="button" onclick="history.go(-1);" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
	<button type="button" onclick="location.href='../signout.do?check=2'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
	<button type="button" onclick="location.href='../diary'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">home</span>Diary Main Page</button>
    </div>
    </c:when>
    <c:otherwise></c:otherwise>
    </c:choose>
	<hr> 
	<c:choose>
	 <c:when test="${page.param == 1}"> <!--  Total Diary List -->
      ${diarylistcontent}
	 </c:when>
	 <c:when test="${param.page == 2}"> <!-- Detail Diary List -->
	 ${detailcontent}
	</c:when>
	<c:when test="${param.page == 3}"> <!--  Write Diary -->
	 ${writecontent}
	</c:when>
	<c:when test="${param.page == 4}"> <!--  Modify Diary -->
     ${modifycontent}
	</c:when>
    <c:when test="${param.page == 5}"> <!--  Delete Diary -->
     ${deletecontent}
    </c:when>
    <c:otherwise>
     ${diarylistcontent}
    </c:otherwise>
	</c:choose>
</div>
</div>
</div> 
<div class="footer">
	<p>Last updated: Wednesday, November 8th, 2023 </p>
	<p>This is not copyrighted. But Don't use this illegally.</p>
</div>
</body>
</html>