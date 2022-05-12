<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top: 20px">
   <div class="row">
     <div class="col-sm-12">
     <h1>게시글 내용</h1>
     <hr>
      <c:choose>
       <c:when test="${sessionScope.accessbool eq 't'}">
         <table border=1>
           <tr>
            <td>작성자 ID:</td>
            <td>${sessionScope.detailboardlist[1]}</td>
           </tr>
           <tr>
            <td>글 번호:</td>
            <td>${sessionScope.detailboardlist[0]}</td>
           </tr>
           <tr>
            <td>제목:</td>
            <td>${sessionScope.detailboardlist[2]}</td>
           </tr>
           <tr>
            <td>내용:</td>
            <td>${sessionScope.detailboardlist[3]}</td>
           </tr>
           <tr>
            <td>작성 시간:</td>
            <td>${sessionScope.detailboardlist[4]}</td>
           </tr>
           <tr>
            <td>수정 시간:</td>
            <td>${sessionScope.detailboardlist[5]}</td>
           </tr>
           <tr>
             <td>접근 모드:</td>
             <td>${sessionScope.detailboardlist[6]}</td>
           </tr>
           <tr>
             <td>조회수:</td>
             <td>${sessionScope.detailboardlist[7]}</td>
           </tr>
       </table>
       </c:when>
       <c:otherwise>
         <p>illegal access detected </p>
      </c:otherwise>
      </c:choose>
      <hr>
     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     <button class="btn btn-success" onclick="location.href='modifyboard.do?serial=${sessionScope.detailboardlist[0]}'">Modify</button>
     <button class="btn btn-danger" onclick="location.href='deleteboard.do?serial=${sessionScope.detailboardlist[0]}'">Delete</button>
     </div>
    </div>
</div>