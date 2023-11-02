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
       <div style="text-align: right;">
        <button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
        <button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=12'"><span class="material-symbols-outlined">create</span>Write</button>
        <button class="btn btn-secondary btn-sm" onclick="location.href='boardlist.do'"><span class="material-symbols-outlined">refresh</span>Refresh</button>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
       </div>
      <div style="text-align: center">
      <form action="search.do" method="POST">
        <input type="text" class="form-control-sm"name="word" placeholder="Search Title" value= "${sessionScope.word}" />
        <button type="submit" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">search</span>Search</button>
      </form>
      </div>
       <div style="text-align: left">
       <p style="font-weight: bold;">  &nbsp;&nbsp;&nbsp;&nbsp; Number of Memoes : ${sessionScope.count_board} </p>
       <p style="font-weight: bold;">  &nbsp;&nbsp;&nbsp;&nbsp; CURRENT PAGE:  PAGE ${pagenumber} </p>
       </div>
        <table class="table" style="background-color: lightyellow; ">
          <thead>
              <tr>
                  <th>NUMBER</th>
                  <th>TITLE</th>
                  <th>SAVEDATE</th>
                  <th>MODIFYDATE</th>
                  <th>ACCESS</th>
                  <th>CLICKS</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="boardDO" items="${sessionScope.boardlist}" begin="${sessionScope.beginnumber}" end="${sessionScope.endnumber}">       
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
        <div style="text-align: center;">
          <h4 style="weight: bold;">
          <c:choose>
          <c:when test="${pagenumber ne 1}"> <!-- 첫번째 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='boardlist.do?pagecount=${pagenumber - 1}'"><span class="material-symbols-outlined">arrow_back_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          &nbsp;&nbsp;&nbsp;&nbsp;
          PAGE ${pagenumber} 
          &nbsp;&nbsp;&nbsp;&nbsp;
          <c:choose> 
          <c:when test="${pagenumber ne sessionScope.pagenum}"> <!-- 마지막 페이지가 아닐때 -->
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='boardlist.do?pagecount=${pagenumber + 1}'"><span class="material-symbols-outlined">arrow_forward_ios</span></button>
          </c:when>
          <c:otherwise></c:otherwise> 
          </c:choose>
          </h4> 
          <hr> 
          <c:forEach var="num"  begin="1" end="${sessionScope.pagenum}"> 
          <button type="button" class="btn btn-secondary" onclick="location.href='boardlist.do?pagecount=${num}'">${num}</button>
          </c:forEach> 
        </div> 
        <br> 
 </div>