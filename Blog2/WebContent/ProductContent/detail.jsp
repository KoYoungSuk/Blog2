<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="productnumber" value= "${sessionScope.productdetaillist['product_no']}" />
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);">Back</button>
<button class="btn btn-secondary btn-sm" onclick="location.href='modifyproduct?product_no=${productnumber}'">Modify</button>
<button class="btn btn-danger btn-sm" onclick="location.href='deleteproduct?product_no=${productnumber}'">Delete</button>&nbsp;&nbsp; 
</div>
<table class="table" style="background-color: lightyellow;">
<tr>
 <td>물품 번호:</td>
 <td>${productnumber}</td>
</tr>
<tr>
 <td>물품 이름:</td>
 <td>${sessionScope.productdetaillist['product_name']}</td>
</tr>
<tr>
 <td>물품 구매 날짜(신품): </td>
 <td>${sessionScope.productdetaillist['buy_date']}</td>
</tr>
<tr>
 <td>물품 구매 날짜(중고): </td>
 <td>${sessionScope.productdetaillist['buy_date_used']}</td>
</tr>
<tr>
 <td>용도: </td>
 <td>${sessionScope.productdetaillist['purpose']}</td>
</tr>
</table>
<br> 