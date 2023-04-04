<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px">
  <div class="row">
    <div class="col-sm-12" style="background-color: lightyellow; padding: 0px; margin: 0px">
     <h3 class="htitle">Modify Memo</h3>
     <hr>
        <form action="modifyboard.do" method="POST">
          <table class="table">
           <tr>
            <td><label for="Number">Number:</label></td>
            <td><input class="form-control mr-sm-10" type="text" name="number" value="${sessionScope.totalboardlist['number']}" readonly /></td>
           </tr>
           <tr>
            <td><label for="UserId">User ID:</label></td>
            <td><input class="form-control mr-sm-10" type="text" name="userid" value="${sessionScope.totalboardlist['userid']}" readonly /></td>
           </tr>
           <tr>
            <td><label for="Title">Title:</label></td>
            <td><input class="form-control mr-sm-10" type="text" name="title" value="${sessionScope.totalboardlist['title']}" required /></td>
           </tr>
           <tr>
            <td><label for="content">Content:</label></td>
            <td><textarea class="form-control mr-sm-10" rows="20" cols="100" autofocus name="content" wrap="hard" >${sessionScope.totalboardlist['content'] }</textarea></td>
           </tr>
           <tr>
           <td><label for="anonymous">Choose Access Mode</label></td>
           <td style="text-align: center;">
           <input type="radio" class="custom-control-input" name="access" id="jb-radio-1" value="admin" checked>
           <label class="custom-control-label" for="jb-radio-1">
           Administrator Mode
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </label>
           <input type="radio" class="custom-control-input" name="access" id="jb-radio-2" value="member">
           <label class="custom-control-label" for="jb-radio-2">
           Member Mode
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </label>
           <input type="radio" class="custom-control-input" name="access"  id="jb-radio-3" value="anonymous">
           <label class="custom-control-label" for="jb-radio-3">
           NonMember Mode
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </label>
           </td>
          </tr>
          </table>
          <hr>
          <div style="text-align: center;">
          <button class="btn btn-success" type="submit">Modify</button>
          <button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
          </div>
        </form>
    </div>
  </div>
 </div>