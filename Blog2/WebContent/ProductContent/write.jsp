<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<h2>Write</h2>
<hr>
<form action="writeproduct" method="POST">
<table class="table table-striped" style="border:1px solid">
 <tr>
  <td><label for="product_no">물품 번호: </label></td>
  <td><input type="text" name="product_no" required /></td>
 </tr>
 <tr>
  <td><label for="product_name">물품 이름: </label></td>
  <td><input type="text" name="product_name" required /></td>
 </tr>
 <tr>
  <td><label for="buy_date">구매 날짜(신품): </label></td>
  <td><input type="text" name="buy_date" /></td>
 </tr>
 <tr>
  <td><label for="buy_date_used">구매 날짜(중고): </label></td>
  <td><input type="text" name="buy_date_used" /></td>
 </tr>
 <tr>
  <td><label for="purpose">용도: </label></td>
  <td><input type="text" name="purpose" /></td>
 </tr>
</table>
<hr>
<button class="btn btn-success" type="submit">Write</button>
<button class="btn btn-primary" type="button" onclick="history.go(-1);">Back</button>
<button class="btn btn-primary" type="button" onclick="location.href='../main.do'">Back to MyBlog</button>
<button class="btn btn-primary" type="button" onclick="location.href='productlist?desc=0&columnname=product_no'">Back to ProductList</button>
</form>