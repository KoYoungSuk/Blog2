<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<p>Current User: ${sessionScope.id} </p>
<p>Current Product Number: ${sessionScope.productnumber} </p>
<hr>
<form action="detailproduct" method="POST">
<p>
SEARCH PRODUCT(BY NUMBER): <input type="text" name="product_no"> 
&nbsp;&nbsp;
<button class="btn btn-primary" type="submit">SEARCH</button> 
</p>
</form>
<hr>
<c:choose>
 <c:when test="${param.desc == 0}">
  <button class="btn btn-primary" onclick="location.href='productlist?desc=1&columnname=product_no'">Descend By Number</button>
  <button class="btn btn-primary" onclick="location.href='productlist?desc=1&columnname=buy_date'">Descend By Buydate</button>
  <button class="btn btn-primary" onclick="location.href='productlist?desc=1&columnname=buy_date_used'">Descend By Buydate(Used)</button>
 </c:when>
 <c:otherwise>
  <button class="btn btn-primary" onclick="location.href='productlist?desc=0&columnname=product_no'">Ascend By Number</button>
  <button class="btn btn-primary" onclick="location.href='productlist?desc=0&columnname=buy_date'">Ascend By Buydate</button>
  <button class="btn btn-primary" onclick="location.href='productlist?desc=0&columnname=buy_date_used'">Ascend By Buydate(Used)</button>
 </c:otherwise>
</c:choose>
<hr>
<table class="table table-striped" style="border:1px solid">
  <thead>
   <tr>
   <th>PRODUCT_NO</th>
   <th>PRODUCT_NAME</th>
   <th>BUY_DATE</th>
   <th>BUY_DATE_USED</th>
   <th>PURPOSE</th>
   <th>Delete</th>
   </tr>
  </thead>
  <tbody>
  <c:forEach var="ProductDO" items= "${sessionScope.totalproductlist}">
   <tr>
   <td><c:out value="${ProductDO.product_no}" /></td>
   <td><a href="detailproduct?page=2&product_no=${ProductDO.product_no}"><c:out value="${ProductDO.product_name}" /></a></td>
   <td><c:out value="${ProductDO.buy_date}" /></td>
   <td><c:out value="${ProductDO.buy_date_used}" /></td>
   <td><c:out value="${ProductDO.purpose}" /></td>
   <td><a href="deleteproduct?product_no=${ProductDO.product_no}">Delete</a></td>
   </tr>
  </c:forEach>
  </tbody>
</table>
