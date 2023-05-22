<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-6" style="border: ridge; background-color: #DCDCDC; margin: 70px; padding: 0px;">
<form class="signup-content" method="post" action="./checksignup.do">
<H3 class="htitle"> Sign-up </H3>
<hr>
<div>
<p> &nbsp;&nbsp; if you use this website perfectly,  you need to make your account. </p>
<p> &nbsp;&nbsp; you need to type id, password, confirmed password to make your account. </p>
<p> &nbsp;&nbsp; But typing your birthday your name(First name, Last name)  is optional. </p>
<p> &nbsp;&nbsp; Birthday: for example: 1999-12-31 or 2000-01-01 </p>
</div>
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
     <tr>
      <td><label for="password"><b>Confirmed Password:</b></label></td>
      <td><input type="password" class="form-control" placeholder="Confirmed Password" name="cpassword" required></td>
     </tr>
     <tr>
       <td><label for="first_name"><b>First Name(optional):</b></label></td>
       <td><input type="text" class="form-control" placeholder="First Name" name="first_name"></td>
     </tr>
     <tr>
      <td><label for="last_name"><b>Last Name(optional):</b></label></td>
      <td><input type="text" class="form-control" placeholder="Last Name" name="last_name"></td>
     </tr>  
     <tr>
     <td> <label for="birthday"><b> Your Birthday(optional/YYYY-MM-DD): </b></label> </td>
     <td> <input type="text" class="form-control" placeholder="Birthday(YYYY-MM-DD)" name="birthday"> </td>
     </tr>
   </tbody>
</table>
<hr>
<div style="text-align: right; ">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back </button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">person_add</span> Sign up </button>
  &nbsp;&nbsp; 
</div>
<br> 
</form>
</div>