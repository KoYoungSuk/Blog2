<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- 
<div class="container-fluid">
<div class="row">
   <div class="col-md-4" style="padding: 0px; margin: 40px; border: ridge; background-color: #DCDCDC; text-align: center;">
      <h3 class="htitle">Welcome to PersonalMemo! </h3>
      <br>
      
      <br>
   </div>
</div>
</div>
-->

  <div class="col-md-8" style="padding: 0px; margin: 40px; border: ridge; background-color: #DCDCDC;">
  <h3 class="htitle"> Welcome to PersonalMemo! 
      <button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=4'"><span class="material-symbols-outlined">info</span>Reason of Making This Page</button>
      <button class="btn btn-secondary btn-sm" onclick="location.href='history.html'"><span class="material-symbols-outlined">history</span>History</button> 
  </h3>
      <table class="table" style="background-color: lightyellow;">
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
            <td>
              <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='deleteboard.do?serial=${boardDO.serialnumber}'"><span class="material-symbols-outlined">delete</span></button>
            </td>
          </tr>
       </c:forEach>
      </tbody>
  </table>
  </div>