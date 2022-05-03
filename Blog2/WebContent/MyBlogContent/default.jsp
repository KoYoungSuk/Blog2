<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px">
<div class="row">
   <div class="col-md-6">
     <h2>Welcome to MyBlog! </h2>
     <hr>
     <h5> This Web Site is designed for Personal Blog Site. </h5>
     <h5> This Web Site is being developed yet. </h5>
   </div>
   <div class="col-md-6">
     <h2>Why I make this?</h2>
     <hr>
     <h5>Under Construction</h5>
  </div>
</div>
<hr>
 <div class="row">
  <div class="col-md-12">
  <h2>Bullet Board</h2>
  <hr>
      <table>
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
            <td><a href="detailboard.do?number=${boardDO.serialnumber}&access=${sessionScope.access}&clicks=${boardDO.clicks}"><c:out value="${boardDO.title}" /></a></td>
            <td><c:out value="${boardDO.savedate}" /></td>
            <td><c:out value="${boardDO.modifydate}" /></td>
            <td><c:out value="${boardDO.anonymous}" /></td>
            <td><c:out value="${boardDO.clicks}" /></td>
            <td><a href="deleteboard.do?number=${boardDO.serialnumber}">Delete</a></td>
          </tr>
       </c:forEach>
      </tbody>
  </table>
  </div>
 </div>
</div>