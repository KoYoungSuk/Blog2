<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <div class="container" style="margin-top:20px">
          <div class="row">
                 <div class="col-sm-12">
                       <H3> Delete Member Information </H3>
                       <hr>
                       <c:choose>
                      <c:when test="${sessionScope.id ne null}">
                         <table border="1">           
                         <tr>
                         <td>ID:</td>
                         <td><c:out value="${sessionScope.memberidlist[0]}" /></td>
                         </tr>  
                         <tr>
                         <td>First Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[2]}" /></td>
                         </tr>    
                          <tr>
                         <td>Last Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[3]}" /></td>
                        </tr> 
                           <tr>
                         <td>Full Name:</td>
                          <td><c:out value="${sessionScope.memberidlist[2]}" /><c:out value="${sessionScope.memberidlist[3]}" /></td>
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
                         <p></p>
                         <p>If you click Delete Button, this Member is Deleted. Continue? </p>
                         <button class="btn btn-success" type="button" onclick="location.href='deleteMember.do?id=${id}'">Yes!, Delete </button>
                         <button class="btn btn-success" type="button" onclick="location.href='main.do'">NO! Back to Main Page</button>
                         <button class="btn btn-success" type="button" onclick="history.go(-1)">NO! Back</button>
                      </c:when>
                      <c:otherwise>
                          <p>You need to Login. </p>
                      </c:otherwise>
                     </c:choose>
                 </div>
          </div>
    </div>