<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <div class="col-lg-6" style="margin: 40px; padding: 0px; background-color: #DCDCDC; ">
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
        <c:choose>
        <c:when test="${param.desc == 1}">
         <button type="button" class="btn btn-primary btn-sm" onclick="location.href='boardlist.do?desc=0'"><span class="material-symbols-outlined">trending_up</span>Ascend</button>
        </c:when>
        <c:otherwise>
         <button type="button" class="btn btn-danger btn-sm" onclick="location.href='boardlist.do?desc=1'"><span class="material-symbols-outlined">trending_down</span>Descend</button> 
        </c:otherwise>
        </c:choose>
      </form>
      </div>
       <div style="text-align: left">
       <p>  &nbsp;&nbsp;&nbsp;&nbsp; Memo List Count : ${sessionScope.count_board} </p>
       </div>
        <table class="table" style="background-color: lightyellow; ">
          <thead>
              <tr>
                  <th>Number</th>
                  <th>Title</th>
                  <th>Save Date</th>
                  <th>Modify Date</th>
                  <th>Access Mode</th>
                  <th>Clicks</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="boardDO" items="${sessionScope.boardlist}" varStatus="status">       
                  <tr>
                  <td><c:out value="${boardDO.serialnumber}" /></td>
                  <td><a href="detailboard.do?serial=${boardDO.serialnumber}"><c:out value="${boardDO.title}" /></a></td>
                  <td><c:out value="${boardDO.savedate}" /></td>
                  <td><c:out value="${boardDO.modifydate}" /></td>
                  <td><c:out value="${boardDO.anonymous}" /></td>
                  <td><c:out value="${boardDO.clicks}" /></td>
                  <td>
                  <!-- <a href="deleteboard.do?serial=${boardDO.serialnumber}">Delete</a>-->
                  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='deleteboard.do?serial=${boardDO.serialnumber}'"><span class="material-symbols-outlined">delete</span></button>
                  </td>
                  </tr>
               </c:forEach>
           </tbody>
        </table>
 </div>