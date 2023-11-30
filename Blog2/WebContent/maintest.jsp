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
<c:import url="MyBlogContent/login.jsp" var="logincontent"></c:import> 
<c:import url="MyBlogContent/FindIDPasswordContent.jsp" var="FindIDPasswordContent"></c:import> 
<c:import url="MyBlogContent/findid.jsp" var="findidcontent"></c:import>
<c:import url="MyBlogContent/findpw.jsp" var="findpwcontent"></c:import> 
<c:import url="MyBlogContent/changepassword.jsp" var="changepwcontent"></c:import> 
<c:import url="MyBlogContent/filelist.jsp" var="filelistcontent"></c:import> 
<c:import url="MyBlogContent/uploadfile.jsp" var="uploadfilecontent"></c:import> 
<c:import url="MyBlogContent/downloadfile.jsp" var="downloadfilecontent"></c:import> 
<c:import url="MyBlogContent/modifyfile.jsp" var="modifyfilecontent"></c:import> 
<c:import url="MyBlogContent/deletefile.jsp" var="deletefilecontent"></c:import>
<c:import url="MyBlogContent/customize.jsp" var="customizecontent"></c:import> 
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
<c:when test="${param.page == 24}"><c:set var="titlename" value="Files" /></c:when>
<c:when test="${param.page == 25}"><c:set var="titlename" value="Upload Files" /></c:when> 
<c:when test="${param.page == 26}"><c:set var="titlename" value="Download Files"/></c:when> 
<c:when test="${param.page == 27}"><c:set var="titlename" value="Modify Files" /></c:when> 
<c:when test="${param.page == 28}"><c:set var="titlename" value="Delete Files" /></c:when>
<c:when test="${param.page == 29}"><c:set var="titlename" value="Site Customize" /></c:when> 
<c:when test="${param.page == 0}">
<script>
   var host_url = window.location.host; 
   window.location.href= "http://" + host_url + "/non.htm"; 
 </script>
