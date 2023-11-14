<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<form action="writeproduct" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
 <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='productlist'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to ProductList</button>&nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="product_no" style="font-weight: bold; font-size: 20px;">물품 번호: </label></td>
  <td><input class="form-control" type="text" name="product_no" required /></td>
 </tr>
 <tr>
  <td><label for="product_name" style="font-weight: bold; font-size: 20px;">물품 이름: </label></td>
  <td><input class="form-control" type="text" name="product_name" required /></td>
 </tr>
 <tr>
  <td><label for="buy_date" style="font-weight: bold; font-size: 20px;">구매 날짜(신품): </label></td>
  <td><input class="form-control" type="text" name="buy_date" /></td>
 </tr>
 <tr>
  <td><label for="buy_date_used" style="font-weight: bold; font-size: 20px;">구매 날짜(중고): </label></td>
  <td><input class="form-control" type="text" name="buy_date_used" /></td>
 </tr>
 <tr>
  <td><label for="purpose" style="font-weight: bold; font-size: 20px;">용도: </label></td>
  <td><input class="form-control" type="text" name="purpose" /></td>
 </tr>
</table>
</form>
<br> 
</c:when>
<c:otherwise>
 <script>
   alert("Administrator Only.");
   history.go(-1); 
 </script>
</c:otherwise>
</c:choose>