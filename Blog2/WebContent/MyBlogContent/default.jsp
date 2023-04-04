<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container-fluid" style="margin-top:60px">
<div class="row">
   <div class="col-md-12" id="smalldiv" style="margin: 0px; padding: 0px;">
     <h2 class="htitle" >Welcome to PersonalMemo! </h2>
      <h5><a href="main.do?page=4">Reason of Making This Page</a></h5>
      <h5><a href="history.html">History</a></h5>
   </div>
</div>
</div>
<hr>
<div class="container-fluid" style="margin-top: 20px; padding: 0px;">
 <div class="row" >
  <div class="col-md-12" style="margin: 0px; background-color: lightyellow;">
  <h2 style="text-align: center" class="htitle">Latest Memo (10) </h2>
      <table class="table">
      <thead>
      <tr>
       <th>Number</th>
       <th>Title</th>
       <th>Save Date</th>
       <th>Modify Date</th>
       <th>Access</th>
       <th>Clicks</th>
      <th>Delete</th>
      </tr>
      </thead>
      <tbody>
       <c:forEach var="boardDO" items="${sessionScope.newboardlist}">
          <tr>
           <td><c:out value="${boardDO.serialnumber}" /></td>
            <td><a href="detailboard.do?serial=${boardDO.serialnumber}"><c:out value="${boardDO.title}" /></a></td>
            <td><c:out value="${boardDO.savedate}" /></td>
            <td><c:out value="${boardDO.modifydate}" /></td>
            <td><c:out value="${boardDO.anonymous}" /></td>
            <td><c:out value="${boardDO.clicks}" /></td>
            <td><a href="deleteboard.do?serial=${boardDO.serialnumber}">Delete</a></td>
          </tr>
       </c:forEach>
      </tbody>
  </table>
  </div>
 </div>
</div>