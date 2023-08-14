<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<p>&nbsp;&nbsp;Current Product Number: ${sessionScope.productnumber} </p>
<hr>
<form action="detailproduct" method="POST">
<div style="text-align: center;">
<input type="text" class="form-control-sm" name="product_no" placeholder="Search Product By Number" /> 
&nbsp;&nbsp;
<button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Search</button> 
&nbsp;&nbsp; 
<button type="button" onclick="location.href='product.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
&nbsp;&nbsp; 
<button type="button" class="btn btn-secondary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
&nbsp;&nbsp; 
<c:choose>
 <c:when test="${param.desc == 0}">
  <button type="button" class="btn btn-warning btn-sm" onclick="location.href='productlist?desc=1&columnname=product_no'"><span class="material-symbols-outlined">trending_down</span>Descend By Number</button>
  &nbsp;&nbsp; 
  <button type="button" class="btn btn-warning btn-sm" onclick="location.href='productlist?desc=1&columnname=buy_date'"><span class="material-symbols-outlined">trending_down</span>Descend By Buydate</button>
  &nbsp;&nbsp; 
  <button type="button" class="btn btn-warning btn-sm" onclick="location.href='productlist?desc=1&columnname=buy_date_used'"><span class="material-symbols-outlined">trending_down</span>Descend By Buydate(Used)</button>
 </c:when>
 <c:otherwise>
  <button type="button" class="btn btn-primary btn-sm" onclick="location.href='productlist?desc=0&columnname=product_no'"><span class="material-symbols-outlined">trending_up</span>Ascend By Number</button>
  &nbsp;&nbsp; 
  <button type="button" class="btn btn-primary btn-sm" onclick="location.href='productlist?desc=0&columnname=buy_date'"><span class="material-symbols-outlined">trending_up</span>Ascend By Buydate</button>
  &nbsp;&nbsp; 
  <button type="button" class="btn btn-primary btn-sm" onclick="location.href='productlist?desc=0&columnname=buy_date_used'"><span class="material-symbols-outlined">trending_up</span>Ascend By Buydate(Used)</button>
 </c:otherwise>
</c:choose>
</div>
</form>
<hr>
<table class="table" style="background-color: lightyellow;">
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
   <td>
    <button class="btn btn-secondary btn-sm" onclick="location.href='deleteproduct?product_no=${ProductDO.product_no}'" type="button"><span class="material-symbols-outlined">delete</span></button>
   </td>
   </tr>
  </c:forEach>
  </tbody>
</table>
