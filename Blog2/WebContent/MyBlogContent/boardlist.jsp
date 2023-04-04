<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px"> 
   <div class="row">
    <div class="col-sm-12" style="margin: 0px; padding: 0px; background-color: lightyellow; ">
      <h3 class="htitle">
      Memo List
      <c:choose>
        <c:when test="${id ne null}">
          (Current User: ${sessionScope.id}) 
          <c:choose>
           <c:when test="${id eq 'admin'}">
           (Administrator Mode)
           </c:when>
           <c:otherwise>
           (Member Mode)
           </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise>
          (NonMember Mode)
        </c:otherwise>
       </c:choose>
      </h3>
       <hr> 
       <div style="text-align: center">
       <p> Memo List Count : ${sessionScope.count_board} </p>
       <hr>
       <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
       <button class="btn btn-success" onclick="location.href='boardlist.do'">Refresh</button>
       <c:choose>
        <c:when test="${param.desc == 1}">
           <button class="btn btn-primary" onclick="location.href='boardlist.do?desc=0'">Ascend</button>
        </c:when>
        <c:otherwise>
           <button class="btn btn-danger" onclick="location.href='boardlist.do?desc=1'">Descend</button> 
        </c:otherwise>
       </c:choose>
       <button class="btn btn-success" onclick="location.href='main.do?page=12'">Write</button>
       </div>
       <hr>
        <table class="table">
          <thead>
              <tr>
                  <th>Number</th>
                  <th>Title</th>
                  <th>Save Date</th>
                  <th>Modify Date</th>
                  <th>Access Mode</th>
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
     
 </div>
</div>
</div>