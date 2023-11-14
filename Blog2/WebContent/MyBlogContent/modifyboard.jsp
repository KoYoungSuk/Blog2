<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <div class="col-lg-8" style="background-color: #DCDCDC; padding: 0px; margin: 70px">
     <h3 class="htitle" style="border: ridge;">Modify Memo</h3>
        <form action="modifyboard.do" method="POST">
          <div style="text-align: right;">
          <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
          <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Modify</button>
           &nbsp;&nbsp;
          </div>
          <br> 
          <table class="table" style="background-color: lightyellow; ">
           <tr>
            <td><label for="Number">Number:</label></td>
            <td><input class="form-control mr-sm-10" type="text" name="number" value="${sessionScope.totalboardlist['number']}" readonly /></td>
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
          <br> 
        </form>
    </div>