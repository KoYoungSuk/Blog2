<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top:20px">
         <div class="row" >
             <div class="col-sm-12" style="background-color: lightyellow; padding: 0px; margin: 0px">
                <h2 class="htitle" style="padding: 0px; margin: 0px;">Write Board</h2> 
                     <form id="write-form" action="board.do" method="POST" > 
                     <table class="table">
                     <tr>
                     <td><p><label for="title">Title:</label></p></td>
                     <td><input class="form-control mr-sm-10" type="text" name="title" required /></td>
                     </tr>
                     <tr>
                     <td><p><label for="user">User ID:</label></td><td><input type="text" class="form-control mr-sm-10" name="id" value='${sessionScope.id}' readonly  /></p></td>
                     <tr>
                     <td><p><label for="content">Content:</label></p></td>
                     <td><p><textarea class="form-control mr-sm-10" rows="20" cols="100" autofocus name="content" wrap="hard" ></textarea></p></td>
                     </tr>
                     <tr>
                     <td><p><label for="anonymous">Choose Access Mode</label></p></td>
                     <td style="text-align: center;">
                     <input type="radio" class="custom-control-input" name="access" id="jb-radio-1" value="admin" checked>
                     <label class="custom-control-label" for="jb-radio-1">Administrator Mode</label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" class="custom-control-input" name="access" id="jb-radio-2" value="member">
                     <label class="custom-control-label" for="jb-radio-2">Member Mode</label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" class="custom-control-input" name="access" id="jb-radio-3" value="anonymous">
                     <label class="custom-control-label" for="jb-radio-3">NonMember Mode</label>
                     </td>
                     <tr>
                     </table>
                     <hr> 
                     <div style="text-align: center">
                     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
                     <button class="btn btn-success" type="submit">Post Board</button>
                     </div>
                     </form>
            </div>
        </div> 
    </div>