<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top:20px">
    <div class="row">
        <div class="col-md-12">
           <h2>Delete Bullet Board</h2>
           <hr>
           <c:choose>
           <c:when test="${sessionScope.id eq 'admin'}">
           <form action="deleteboard.do" method="POST">
           <h5>CAUTION: YOU CAN'T CANCEL THIS JOB. </h5>
           <h5>Do you want to delete it?</h5>
           <hr>
           <table border=1>
           <tr>
            <td><Label for="id">작성자 ID:</Label></td>
            <td><input type="text" name="id" value="${sessionScope.totalboardlist['userid']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="number">글 번호:</Label></td>
            <td><input type="text" name="number" value="${sessionScope.totalboardlist['number']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="title">제목:</Label></td>
            <td><input type="text" name="title" value="${sessionScope.totalboardlist['title']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="content">내용:</Label></td>
            <td><textarea rows="15" cols="68" autofocus name="content" wrap="hard" readonly>${sessionScope.totalboardlist['content']}</textarea></td>
           </tr>
           <tr>
            <td><Label for="savedate">작성 시간:</Label></td>
            <td><input type="text" name="savedate" value="${sessionScope.totalboardlist['savedate']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="modifydate">수정 시간:</Label></td>
            <td><input type="text" name="modifydate" value="${sessionScope.totalboardlist['modifydate']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="access">접근 모드:</Label></td>
            <td><input type="text" name="access" value="${sessionScope.totalboardlist['anonymous']}" readonly /></td>
           </tr>
            <tr>
             <td><Label for="clicks">조회수:</Label></td>
             <td><input type="text" name="clicks" value="${sessionScope.totalboardlist['clicks']}" readonly /></td>
           </tr>
          </table>
          <hr>
          <button type="submit" class="btn btn-danger" >YES, DELETE!</button>
          <button type="button" class="btn btn-primary" onclick="history.go(-1);">NO, BACK!</button>
          <button type="button" class="btn btn-primary" onclick="location.href='boardlist.do'">NO, BACK TO BOARD LIST!</button>
          <button type="button" class="btn btn-primary" onclick="location.href='main.do?page=1'">NO, BACK TO MAIN PAGE!</button>
          <hr>
           </form>
           </c:when>
           <c:otherwise>
           <p>Administrator Only</p>
           </c:otherwise>
           </c:choose>
           <hr>
        </div>
    </div>
  </div>