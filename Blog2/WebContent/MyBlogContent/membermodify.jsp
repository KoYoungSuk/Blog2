<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
             <div class="col-sm-4" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
                  <H3 class="htitle" style="border: ridge;"> Modify Member </H3>
                  <h6>&nbsp;&nbsp; NOTICE: After modify member, You must login again.</h6>
                           <form action="modifymember.do" method="POST">
                           <div style="text-align: right;">
                           <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
                           <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Modify</button>
                           &nbsp;&nbsp; 
                           </div>
                           <table class="table">
                              <tr>
                               <td><label for="id">ID:</label></td>
                               <td><input class="form-control" type="text" value= "${sessionScope.id}" name="ID"  readonly /></td>
                              </tr>
                              <tr>
                              <td><label for="firstname">First Name:</label></td>
                              <td><input class="form-control" type="text" name="firstname" value= "${sessionScope.firstname}"  /></td>
                              </tr>
                              <tr>
                              <td><label for="lastname">Last Name:</label></td>
                              <td><input class="form-control" type="text" name="lastname" value= "${sessionScope.lastname}" /></td>
                              </tr>
                              <tr>
                              <td><label for="birthday">Birthday:</label></td>
                              <td><input class="form-control" type="text" name="birthday" value= "${sessionScope.memberidlist['birthday']}" /></td>
                              </tr>
                              <tr>
                              <td><label for="mailaddress">MailAddress:</label></td>
                              <td><input class="form-control" type="text" name="mailaddress" value= "${sessionScope.memberidlist['mailaddress']}" /></td>
                              </tr>
                           </table>
                           <br> 
                            </form>
           </div>
   