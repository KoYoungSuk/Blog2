<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<c:choose>
   <c:when test="${param.page_count_diary eq null}">
      <c:set var="pagenumber" value="1" /> 
   </c:when>
   <c:otherwise>
      <c:set var="pagenumber" value="${param.page_count_diary}" />
   </c:otherwise>
</c:choose> 
       <div style="text-align: center;">
       <form action="detaildiary" method="POST">
       <input type="text" class="form-control-sm" name="title" placeholder="Search Diary:" />&nbsp;&nbsp;
       <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">search</span>Search</button>&nbsp;&nbsp;
       <button type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>&nbsp;&nbsp; 
       <button type="button" class="btn btn-primary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
       </form>
       </div>
       <hr>
       <div style="text-align: center;">
          <H4 style="font-weight: bold;">&nbsp;&nbsp; Number of Total Diary:  ${sessionScope.diarynumber} </H4>
          <hr> 
          <H4 style="font-weight: bold;">
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=${pagenumber - 1}'"><span class="material-symbols-outlined">arrow_back</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;&nbsp;&nbsp;
          CURRENT PAGE : PAGE ${pagenumber} 
          &nbsp;&nbsp;&nbsp;&nbsp;
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.page_num_diary}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=${pagenumber + 1}'"><span class="material-symbols-outlined">arrow_forward</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
          </H4>
       </div>
       <hr> 
        <table class="table" style="background-color: lightyellow;">
            <thead>
                <tr>
                 <th>TITLE</th>
                 <th>SAVE DATE</th>
                 <th>MODIFY DATE</th>
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
        <hr> 
        <div style="text-align: center;">
          <c:forEach var="num" begin="1" end="${sessionScope.page_num_diary}">
           <c:choose> 
            <c:when test="${num == pagenumber}">
            <button type="button" class="btn btn-danger" onclick="location.href='diarylist?page_count_diary=${num}'">${num}</button>
            </c:when>
            <c:otherwise> 
            <button type="button" class="btn btn-secondary" onclick="location.href='diarylist?page_count_diary=${num}'">${num}</button>
            </c:otherwise>
           </c:choose>
          </c:forEach>
        </div> 
    <hr>
  </c:when>
  <c:otherwise>
   <script>
     alert("Administrator Only.");
     history.go(-1); 
   </script>
  </c:otherwise>
  </c:choose>