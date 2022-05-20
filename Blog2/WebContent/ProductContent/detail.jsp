<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<h2>Detail</h2>
<hr>
<table border="1">
<tr>
 <td>물품 번호:</td>
 <td>${sessionScope.productdetaillist['product_no']}</td>
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
<hr>
<button class="btn btn-success" onclick="location.href='modifyproduct?product_no=${sessionScope.productdetaillist['product_no']}'">Modify</button>
<button class="btn btn-danger" onclick="location.href='deleteproduct?product_no=${sessionScope.productdetaillist['product_no']}'">Delete</button>
<button class="btn btn-primary" onclick="history.go(-1);">Back</button>
<button class="btn btn-primary" onclick="location.href='productlist?desc=0&columnname=product_no'">Back to ProductList</button>
<button class="btn btn-primary" onclick="location.href='../main.do'">Back to MyBlog</button>