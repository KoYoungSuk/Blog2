<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	   <p> Current User: ${sessionScope.id} </p>
	   <p> Diary Number: ${sessionScope.diarynumber} </p>
       <hr>
       <form action="detaildiary" method="POST">
       SEARCH DIARY: <input type="text" name="title" />&nbsp;&nbsp;
       <input type="submit" class="btn btn-success" value="Search" />&nbsp;&nbsp;
       <c:choose>
       <c:when test="${param.desc == 0}">
       <input type="button" class="btn btn-success" value="Descend" onclick="location.href='diarylist?desc=1'" />
       </c:when>
       <c:otherwise>
       <input type="button" class="btn btn-success" value="Ascend" onclick="location.href='diarylist?desc=0'" />
       </c:otherwise>
       </c:choose>
       </form>
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
    <hr>