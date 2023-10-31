<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	   <p>&nbsp;&nbsp;Diary Number: ${sessionScope.diarynumber} </p>
       <hr>
       <div style="text-align: center;">
       <form action="detaildiary" method="POST">
       <input type="text" class="form-control-sm" name="title" placeholder="Search Diary:" />&nbsp;&nbsp;
       <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">search</span>Search</button>&nbsp;&nbsp;
       <button type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>&nbsp;&nbsp; 
       <button type="button" class="btn btn-primary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
       </form>
       </div>
       <hr>
        <table class="table" style="background-color: lightyellow;">
            <thead>
                <tr>
                 <th>TITLE</th>
                 <th>SAVE DATE</th>
                 <th>MODIFY DATE</th>
                 <th>DELETE</th>
               </tr>
               </thead>
            <tbody>
               <c:forEach var="DiaryDO" items="${sessionScope.diarylist}" begin="${sessionScope.beginnumber_diary}" end="${sessionScope.endnumber_diary}" >
               <tr>
                   <td><a href="detaildiary?title=${DiaryDO.title}"><c:out value="${DiaryDO.title}" /></a></td>
                   <td><c:out value="${DiaryDO.savedate}" /></td>
                   <td><c:out value="${DiaryDO.modifydate}" /></td>
                   <td>
                   <button class="btn btn-secondary btn-sm" onclick="location.href='deletediary?title=${DiaryDO.title}'" type="button"><span class="material-symbols-outlined">delete</span></button>
                   </td>
               </tr>
              </c:forEach>
           </tbody>
        </table>
        <div style="text-align: center;">
          <h4 style="weight: bold;">PAGE NUMBER </h4>
          <hr> 
          <c:forEach var="num" begin="1" end="${sessionScope.page_num_diary}">
            <button type="button" class="btn btn-secondary" onclick="location.href='diarylist?desc=0&page_count_diary=${num}'">${num}</button>
          </c:forEach>
        </div> 
    <hr>