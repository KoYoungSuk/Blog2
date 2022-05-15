<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top:20px">
         <div class="row">
             <div class="col-sm-12">
                  <H3> Modify Member Information </H3>
                  <h6>NOTICE: After modify member, You must login again.</h6>
                  <hr>
                 <c:choose>
                       <c:when test="${sessionScope.id ne null}">
                           <form action="modifymember.do" method="POST">
                           <table>
                              <tr>
                               <td><label for="id">ID:</label></td>
                               <td><input type="text" value= "${sessionScope.id}" name="ID"  readonly /></td>
                              </tr>
                              <tr>
                                <td><label for="password">New Password:</label></td>
                                <td><input type="password" name="password" required /></td>
                              </tr>
                              <tr>
                                <td><label for="cpassword">New Password Confirmed:</label></td>
                                <td><input type="password" name="cpassword" required /></td>
                              </tr>
                              <tr>
                              <td><label for="firstname">First Name:</label></td>
                              <td><input type="text" name="firstname" value= "${sessionScope.firstname}"  /></td>
                              </tr>
                              <tr>
                              <td><label for="lastname">Last Name:</label></td>
                              <td><input type="text" name="lastname" value= "${sessionScope.lastname}" /></td>
                              </tr>
                              <tr>
                              <td><label for="birthday">Birthday:</label></td>
                              <td><input type="text" name="birthday" value= "${sessionScope.memberidlist['birthday']}" /></td>
                              </tr>
                           </table>
                           <hr>
                           <button class="btn btn-success" type="submit">Modify</button>
                           <button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
                           <button class="btn btn-primary" type="button" onclick="location.href='main.do'">Back to Main Page</button>
                            </form>
                       </c:when>
                       <c:otherwise> <p> You need to Login. </p> </c:otherwise>
                      </c:choose>
           </div>
        </div>
   </div>