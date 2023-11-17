<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Friendly Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  	.computer{
		height:100vh; 
		width:100%; 
		text-align: center; 
	}
</style>
<title> ERROR 3217 </title>
</head>
<body>
   <div class="computer">
       <p> </p> 
       <img src="${sessionScope.new_picture}" /> 
   </div>
   <div style="text-align: center;">
    <button type="button" style="text-align: center; padding: 15px 50px; " onclick="history.go(-1); ">Back</button> 
    <button type="button" style="text-align: center; padding: 15px 50px;" onclick="location.href='${sessionScope.new_back_url}'">Back to Main Page</button>
   </div>
</body>
</html>