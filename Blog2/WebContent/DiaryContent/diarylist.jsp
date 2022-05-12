<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	<input type="button" type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-primary" value="Write" />
	<input type="button" type="button" onclick="history.go(-1);" class="btn btn-primary" value="Back" />
	<input type="button" type="button" onclick="location.href='../main.do'" class="btn btn-primary" value="Back To Main Page" />
	<input type="button" type="button" onclick="location.href='../signout.do'" class="btn btn-primary" value="Logout" />
	<hr>
	<c:choose>
	  <c:when test="${sessionScope.id eq 'admin'}">
	   <p> Current User: ${sessionScope.id} </p>
       <hr>
        <table border="1">
            <thead>
                <tr>
                 <th>Number</th>
                 <th>Title</th>
                 <th>Save Date</th>
                 <th>Modify Date</th>
                 <th>Delete</th>
               </tr>
               </thead>
            <tbody>
               <c:forEach var="DiaryDO" items="${sessionScope.diarylist}" varStatus="status">
               <tr>
                   <td><c:out value="${status.index}" /></td>
                   <td><a href="detaildiary?title=${DiaryDO.title}"><c:out value="${DiaryDO.title}" /></a></td>
                   <td><c:out value="${DiaryDO.savedate}" /></td>
                   <td><c:out value="${DiaryDO.modifydate}" /></td>
                   <td><a href="deletediary?title=${DiaryDO.title}">Delete</a></td>
               </tr>
              </c:forEach>
           </tbody>
        </table>
	  </c:when>
	  <c:otherwise>
	  <p>Administrator Only.</p>
	  </c:otherwise>
	</c:choose>
    <hr>