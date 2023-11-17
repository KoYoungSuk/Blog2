<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-8" style="margin: 70px; padding: 0px; background-color: #DCDCDC; " >
      <c:choose>
        <c:when test="${sessionScope.id eq 'admin'}">
           <h3 class="htitle" style="border: ridge;">Delete Memo</h3>
           <form action="deleteboard.do" method="POST">
           <h5>CAUTION: YOU CAN'T CANCEL THIS JOB. </h5>
           <h5>Do you want to delete it?</h5>
           <div style="text-align: right;"> 
            <button type="submit" class="btn btn-danger btn-sm" ><span class="material-symbols-outlined">delete</span>YES, DELETE!</button>
            <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>NO, BACK!</button>
            &nbsp;&nbsp; 
           </div>
           <br> 
           <table class="table" style="background-color: lightyellow;">
           <tr>
            <td><Label for="id" style="font-weight: bold; font-size: 20px;">작성자 ID:</Label></td>
            <td>${sessionScope.totalboardlist['userid']}</td>
           </tr>
           <tr>
            <td><Label for="number" style="font-weight: bold; font-size: 20px;">글 번호:</Label></td>
            <td>
            ${sessionScope.totalboardlist['number']}
            <input type="hidden" name="number" value="${sessionScope.totalboardlist['number']}" /> 
            </td>
           </tr>
           <tr>
            <td><Label for="title" style="font-weight: bold; font-size: 20px;">제목:</Label></td>
            <td>${sessionScope.totalboardlist['title']}</td>
           </tr>
           <tr>
            <td><Label for="content" style="font-weight: bold; font-size: 20px;">내용:</Label></td>
            <td>${sessionScope.totalboardlist['content']}</td>
           </tr>
           <tr>
            <td><Label for="savedate" style="font-weight: bold; font-size: 20px;">작성 시간:</Label></td>
            <td>${sessionScope.totalboardlist['savedate']}</td>
           </tr>
           <tr>
            <td><Label for="modifydate" style="font-weight: bold; font-size: 20px;">수정 시간:</Label></td>
            <td>${sessionScope.totalboardlist['modifydate']}</td>
           </tr>
           <tr>
            <td><Label for="access" style="font-weight: bold; font-size: 20px;">접근 모드:</Label></td>
            <td>${sessionScope.totalboardlist['anonymous']}</td>
           </tr>
            <tr>
             <td><Label for="clicks" style="font-weight: bold; font-size: 20px;">조회수:</Label></td>
             <td>${sessionScope.totalboardlist['clicks']}</td>
           </tr>
          </table>
          </form>
          <br> 
       </c:when>
       <c:otherwise>
         <script>
           alert("Administrator Only.");
           history.go(-1); 
         </script>
       </c:otherwise>
       </c:choose> 
 </div>