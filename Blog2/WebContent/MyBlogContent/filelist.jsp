<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
   <c:when test="${param.pagecount eq null}">
      <c:set var="pagenumber" value="1" /> 
   </c:when>
   <c:otherwise>
      <c:set var="pagenumber" value="${param.pagecount}" />
   </c:otherwise>
</c:choose> 
    <div class="col-lg-8" style="margin: 40px; padding: 0px; background-color: #DCDCDC; ">
      <h3 class="htitle" style="border: ridge;">
      File List
      </h3>
       <div style="text-align: right;">
        <button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
        <c:choose> 
        <c:when test="${sessionScope.id eq 'admin'}">
        <button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=25'"><span class="material-symbols-outlined">create</span>Write</button>
        </c:when>
        <c:otherwise></c:otherwise> 
        </c:choose>
        <button class="btn btn-secondary btn-sm" onclick="location.href='filelist.do'"><span class="material-symbols-outlined">refresh</span>Refresh</button>
        <c:choose> 
        <c:when test="${param.expand ne 'yes'}">
           <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do?expand=yes'"><span class="material-symbols-outlined">expand_all</span>Expand All</button>
        </c:when>
        <c:otherwise>
           <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do'"><span class="material-symbols-outlined">collapse_all</span>Fold Again</button>
        </c:otherwise> 
        </c:choose>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
      <div style="text-align: center">
      <form action="search_files.do" method="POST">
        <table style="margin: auto;">
          <tr>
           <td><input type="text" class="form-control" name="word" placeholder="Search Filename" /></td>
           <td>
             <button type="submit" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">search</span>Search</button>
           </td> 
          </tr> 
        </table>
      </form>
      </div>
      <hr> 
       <div style="text-align: center;">
          <H4 style="font-weight: bold;">  &nbsp;&nbsp; Total Files : ${sessionScope.count_files} </H4>
          <hr> 
          <H4 style="font-weight: bold;">
            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do?pagecount=1'"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></button>
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do?pagecount=${pagenumber - 1}'"><span class="material-symbols-outlined">chevron_left</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;
           PAGE ${pagenumber} / ${sessionScope.pagenum_files}
          &nbsp;&nbsp; 
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.pagenum_files}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do?pagecount=${pagenumber + 1}'"><span class="material-symbols-outlined">chevron_right</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='filelist.do?pagecount=${sessionScope.pagenum_files}'"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></button>
          </H4> 
          <hr> 
          
        </div> 
        <table class="table" style="background-color: lightyellow; ">
          <thead>
              <tr>
                  <th>NUMBER</th>
                  <th>TITLE</th>
                  <th>SAVEDATE</th>
                  <th>MODIFYDATE</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="downloadDO" items="${sessionScope.totaldownloadlist}" begin="${sessionScope.beginnumber_files}" end="${sessionScope.endnumber_files}">       
                  <tr>
                  <td><c:out value="${downloadDO.num}" /></td>
                  <td><a href="detailfiles.do?num=${downloadDO.num}"><c:out value="${downloadDO.title}" /></a></td>
                  <td><c:out value="${downloadDO.savedate}" /></td>
                  <td><c:out value="${downloadDO.modifydate}" /></td>
                  <td>
                  <c:choose> 
                  <c:when test="${sessionScope.id eq 'admin'}">
                  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='deletefile.do?num=${downloadDO.num}'"><span class="material-symbols-outlined">delete</span></button>
                  </c:when>
                  <c:otherwise></c:otherwise> 
                  </c:choose>
                  </td>
                  </tr>
               </c:forEach>
           </tbody>
        </table>
        <hr> 
        <div style="text-align: center;">
          <c:forEach var="num"  begin="1" end="${sessionScope.pagenum_files}"> 
          <c:choose> 
          <c:when test= "${num == pagenumber}"> <!-- 현재 페이지 번호와 같은 페이지 버튼은 빨갛게 표시  -->
          <button type="button" class="btn btn-danger" onclick="location.href='filelist.do?pagecount=${num}'">${num}</button>
          </c:when>
          <c:otherwise>
          <button type="button" class="btn btn-secondary" onclick="location.href='filelist.do?pagecount=${num}'">${num}</button>
          </c:otherwise>
          </c:choose>
          </c:forEach> 
        </div>
        <br> 
 </div>