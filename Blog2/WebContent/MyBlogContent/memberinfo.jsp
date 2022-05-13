<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top:20px">
   <div class="row">
   <div class="col-sm-12">
 <h3>Member Info </h3>
       <hr> 
     <c:choose> 
     <c:when test="${sessionScope.id ne null}">
        <table border=1>
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
            <td><c:out value="${sessionScope.memberidlist[4]}" /></td>
         </tr>   
         <tr>
            <td>Join Date:</td>
            <td><c:out value="${sessionScope.memberidlist[5]}" /></td>
         </tr>        
        </table>
     <hr>
     <button class="btn btn-success" onclick="location.href='main.do?page=8'">Modify Member</button>            
     <button class="btn btn-danger"onclick="location.href='main.do?page=9'">Delete Member</button>
     </c:when>
     <c:otherwise>
       <p>Please Login. </p> 
    </c:otherwise>
   </c:choose>
 </div>
 </div>
 </div>