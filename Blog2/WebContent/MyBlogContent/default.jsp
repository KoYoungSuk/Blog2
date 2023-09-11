<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <div class="col-lg-8" style="padding: 0px; margin: 40px; background-color: #DCDCDC;">
  <h3 class="htitle" style="border: ridge;"> Welcome to PersonalMemo! </h3>
      <div style="text-align: center;"> 
      <button class="btn btn-secondary btn-sm" onclick="location.href='./pdfviewer/'"><span class="material-symbols-outlined">info</span>Reason and History</button>
      <c:choose>
      <c:when test="${sessionScope.id eq 'admin'}">
      <button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=12'"><span class="material-symbols-outlined">create</span>Write</button> 
      </c:when>
      <c:otherwise></c:otherwise>
      </c:choose>
      </div>
      <hr> 
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