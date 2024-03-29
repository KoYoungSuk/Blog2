<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}"> 
<form action="modifyproduct" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
 <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='productlist'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to ProductList</button>
 &nbsp;&nbsp; 
</div>
<br>
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="product_no" style="font-weight: bold; font-size: 20px;">물품번호: </label></td>
  <td>
    ${sessionScope.productdetaillist['product_no']}
    <input type="hidden" name="product_no" value="${sessionScope.productdetaillist['product_no']}" readonly required />
  </td>
 </tr>
 <tr>
  <td><label for="product_name" style="font-weight: bold; font-size: 20px;">물품명: </label></td>
  <td><input type="text" class="form-control" name="product_name" value="${sessionScope.productdetaillist['product_name']}" required /></td>
 </tr>
 <tr>
  <td><label for="buy_date" style="font-weight: bold; font-size: 20px;">구입날짜(신품): </label></td>
  <td><input type="text" class="form-control" name="buy_date" value="${sessionScope.productdetaillist['buy_date']}" /></td>
 </tr>
 <tr>
  <td><label for="buy_date_used" style="font-weight: bold; font-size: 20px;">구입날짜(중고): </label></td>
  <td><input type="text" class="form-control" name="buy_date_used" value="${sessionScope.productdetaillist['buy_date_used']}" /></td>
 </tr>
 <tr>
  <td><label for="purpose" style="font-weight: bold; font-size: 20px;">용도: </label></td>
  <td><input type="text" class="form-control" name="purpose" value="${sessionScope.productdetaillist['purpose']}" /></td>
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