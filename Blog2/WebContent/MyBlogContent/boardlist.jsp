<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px"> 
   <div class="row">
    <div class="col-sm-12">
      <h3>Bulletin Board</h3>
      <hr>
       <c:choose>
        <c:when test="${id ne null}">
          <p> Current User: ${sessionScope.id} </p>
          <c:choose>
           <c:when test="${id eq 'admin'}">
           <p> Administrator Mode </p>
           </c:when>
           <c:otherwise>
           <p> Member Mode </p>
           </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise>
          <p> NonMember Mode </p>
        </c:otherwise>
       </c:choose>
       <p> 게시물 개수 : ${sessionScope.count_board} </p>
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
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="boardDO" items="${sessionScope.boardlist}" varStatus="status">       
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
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
       <button class="btn btn-success" onclick="location.href='boardlist.do'">Update Board Session</button>
       <button class="btn btn-success" onclick="location.href='main.do?page=12'">Go To Write</button>
 </div>
</div>
</div>