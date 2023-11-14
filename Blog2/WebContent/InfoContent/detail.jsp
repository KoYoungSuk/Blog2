<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="infotitle" value="${sessionScope.infodetaillist['title']}" />
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifyinfo?title=${infotitle}'"><span class="material-symbols-outlined">create</span>Modify</button>
<button class="btn btn-danger btn-sm" onclick="location.href='deleteinfo?title=${infotitle}'"><span class="material-symbols-outlined">delete</span>Delete</button>&nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
<tr>
 <td style="font-weight: bold; font-size: 20px; ">제목:</td>
 <td>${sessionScope.infodetaillist['title']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">내용:</td>
 <td>${sessionScope.infodetaillist['content']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">작성 날짜: </td>
 <td>${sessionScope.infodetaillist['savedate']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">수정 날짜: </td>
 <td>${sessionScope.infodetaillist['modifydate']}</td>
</tr>
</table>
<br> 