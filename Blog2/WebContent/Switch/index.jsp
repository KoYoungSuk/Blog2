<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title> Switch  </title>
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
    .onp
    {
        background-color: red; 
        margin-top: 0px; 
        margin-bottom: 30px;
        margin-left: 250px; 
        margin-right: 250px; 
        padding: 10px; 
    }
    .offp
    {
        background-color: gray; 
        margin-top: 0px;
        margin-bottom: 30px;
        margin-left: 250px; 
        margin-right: 250px; 
        padding: 10px; 
    }
</style>
</head>
  <div class="col-sm-4" style="background-color: #DCDCDC; padding: 0px; margin: 120px;">
    <h3 class="htitle"> SWITCH </h3>
	<div style="text-align: center;"> 
	<form action="switchtoggle" method="POST">
	   <c:choose>
       <c:when test="${sessionScope.switchstatus eq 'ON'}"> <!--  스위치가 켜져 있을때 -->
        <h3 class="onp">Current Status: ON</h3>
        <input type="hidden" name="switchstatus" value="OFF" />  
        <button class="btn btn-secondary btn-lg" style="width: 300px; height: 150px; font-size: 65px; " type="submit">OFF</button> 
       </c:when>
       <c:otherwise> <!-- 스위치가 꺼졌을때 --> 
         <h3 class="offp">Current Status: OFF</h3>
         <input type="hidden" name="switchstatus" value="ON" /> 
         <button class="btn btn-danger btn-lg" style="width: 300px; height: 150px; font-size: 65px; " type="submit">ON</button>
       </c:otherwise>
       </c:choose> 
       <br>
       <hr> 
       <button class="btn btn-secondary btn-lg" style="width: 300px; height: 150px; font-size: 65px; " type="button" onclick="location.href='history.go(-1);'">BACK</button>
	</form>
	<hr> 
	<h3 id="currentDate"></h3>
	</div>
	<br> 
  </div>
  <div class="footer">
	<p>Last updated: Friday, June 30th, 2023 </p>
	<p>This is not copyrighted. But don't use this for illegally.</p>
  </div>
<body>
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