<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px">
  <div class="row">
    <div class="col-sm-12">
     <h1>Modify Bulletin Board</h1>
     <hr>
     <c:choose>
      <c:when test="${sessionScope.id eq 'admin'}">
        <form action="modifyboard.do" method="POST">
          <table>
           <tr>
            <td><label for="Number">Number:</label></td>
            <td><input type="text" name="number"  style="width:500px;" value="${sessionScope.totalboardlist[0]}" readonly /></td>
           </tr>
           <tr>
            <td><label for="UserId">UserId:</label></td>
            <td><input type="text" name="userid" style="width:500px;" value="${sessionScope.totalboardlist[1]}" readonly /></td>
           </tr>
           <tr>
            <td><label for="Title">Title:</label></td>
            <td><input type="text" name="title" style="width:500px;" value='${sessionScope.totalboardlist[2]}' required /></td>
           </tr>
           <tr>
            <td><label for="content">Content:</label></td>
           <td><textarea rows="15" cols="68" autofocus name="content" wrap="hard" >${sessionScope.totalboardlist[3]}</textarea></td>
           </tr>
            <tr>
           <td><label for="anonymous">Choose Access Mode</label></td>
           <td><input type="radio" name="access" value="admin" checked>Administrator Mode&nbsp;&nbsp;<input type="radio" name="access" value="member">Member Mode
           &nbsp;&nbsp;<input type="radio" name="access" value="anonymous">NonMember Mode</td>
          </tr>
          </table>
          <hr>
          <button class="btn btn-success" type="submit">Modify</button>
          <button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
        </form>
      </c:when>
      <c:otherwise><p>Administrator Only</p><hr><button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button></c:otherwise>
     </c:choose>
    </div>
  </div>
 </div>