<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
                  <td><a href="detailboard.do?number=${boardDO.serialnumber}&access=${param.access}&clicks=${boardDO.clicks}"><c:out value="${boardDO.title}" /></a></td>
                  <td><c:out value="${boardDO.savedate}" /></td>
                  <td><c:out value="${boardDO.modifydate}" /></td>
                  <td><c:out value="${boardDO.anonymous}" /></td>
                  <td><c:out value="${boardDO.clicks}" /></td>
                  <td><a href="deleteboard.do?number=${boardDO.serialnumber}">Delete</a></td>
                  </tr>
               </c:forEach>
             </tbody>
 </table>
<hr>