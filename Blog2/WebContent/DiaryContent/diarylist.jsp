<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	   <p>&nbsp;&nbsp;Diary Number: ${sessionScope.diarynumber} </p>
       <hr>
       <div style="text-align: center;">
       <form action="detaildiary" method="POST">
       <input type="text" class="form-control-sm" name="title" placeholder="Search Diary:" />&nbsp;&nbsp;
       <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">search</span>Search</button>&nbsp;&nbsp;
       <button type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>&nbsp;&nbsp; 
       <c:choose>
       <c:when test="${param.desc == 0}">
       <button type="button" class="btn btn-warning btn-sm" onclick="location.href='diarylist?desc=1'" ><span class="material-symbols-outlined">trending_down</span>Descend</button>&nbsp;&nbsp;
       </c:when>
       <c:otherwise>
       <button type="button" class="btn btn-primary btn-sm"onclick="location.href='diarylist?desc=0'" ><span class="material-symbols-outlined">trending_up</span>Ascend</button>&nbsp;&nbsp;
       </c:otherwise>
       </c:choose>
       <button type="button" class="btn btn-primary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
       </form>
       </div>
       <hr>
        <table class="table" style="background-color: lightyellow;">
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
                   <td>
                   <!-- <a href="deletediary?title=${DiaryDO.title}">Delete</a>-->
                   <button class="btn btn-secondary btn-sm" onclick="location.href='deletediary?title=${DiaryDO.title}'" type="button"><span class="material-symbols-outlined">delete</span></button>
                   </td>
               </tr>
              </c:forEach>
           </tbody>
        </table>
    <hr>