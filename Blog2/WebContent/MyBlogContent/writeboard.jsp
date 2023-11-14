<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
             <div class="col-lg-6" style="background-color: #DCDCDC; padding: 0px; margin: 70px">
                <h3 class="htitle" style="border: ridge; ">Write Board</h3> 
                     <form action="board.do" method="POST" > 
                     <div style="text-align: right;">
                     <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
                     <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
                     &nbsp;&nbsp;
                     </div>
                     <br> 
                     <table class="table" style="background-color: lightyellow;">
                     <tr>
                     <td><p><label for="title">Title:</label></p></td>
                     <td><input class="form-control mr-sm-10" type="text" name="title" required /></td>
                     </tr>
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
                     <br> 
                     </form>
            </div>