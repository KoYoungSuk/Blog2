<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<c:choose>
   <c:when test="${param.page_num eq null}">
      <c:set var="pagenumber" value="1" /> 
   </c:when>
   <c:otherwise>
      <c:set var="pagenumber" value="${param.page_num}" />
   </c:otherwise>
</c:choose> 
<form action="searchproduct" method="POST">
<div style="text-align: center;">
<table style="margin: auto;">
  <tr>
    <td><input type="text" class="form-control" style="width: 260px; "name="buy_date" placeholder="Search Product By Buy Year(or Used)" /> </td>
    <td>     
      <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Search</button> 
      <button type="button" onclick="location.href='product.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
      <button type="button" class="btn btn-primary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
      <c:choose> 
      <c:when test="${param.expand ne 'yes'}">
         <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?expand=yes'"><span class="material-symbols-outlined">expand_all</span>Expand All</button>
      </c:when>
      <c:otherwise>
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist'"><span class="material-symbols-outlined">collapse_all</span>Fold Again</button>
      </c:otherwise> 
      </c:choose>
    </td>
  </tr> 
</table> 
</div>
</form>
<hr>
<div style="text-align: center;">
    <H4 style="font-weight: bold;">
       Total Products: ${sessionScope.productnumber}
       &nbsp;&nbsp;&nbsp;&nbsp;
       ( ${pagenumber} / ${pagecount_product} PAGE ) 
       &nbsp;&nbsp;&nbsp;&nbsp;
    </H4>
</div>
<br> 
<div style="text-align: center;">    
   <!-- 첫번째 페이지로 바로 가는 버튼 -->
   <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=1'"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></button>
    <c:choose>
       <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=${pagenumber - 1}'"><span class="material-symbols-outlined">chevron_left</span></button>
       </c:when>
       <c:otherwise></c:otherwise>
     </c:choose>     
     <c:forEach var="num" begin="1" end="${sessionScope.pagecount_product}">
        <c:choose>
        <c:when test="${num == pagenumber}">
        <button type="button" class="btn btn-danger" onclick="location.href='productlist?page_num=${num}'">${num}</button>
        </c:when>
        <c:otherwise>
        <button type="button" class="btn btn-secondary" onclick="location.href='productlist?page_num=${num}'">${num}</button>
        </c:otherwise>
        </c:choose>
     </c:forEach>
     <c:choose> 
       <c:when test="${pagenumber ne sessionScope.pagecount_product}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=${pagenumber + 1}'"><span class="material-symbols-outlined">chevron_right</span></button>
       </c:when>
       <c:otherwise></c:otherwise> 
    </c:choose>
    <!-- 마지막 페이지로 바로 가는 버튼 -->
    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='productlist?page_num=${pagecount_product}'"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></button>
</div> 
<br> 
<table class="table" style="background-color: lightyellow;">
  <thead>
   <tr>
   <th>물품번호</th>
   <th>물품명</th>
   <th>구입날짜(신품)</th>
   <th>구입날짜(중고품)</th>
   <th>용도</th>
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
</c:when>
<c:otherwise>
 <script>
   alert("Administrator Only.");
   history.go(-1); 
 </script>
</c:otherwise>
</c:choose>

