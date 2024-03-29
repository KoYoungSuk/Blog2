<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="boardnumber" value= "${sessionScope.detailboardlist['number']}" /> 
     <div class="col-lg-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
     <h3 class="htitle" style="border: ridge;">Detail Memo</h3>
     <div style="text-align: right;">
       <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
       <c:choose>
       <c:when test="${sessionScope.id eq 'admin'}">
       <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='modifyboard.do?serial=${boardnumber}'"><span class="material-symbols-outlined">create</span>Modify</button>
       <button type="button" class="btn btn-danger btn-sm" onclick="location.href='deleteboard.do?serial=${boardnumber}'"><span class="material-symbols-outlined">delete</span>Delete</button>
       </c:when>
       <c:otherwise></c:otherwise> 
       </c:choose>
       &nbsp;&nbsp; 
     </div>
     <br> 
         <table class="table" style="background-color: lightyellow;">
           <tr>
            <td style="font-weight: bold; font-size: 20px;">글 번호:</td>
            <td>${boardnumber}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">제목:</td>
            <td>${sessionScope.detailboardlist["title"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">내용:</td>
            <td>${sessionScope.detailboardlist["content"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">작성 시간:</td>
            <td>${sessionScope.detailboardlist["savedate"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">수정 시간:</td>
            <td>${sessionScope.detailboardlist["modifydate"]}</td>
           </tr>
           <tr>
             <td style="font-weight: bold; font-size: 20px;">접근 모드:</td>
             <td>${sessionScope.detailboardlist["anonymous"]}</td>
           </tr>
           <tr>
             <td style="font-weight: bold; font-size: 20px;">조회수:</td>
             <td>${sessionScope.detailboardlist["clicks"]}</td>
           </tr>
       </table>
     <br> 
</div>