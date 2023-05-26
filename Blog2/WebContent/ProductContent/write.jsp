<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<form action="writeproduct" method="POST">
<div style="text-align: right">
 <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
 <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Write</button>
 <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='productlist?desc=0&columnname=product_no'"><span class="material-symbols-outlined">arrow_back_ios</span>Back to ProductList</button>&nbsp;&nbsp; 
</div>
<table class="table" style="background-color: lightyellow;">
 <tr>
  <td><label for="product_no">물품 번호: </label></td>
  <td><input class="form-control" type="text" name="product_no" required /></td>
 </tr>
 <tr>
  <td><label for="product_name">물품 이름: </label></td>
  <td><input class="form-control" type="text" name="product_name" required /></td>
 </tr>
 <tr>
  <td><label for="buy_date">구매 날짜(신품): </label></td>
  <td><input class="form-control" type="text" name="buy_date" /></td>
 </tr>
 <tr>
  <td><label for="buy_date_used">구매 날짜(중고): </label></td>
  <td><input class="form-control" type="text" name="buy_date_used" /></td>
 </tr>
 <tr>
  <td><label for="purpose">용도: </label></td>
  <td><input class="form-control" type="text" name="purpose" /></td>
 </tr>
</table>
</form>
<br> 