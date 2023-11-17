<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-4" style="background-color: #DCDCDC; margin: 70px; padding: 0px;"> 
<H3 class="htitle" style="border: ridge;"> Change Password </H3>
<hr> 
<c:choose>
<c:when test="${sessionScope.id ne null}">
<form action="changepassword.do" method="POST">
  <table class="table">
    <tr>
     <td><label for="Current Password" style="font-weight: bold; font-size: 20px;">Current Password:</label></td>
     <td><input type="password" class="form-control" name="currentpassword" /></td> 
    </tr> 
    <tr>
     <td><label for="Password" style="font-weight: bold; font-size: 20px; ">New Password:</label></td>
     <td><input type="password" class="form-control" name="password" /></td> 
    </tr> 
    <tr>
     <td><label for="Password Confirmed" style="font-weight: bold; font-size: 20px; ">New Password Confirmed:</label></td>
     <td><input type="password" class="form-control" name="cpassword" /></td> 
    </tr> 
  </table>
  <div style="text-align: center;">
    <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Change Password</button> 
  </div> 
  <br>
  <p></p> 
</form>
</c:when>
<c:otherwise>
  <script>
    alert("You need to login");
    history.go(-1); 
  </script>
</c:otherwise> 
</c:choose>
</div> 