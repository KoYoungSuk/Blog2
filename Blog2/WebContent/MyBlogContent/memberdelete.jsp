<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
                 <div class="col-sm-4" style="margin: 70px; padding: 0px; border: ridge; background-color: #DCDCDC; ">
                       <H3 class="htitle"> Delete Member </H3>
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
                        <hr>
                        <p>&nbsp;&nbsp; If you click Delete Button, this Member is Deleted. Continue? </p>
                         <div style="text-align: right;">
                         <button class="btn btn-danger btn-sm" type="button" onclick="location.href='deleteMember.do'"><span class="material-symbols-outlined">delete</span>Yes!, Delete </button>
                         <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1)"><span class="material-symbols-outlined">arrow_back_ios</span>NO! Back</button>
                         &nbsp;&nbsp;
                         </div>
                 </div>
