<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <div class="container" style="margin-top:20px">
          <div class="row">
                 <div class="col-sm-12" id="smalldiv" style="margin: 0px; padding: 0px;">
                       <H3 class="htitle"> Delete Member Information </H3>
                       <hr>
                         <table class="table table-striped" style="border:1px solid">           
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
                         <p></p>
                         <p>If you click Delete Button, this Member is Deleted. Continue? </p>
                         <button class="btn btn-success" type="button" onclick="location.href='deleteMember.do'">Yes!, Delete </button>
                         <button class="btn btn-success" type="button" onclick="location.href='main.do'">NO! Back to Main Page</button>
                         <button class="btn btn-success" type="button" onclick="history.go(-1)">NO! Back</button>
                 </div>
          </div>
    </div>