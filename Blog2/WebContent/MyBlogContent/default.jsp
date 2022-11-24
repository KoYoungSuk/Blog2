<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container-fluid" style="margin-top:60px">
<div class="row">
   <div class="col-md-6" id="smalldiv" style="margin: 0px">
     <h2 class="htitle" >Welcome to MyBlog! </h2>
     <h5> This Web Site is designed for Personal Blog Site. </h5>
     <!-- <h5> <a href="https://kysot.yspersonal.com">Second Server(ASP.NET)</a></h5> -->
     <h5> <a href="https://blog.naver.com/vheh5678">My Naver Blog(Neighbor Only)</a></h5>
   </div>
   
   <div class="col-md-6" id="smalldiv" style="margin: 0px">
     <h2 class="htitle">Why I make this?</h2>
     <h5>Hmm...</h5>
     <h5><a href="main.do?page=4">Maybe here?</a></h5>
     <h5><a href="history.html">History</a></h5>
  </div>
</div>
</div>
<hr>
<div class="container-fluid" style="margin-top: 20px">
 <div class="row" >
  <div class="col-md-12" style="margin: 0px; background-color: lightyellow;">
  <h2 style="text-align: center" class="htitle">Latest Update on Board</h2>
      <table class="table" style="border:1px solid">
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