</c:when>
<c:otherwise><c:set var="titlename" value="Main Page" /></c:otherwise></c:choose>
<!DOCTYPE HTML>
<html>
<head>
<title> PersonalWeb ( <c:out value="${titlename}" /> ) </title>
<meta charset = "utf-8">
<!-- Ignore Internet Explorer 8 Compatible Mode. (But I don't recommend any version of Internet Explorer. -->
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
<script>

    document.addEventListener('keydown', (event) => {
	  
    var address = window.location.href; 

    //방향키를 이용하여 페이지를 앞뒤로 왔다갔다 하는 기능 
    if(address.includes("maintest.jsp?page=3") || address.includes("main.do?page=3") || address.includes("boardlist.do")){
        if(event.key === "ArrowLeft"){ //왼쪽 방향키를 눌렀을때 
      	  if(address.includes("?pagecount=")){
      		  address = address.slice(0, -1);
      		  var pagenum_minus = ${param.pagecount} - 1; //JSTL Code 
      		  if(pagenum_minus >= 9){ //페이지 번호가 10자리수를 넘어갈때 
      			  address = address.slice(0, -1); 
      		  }
      		  else if(pagenum_minus < 0){ //첫 페이지 번호에 도달했을때 
      			  pagenum_minus = 0; 
      		  }
      		  address = address + pagenum_minus;
      		  window.location.replace(address); va
      	  }
        }
        else if(event.key === "ArrowRight"){ //오른쪽 방향키를 눌렀을때 
            if(address.includes("?pagecount=")){
          	  address = address.slice(0, -1);
      		  var pagenum_plus = ${param.pagecount} + 1; //JSTL Code 
                if(pagenum_plus >= 11){ //페이지 번호가 10자리수를 넘어갈때 
              	  address = address.slice(0, -1); 
                } 
                
                if(pagenum_plus > ${sessionScope.pagenum}){ //마지막 페이지 번호에 도달했을때 
              	  pagenum_plus = pagenum; 
                }
      		  address = address + pagenum_plus; 
      		  window.location.replace(address); 
      	  }
      	  else{ //첫 페이지일때(첫 접속)
      		  address = address + "?pagecount=2"; //2번째 페이지로 이동 
      		  window.location.replace(address); 
      	  }
        }
    }
    
});

</script>
</head>
<body>
  <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
       <!-- Hamburger Button -->
      <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#ToggleMenu" aria-controls="ToggleMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="material-symbols-outlined">menu</span></button>
      <a class="nav-item navbar-brand" href="./main.do?page=1"><span class="material-symbols-outlined">sticky_note_2</span>PERSONAL WEB</a>
      <div class="collapse navbar-collapse" id="ToggleMenu">
       <div class="navbar-nav">
           <a class="nav-item nav-link" href="./main.do?page=1"><span class="material-symbols-outlined">home</span>Home </a> 
           <a class="nav-item nav-link" href="./boardlist.do"> <span class="material-symbols-outlined">list</span>MemoList </a>
           <a class="nav-item nav-link" href="./filelist.do"><span class="material-symbols-outlined">draft</span>Files</a>
        <c:choose>
        <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
           <a class="nav-item nav-link" href="./main.do?page=6"><span class="material-symbols-outlined">manage_accounts</span>Manage Center </a>
        </c:when>
        <c:otherwise></c:otherwise>
        </c:choose>
        <a class="nav-item nav-link" href="./main.do?page=13"><span class="material-symbols-outlined">more</span>ETC</a>
        <a class="nav-item nav-link" href="./main.do?page=29"><span class="material-symbols-outlined"><span class="material-symbols-outlined">tune</span></span>Site Customize</a>
        <a class="nav-item nav-link" href="./main.do?page=16"><span class="material-symbols-outlined">info</span>About </a>
        </div>
       </div>
       <c:choose>
       <c:when test="${sessionScope.id ne null}"> <!-- 로그인 되어 있을때 -->
         <button class="btn btn-dark" onclick="location.href='totalmember.do'"> Current User ID: ${id}, Current User Name: ${sessionScope.fullname} </button>
         <button class="btn btn-danger btn-sm" onclick="location.href='signout.do?check=1'"><span class="material-symbols-outlined">logout</span>Logout</button>
       </c:when>
       <c:otherwise>
          <!-- 로그인 되어 있지 않을때  -->
            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href= './main.do?page=18'"><span class="material-symbols-outlined">login</span>Login</button>
            &nbsp;
            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='./main.do?page=2'"><span class="material-symbols-outlined">person_add</span>Sign up</button>
      </c:otherwise>
      </c:choose>
</nav>
<div class="jumbotron" >
   <H1> PERSONAL WEB </H1>
   <H4><c:out value="${titlename}" /> </H4>
</div>
<!-- 파라미터에 따라 출력할 JSP 모듈 내용 지정 -->
<div class="container-fluid">
<div class="row">
<c:choose>
<c:when test="${param.page == 1}"> <!-- Main Page -->
${defaultcontent}
</c:when>
<c:when test="${param.page ==2}"> <!-- Sign up -->
${signupcontent}
</c:when>
<c:when test="${param.page == 3}"> <!-- Board List -->
${boardlistcontent}
</c:when> 
<c:when test="${param.page == 6}"> <!-- Management Center (Administrator Only) -->
${homepagemanagecontent}
</c:when> 
<c:when test="${param.page ==7}"> <!-- Member Information -->
${memberinfocontent}
</c:when> 
<c:when test="${param.page == 8}"> <!-- Member Modify -->
${membermodifycontent}
</c:when> 
<c:when test="${param.page == 9}"> <!-- Delete Member -->
${memberdeletecontent}
</c:when>
<c:when test="${param.page == 11 }"> <!-- Total Member List (Administrator Only) -->
${totalmembercontent}
</c:when>
<c:when test="${param.page == 12}"> <!-- Write Board -->
${writeboardcontent}
</c:when> 
<c:when test="${param.page == 13}"> <!-- ETC  -->
${etccontent}
</c:when>
<c:when test="${param.page == 14}"> <!-- Detail Board -->
${detailboardcontent}
</c:when>
<c:when test="${param.page == 16}"> <!-- About -->
${aboutcontent}
</c:when>
<c:when test="${param.page == 17}"> <!-- Modify Board -->
${modifyboardcontent}
</c:when>
<c:when test="${param.page == 18}"> <!-- Login -->
${logincontent}
</c:when>
<c:when test="${param.page == 19}"> <!-- Find ID and Password -->
${FindIDPasswordContent}
</c:when>
<c:when test="${param.page == 20}"> <!-- Delete Board -->
${deleteboardcontent}
</c:when>
<c:when test="${param.page == 21}"> <!-- Find ID -->
${findidcontent}
</c:when>
<c:when test="${param.page == 22}"> <!-- Find Password -->
${findpwcontent}
</c:when> 
<c:when test="${param.page == 23}"> <!-- Change Password -->
${changepwcontent}
</c:when>
<c:when test="${param.page == 24}"> <!-- File List -->
${filelistcontent}
</c:when> 
<c:when test="${param.page == 25}"> <!-- Upload File -->
${uploadfilecontent}
</c:when>
<c:when test="${param.page == 26}"> <!-- Download File -->
${downloadfilecontent}
</c:when>
<c:when test="${param.page == 27}"> <!-- Modify File -->
${modifyfilecontent}
</c:when>
<c:when test="${param.page == 28}"> <!-- Delete File -->
${deletefilecontent}
</c:when>
<c:when test="${param.page == 29}"> <!-- Customize Settings -->
${customizecontent}
</c:when>
<c:otherwise>
${defaultcontent}
</c:otherwise>
</c:choose>
</div>
</div> 
<div class="footer">
   <p> Last updated: Wednesday, November 29th, 2023 </p>
   <p> This is not copyrighted. But Don't use this web site to make illegal stuff. </p>
   <p id=currentDate></p>
</div>
</body>
</html> 
<!--Clock JavaScript Start -->
<script>

var date = new Date();
var calendarMonth = date.getMonth() + 1;

//Javascript에서 ==와 === 연산자 차이 => ==는 그냥 값만 같으면 됨, ===는 자료형까지 같아야 함(엄격하게 비교)
//사실 여기서는 ==만 써도 됨(자료형 상관없음.)

if("${cookie.colorcode.value}" === null || "${cookie.colorcode.value}".length === 0){ //기본값 
	//Seasonal Easter Egg
	if(calendarMonth == 1){ //Jan 
	   document.getElementByClassName("htitle").innerHTML = "Happy New Year " + calendarYear + "!"; //Happy New Year! 
	   const body = document.querySelector("body"); 
	   const footer = document.getElementByClassName("footer"); 
	   
	   body.style.backgroundImage = "url('/pictures/happynewyear.jpg')"; 
	   footer.style.color = "black"; 
	}
	else if(calendarMonth == 12){ //December 
	   document.getElementByClassName("htitle").innerHTML = "Merry Christmas!"; 
	   const htitle = document.getElementByClassName("htitle"); 
	   const body = document.querySelector("body"); 
	   const table = document.querySelector("table"); 
	   /*
	     document.getElementById: id로 가져온다.
	     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
	   */
	   htitle.style.backgroundColor = "#c54245"; //Christmas Red HTITLE 
	   body.style.backgroundColor = "green"; //Christmas Green Wallpaper 
	   table.style.backgroundColor = "white"; //Christmas Card Style 
	}
	else if(calendarMonth >= 7 && calendarMonth <= 8){ //July and August (Beach Theme)
		const body = document.querySelector("body"); 
		const table = document.querySelector("table"); 
		/*
		     document.getElementById: id로 가져온다.
		     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
		*/
		body.style.backgroundColor = "#186690"; //Blue 
		table.style.backgroundColor = "#f6f0fc"; //Sand Color 2 
	}
	else if(calendarMonth == 10){ //Autumn Theme (October )
		const htitle = document.getElementByClassName("htitle"); 
		const body = document.querySelector("body"); 
		   /*
		     document.getElementById: id로 가져온다.
		     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
		   */
		htitle.style.backgroundColor = "#cc9d3a";
		body.style.backgroundColor = "#8f2323";  
	}
	else if(calendarMonth >= 3 && calendarMonth <= 4){ //March & April (Cherry Blossom Theme)
		const htitle = document.getElementByClassName("htitle"); 
		const body = document.querySelector("body"); 
		const footer = document.getElementByClassName("footer"); 
		   /*
		     document.getElementById: id로 가져온다.
		     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
		   */
		body.style.backgroundImage = "url('/pictures/cherrybloosm.jpg')"; 
		body.style.color = "black"; 
		htitle.style.backgroundColor ="#e3aab5"; //Cherry Blossom 
		footer.style.color = "black"; 
		footer.style.backgroundColor = "#87ceeb"; //skyblue 
	}
	else{ //기본 색깔 
		const body = document.querySelector("body");
	
		body.style.backgroundColor = "#008080"; //Microsoft Windows 9x/NT Background Color 
	}
}
else{ //색깔 변경
	const body = document.querySelector("body");
	
	body.style.backgroundColor = "${cookie.colorcode.value}"; 
}

 //자바스크립트 시계(Javascript Clock)
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
