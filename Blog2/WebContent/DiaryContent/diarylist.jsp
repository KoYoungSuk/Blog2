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
       <table style="margin: auto;">
         <tr>
           <td><input type="text" class="form-control" name="title" placeholder="Search Diary" /></td>
           <td>
               <button type="submit" class="btn btn-secondary btn-sm" ><span class="material-symbols-outlined">search</span>Search</button>
               <button type="button" onclick="location.href='diary.jsp?page=3'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button> 
               <button type="button" class="btn btn-primary btn-sm" onclick="window.location.reload();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
               <c:choose> 
               <c:when test="${param.expand ne 'yes'}">
                      <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?expand=yes'"><span class="material-symbols-outlined">expand_all</span>Expand All</button>
               </c:when>
               <c:otherwise>
                       <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist'"><span class="material-symbols-outlined">collapse_all</span>Fold Again</button>
               </c:otherwise> 
               </c:choose>
           </td>
         </tr>
       </table>
       </form>
       </div>
       <hr>
       <div style="text-align: center;">
          <H4 style="font-weight: bold;">&nbsp;&nbsp; Total Diary:  ${sessionScope.diarynumber} </H4>
          <hr> 
          <H4 style="font-weight: bold;">
          <!-- 바로 첫번째 페이지로 가기 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=1'"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></button>
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=${pagenumber - 1}'"><span class="material-symbols-outlined">chevron_left</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;&nbsp;&nbsp;
          PAGE ${pagenumber} / ${sessionScope.page_num_diary}
          &nbsp;&nbsp;&nbsp;&nbsp;
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.page_num_diary}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=${pagenumber + 1}'"><span class="material-symbols-outlined">chevron_right</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
          <!-- 마지막 페이지로 가기 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='diarylist?page_count_diary=${sessionScope.page_num_diary}'"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></button>
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