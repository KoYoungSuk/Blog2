<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title> Error Page </title>
      <style>
       body
       {
         background-color: #008080; 
       }
       button
       {
         width: 200px;
         height: 40px;
         font-size: 18px;
         background-color: #DCDCDC;
       }
       .htitle
       {
         background-color: blue; 
         text-align: center;
         color: white;
         border: ridge; 
       }
       .total
       {
         padding: 0px;
         margin: 210px;
         background-color: #DCDCDC; 
       }
       
      </style>
   </head>
   <body>
     <div class="total">
     
     <c:choose>
      <c:when test="${param.page == 3217}"> 
        <H2 class="htitle"> Error 3217  </H2>
        <h4> &nbsp;&nbsp;&nbsp;&nbsp; 접근이 거부된 사용자입니다. (Error Code: 3217) </h4>
      </c:when>
      <c:when test="${param.page == 404}">
         <H2 class="htitle"> 404 Not Found  </H2>
         <h4> &nbsp;&nbsp;&nbsp;&nbsp; 페이지를 찾을 수 없습니다. (Error Code: 404) </h4>
      </c:when>
      <c:when test="${param.page == 403}">
       <H2 class="htitle"> 403 Access Denied </H2>
       <h4> &nbsp;&nbsp;&nbsp;&nbsp; 액세스가 거부되었습니다. (Error Code: 403) </h4>
      </c:when>
      <c:when test="${param.page == 500}">
       <H2 class="htitle"> 500 Internal Server Error  </H2>
       <h4> &nbsp;&nbsp;&nbsp;&nbsp; 오류가 발생하여 페이지를 표시할 수 없습니다. (Error Code: 500) </h4>
      </c:when>
      <c:otherwise>
        <H2 class="htitle"> %nbsp;%nbsp; </H2>
        <h4> &nbsp;&nbsp;&nbsp;&nbsp; (Unknown Error Message) </h4>
      </c:otherwise>
     </c:choose>
      
      <div style="text-align: center">
      <button onclick="location.href='https://home.yspersonal.com'">Back to Main Page</button> 
      <button onclick="history.go(-1);">Back</button>   
      </div>  
       <br> 
      </div>
     
     <div class="total">
          <H2 class="htitle">Your Computer Information</H2>
          <p id="address"> </p> 
          <p id="osver"></p>
          <p id="browserver"></p>
          <p id="time"></p>
          <br>
     </div>
      
     <div class="total">
          <H2 class="htitle"> Footer </H2>
          <p> Last updated: Tuesday, June 13th, 2023 </p> 
          <p> NO Copyright Required. But don't use this for illegal purpose. </p>
          <br> 
     </div>
   </body>
</html> 
<script>
var currdate = new Date();
var address2 = window.location.href;
var OSName="Unknown OS";
//if (navigator.appVersion.indexOf("Windows NT 11.0")!=-1) OSName="Windows Core";
if (navigator.appVersion.indexOf("Windows NT 10.0")!=-1) OSName="Windows 10/11/Server 2016/2019/2022";
if (navigator.appVersion.indexOf("Windows NT 6.4") !=-1) OSName="Windows Threshold(10 Beta)";
if (navigator.appVersion.indexOf("Windows NT 6.3") !=-1) OSName="Windows 8.1/Server 2012 R2";
if (navigator.appVersion.indexOf("Windows NT 6.2") !=-1) OSName="Windows 8/Server 2012";
if (navigator.appVersion.indexOf("Windows NT 6.1") !=-1) OSName="Windows 7/Server 2008 R2";
if (navigator.appVersion.indexOf("Windows NT 6.0") !=-1) OSName="Windows Vista/Server 2008";
if (navigator.appVersion.indexOf("Windows NT 5.2") !=-1) OSName="Windows Server 2003/XP 64-BIT EDITION";
if (navigator.appVersion.indexOf("Windows NT 5.1") !=-1) OSName="Windows XP";
if (navigator.appVersion.indexOf("Windows Me") !=-1) OSName="Windows Millennium Edition";
if (navigator.appVersion.indexOf("Windows NT 5.0") !=-1) OSName="Windows 2000/NT 5.0";
if (navigator.appVersion.indexOf("Windows 98") !=-1) OSName="Windows 98/98SE";
if (navigator.appVersion.indexOf("Windows NT 4.0") !=-1) OSName="Windows NT 4.0";
if (navigator.appVersion.indexOf("Windows 95") !=-1) OSName="Windows 95";
if (navigator.appVersion.indexOf("Mac")!=-1) 
 {
      if (navigator.maxTouchPoints == 0) 
      {
         OSName = "Mac OS X/macOS/OSX";
      }
      else 
      {
         OSName = "iPad OS/iOS";
      }
 }
if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux(Ubuntu, Redhat, ETC)";
document.getElementById("osver").innerHTML = "Your OS : " + OSName;
document.getElementById("browserver").innerHTML = "Your Browser : " + navigator.userAgent; 
document.getElementById("time").innerHTML = currdate + "";
document.getElementById("address").innerHTML = "Current Address : " + address2 + ""; 
</script>
<!-- Last updated : 2021-01-01 -->