<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
   <form action="writediary" method="POST">
    <div style="text-align: right;">
    <button class="btn btn-secondary btn-sm" onclick="history.go(-1);" type="button"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
    <button class="btn btn-secondary btn-sm" type="button" onclick="openTextFile();"><span class="material-symbols-outlined">file_open</span>Open Text Document</button>
    <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>&nbsp;&nbsp; 
	</div>
	<hr>
	<table class="table" style="background-color: lightyellow; ">
	<tr>
	  <td><label for="title">제목:</label></td>
	  <td><input class="form-control mr-sm-10" type="text" id="title" name="title" required  /></td>
	</tr>
	<tr>
	  <td><label for="context">내용:</label></td>
	  <td><textarea class="form-control mr-sm-10" rows="20" cols="100" name="context" id="txtcontext" autofocus wrap="hard"></textarea></td>
	</tr>
	</table>
   </form>
   <hr>
   <br> 