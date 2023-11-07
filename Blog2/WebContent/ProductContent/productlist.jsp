<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
   <c:when test="${param.page_num eq null}">
      <c:set var="pagenumber" value="1" /> 
   </c:when>
   <c:otherwise>
      <c:set var="pagenumber" value="${param.page_num}" />
   </c:otherwise>
</c:choose> 
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
</div>
</form>
<hr>
<div style="text-align: center;">
    <H4 style="font-weight: bold; ">&nbsp;&nbsp;Number of Products: ${sessionScope.productnumber} </H4>
    <hr> 
    <H4 style="font-weight: bold;">
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=${pagenumber - 1}'"><span class="material-symbols-outlined">arrow_back_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;&nbsp;&nbsp;
          CURRENT PAGE :  PAGE ${pagenumber} 
          &nbsp;&nbsp;&nbsp;&nbsp;
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.pagecount_product}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=${pagenumber + 1}'"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
    </H4>
    <hr> 
</div>
<hr> 
<table class="table" style="background-color: lightyellow;">
  <thead>
   <tr>
   <th>PRODUCT NUMBER</th>
   <th>PRODUCT NAME</th>
   <th>BUYDATE</th>
   <th>BUYDATE (USED)</th>
   <th>PURPOSE</th>
   </tr>
  </thead>
  <tbody>
  <c:forEach var="ProductDO" items= "${sessionScope.totalproductlist}" begin="${sessionScope.beginnumber_product}" end="${sessionScope.endnumber_product}">
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
<div style="text-align: center;">
     <c:forEach var="num" begin="1" end="${sessionScope.pagecount_product}">
        <button type="button" class="btn btn-secondary" onclick="location.href='productlist?page_num=${num}'">${num}</button>
     </c:forEach>
</div> 
<br> 
