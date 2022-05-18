<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top:20px">
         <div class="row">
             <div class="col-sm-12">
                <h1>Write Board</h1> 
                <hr>
                     <form action="board.do" method="POST">
                     <table>
                     <tr>
                     <td><p><label for="title">Title:</label></td><td><input type="text" name="title" style="width:500px;" required /></p></td>
                     </tr>
                     <tr>
                     <td><p><label for="user">User ID:</label></td><td><input type="text" name="id" value='${sessionScope.id}'  style="width:500px;"  readonly  /></p></td>
                     <tr>
                     <td> <p><label for="content">Content:</label></p></td>
                     <td><p><textarea rows="15" cols="68" autofocus name="content" wrap="hard" ></textarea></p></td>
                     </tr>
                     <tr>
                     <td><p><label for="anonymous">Choose Access Mode</label></p></td>
                     <td><input type="radio" name="access" value="admin" checked>Administrator Mode&nbsp;&nbsp;<input type="radio" name="access" value="member">Member Mode
                      &nbsp;&nbsp;<input type="radio" name="access" value="anonymous">NonMember Mode</td>
                     </tr>
                     </table>
                     <hr>
                     <button class="btn btn-success" type="submit">Post Board</button>
                     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
                     </form>
            </div>
        </div> 
    </div>