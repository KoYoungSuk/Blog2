<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-4" style="margin: 70px; padding: 0px; background-color: #DCDCDC; ">
      <h3 class="htitle" style="border: ridge;">Member Info </h3>
      <div style="text-align: right;">
         <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
         <button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=8'"><span class="material-symbols-outlined">create</span>Modify</button>            
         <button class="btn btn-danger btn-sm"onclick="location.href='main.do?page=9'"><span class="material-symbols-outlined">delete</span>Delete</button>
         &nbsp;&nbsp; 
      </div>
      <br> 
        <table class="table">
         <tr>
            <td>ID:</td>
            <td><c:out value="${sessionScope.id}" /></td>
         </tr>
         <tr>
            <td>First Name:</td>
            <td><c:out value="${sessionScope.firstname}" /></td>
         </tr>    
         <tr>
            <td>Last Name:</td>
            <td><c:out value="${sessionScope.lastname}" /></td>
         </tr>    
         <tr>
            <td>Full Name:</td>
            <td><c:out value="${sessionScope.fullname}" /></td>
         </tr>
         <tr>
            <td>Birthday:</td>
            <td><c:out value="${sessionScope.memberidlist['birthday']}" /></td>
         </tr>   
         <tr>
            <td>Join Date:</td>
            <td><c:out value="${sessionScope.memberidlist['joindate']}" /></td>
         </tr>        
        </table>
      <br> 
 </div>
 