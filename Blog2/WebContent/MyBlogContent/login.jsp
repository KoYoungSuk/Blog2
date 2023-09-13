<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-4" style="background-color: #DCDCDC; margin: 70px; padding: 0px;">
<form class="signup-content" method="post" action="./login.do">
<H3 class="htitle" style="border: ridge;"> Login </H3>
<hr>
<c:choose>
<c:when test= "${sessionScope.id eq null}" >
<table class="table">
   <thead>
     <tr>
       <td><label for="id"><b>ID:</b></label></td>
       <td><input type="text" class="form-control" placeholder="ID" name="id" ></td>
     </tr>
     <tr>
       <td><label for="password"><b>Password:</b></label></td>
       <td><input type="password" class="form-control" placeholder="Password" name="password" required></td>
     </tr>
   </tbody>
</table>
<hr>
<div style="text-align: right; ">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back </button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">login</span> Login </button>
 <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='main.do?page=19'"><span class="material-symbols-outlined">search</span>Find ID and Password</button>
  &nbsp;&nbsp; 
</div>
</c:when>
<c:otherwise>
<p>Actually Loginned.</p> 
</c:otherwise>
</c:choose>
<br> 
</form>
</div>