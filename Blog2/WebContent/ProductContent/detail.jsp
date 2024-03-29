<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="productnumber" value= "${sessionScope.productdetaillist['product_no']}" />
<c:choose> 
<c:when test="${sessionScope.id eq 'admin'}">
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifyproduct?product_no=${productnumber}'"><span class="material-symbols-outlined">create</span>Modify</button>
<button class="btn btn-danger btn-sm" onclick="location.href='deleteproduct?product_no=${productnumber}'"><span class="material-symbols-outlined">delete</span>Delete</button>&nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
<tr>
 <td style="font-weight: bold; font-size: 20px;">물품번호:</td>
 <td>${productnumber}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px;">물품명:</td>
 <td>${sessionScope.productdetaillist['product_name']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px;">구입날짜(신품): </td>
 <td>${sessionScope.productdetaillist['buy_date']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px;">구입날짜(중고): </td>
 <td>${sessionScope.productdetaillist['buy_date_used']}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px;">용도: </td>
 <td>${sessionScope.productdetaillist['purpose']}</td>
</tr>
</table>
<br> 
</c:when>
<c:otherwise>
 <script>
  alert("Administrator Only.");
  history.go(-1); 
 </script>
</c:otherwise>
</c:choose>