<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://fonts.googleapis.com/css?family=VT323' rel='stylesheet'>
<title>Error Message</title>
<style>
body{
  background-color: black;
  color: white; 
  font-family: 'VT323';
  font-size: 22px; 
}
</style>
</head>
<body>
<div style="margin: auto; width: 90%; max-width: 500px; padding-top: 10%; text-align: center">
  <H2 style="background-color: lightgray; color: black; ">
  <c:choose> 
  <c:when test="${param.code == 404}">
  Error Message: 404 
  </c:when>
  <c:when test="${param.code == 500}">
  Error Message: 500 
  </c:when>
  <c:otherwise>
  Error Message: 404 
  </c:otherwise>
  </c:choose>
  </H2>
 </div>
 <br> 
 <div style="margin: auto; width=90%; max-width: 700px; text-align: center;">
     <c:choose>
     <c:when test="${param.code == 404}">
     <p>Page Not Found</p>
     </c:when>
     <c:when test="${param.code == 500}">
     <p>Internal Server Error</p>
     </c:when>
     <c:otherwise>
     <p>Page Not Found</p> 
     </c:otherwise>
     </c:choose>
     <p id="address"> </p> 
     <p id="osver"></p>
     <p id="browserver"></p>
     <p id="time"></p>
     <br>
     <p><a style="color: white;" href="#" onclick="history.go(-1);">Click this to Back.</a></p> 
     <p><a style="color: white;" href="http://home.yspersonal.com/main.do">Click this to go main page. </a></p> 
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