<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top: 20px">
   <div class="row">
     <div class="col-sm-12" style="margin: 0px">
     <h2 class="htitle">게시글 내용</h2>
     <hr>
         <table class="table" style="border:1px solid">
           <tr>
            <td>작성자 ID:</td>
            <td>${sessionScope.detailboardlist["userid"]}</td>
           </tr>
           <tr>
            <td>글 번호:</td>
            <td>${sessionScope.detailboardlist["number"]}</td>
           </tr>
           <tr>
            <td>제목:</td>
            <td>${sessionScope.detailboardlist["title"]}</td>
           </tr>
           <tr>
            <td>내용:</td>
            <td>${sessionScope.detailboardlist["content"]}</td>
           </tr>
           <tr>
            <td>작성 시간:</td>
            <td>${sessionScope.detailboardlist["savedate"]}</td>
           </tr>
           <tr>
            <td>수정 시간:</td>
            <td>${sessionScope.detailboardlist["modifydate"]}</td>
           </tr>
           <tr>
             <td>접근 모드:</td>
             <td>${sessionScope.detailboardlist["anonymous"]}</td>
           </tr>
           <tr>
             <td>조회수:</td>
             <td>${sessionScope.detailboardlist["clicks"]}</td>
           </tr>
       </table>
      <hr>
     <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
     <button class="btn btn-success" onclick="location.href='modifyboard.do?serial=${sessionScope.detailboardlist['number']}'">Modify</button>
     <button class="btn btn-danger" onclick="location.href='deleteboard.do?serial=${sessionScope.detailboardlist['number']}'">Delete</button>
     </div>
    </div>
</div>