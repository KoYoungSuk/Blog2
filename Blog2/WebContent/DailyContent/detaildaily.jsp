<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="dailytitle" value="${sessionScope.dailydetaillist['title']}" />
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifydaily?title=${dailytitle}'"><span class="material-symbols-outlined">create</span>Modify</button>
<button class="btn btn-danger btn-sm" onclick="location.href='deletedaily?title=${dailytitle}'"><span class="material-symbols-outlined">delete</span>Delete</button>&nbsp;&nbsp; 
</div>
<table class="table" style="background-color: lightyellow;">
<tr>
 <td>날짜:</td>
 <td>${dailytitle}</td>
</tr>
<tr>
 <td>내용:</td>
 <td>${sessionScope.dailydetaillist['content']}</td>
</tr>
<tr>
 <td>작성 날짜: </td>
 <td>${sessionScope.dailydetaillist['writedate']}</td>
</tr>
<tr>
 <td>수정 날짜: </td>
 <td>${sessionScope.dailydetaillist['modifydate']}</td>
</tr>
<tr>
 <td>달성 여부: </td>
 <td>${sessionScope.dailydetaillist['status']}</td>
</tr>
</table>
<br> 