<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px">
<div class="row">
  <div class="col-sm-12">
<c:choose>
<c:when test="${sessionScope.id eq null}">
<form class="signup-content" method="post" action="./checksignup.do">
<H2> Sign-up Menu. </H2>
<hr>
<p> if you use this website perfectly,  you need to make your account. </p>
<p> you need to type id, password, confirmed password to make your account. </p>
<p>  
But typing your birthday your name(First name, Last name)  is optional. 
</p>
<p>Birthday: for example: 1999-12-31 or 2000-01-01 </p>
<p>
<hr>
<table>
   <thead>
     <tr>
       <td><label for="id"><b>ID:</b></label></td>
       <td><input type="text" placeholder="ID" name="id" ></td>
     </tr>
     <tr>
       <td><label for="password"><b>Password:</b></label></td>
       <td><input type="password" placeholder="password" name="password" required></td>
     </tr>
     <tr>
      <td><label for="password"><b>Confirmed Password:</b></label></td>
      <td><input type="password" placeholder="Confirmed Password" name="cpassword" required></td>
     </tr>
     <tr>
       <td><label for="first_name"><b>First Name(optional):</b></label></td>
       <td><input type="text" placeholder="First Name" name="first_name"></td>
     </tr>
     <tr>
      <td><label for="last_name"><b>Last Name(optional):</b></label></td>
      <td><input type="text" placeholder="Last Name" name="last_name"></td>
     </tr>  
     <tr>
     <td> <label for="birthday"><b> Your Birthday(optional/YYYY-MM-DD): </b></label> </td>
     <td> <input type="text" placeholder="Birthday(YYYY-MM-DD)" name="birthday"> </td>
     </tr>
   </tbody>
</table>
<hr>
  <button class="btn btn-success" type="submit"> Sign up </button>
 <button class="btn btn-warning" type="button" onclick="location.href='./main.do' "> Back to Main Page </button>
</form>
</c:when>
<c:otherwise>
   <p>Logined User can't use Signup Page. </p>
   <hr>
   <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
   <button class="btn btn-danger" onclick="location.href='signout.do'">Logout</button>
</c:otherwise>
</c:choose>
</div>
</div>
</div>