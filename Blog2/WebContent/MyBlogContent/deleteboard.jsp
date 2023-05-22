<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-6"  style="margin: 70px; padding: 0px; border: ridge; background-color: #DCDCDC; " >
           <h3 class="htitle">Delete Memo</h3>
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
            <td><Label for="id">작성자 ID:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="id" value="${sessionScope.totalboardlist['userid']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="number">글 번호:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="number" value="${sessionScope.totalboardlist['number']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="title">제목:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="title" value="${sessionScope.totalboardlist['title']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="content">내용:</Label></td>
            <td><textarea class="form-control mr-sm-10" rows="15" cols="68" autofocus name="content" wrap="hard" readonly>${sessionScope.totalboardlist['content']}</textarea></td>
           </tr>
           <tr>
            <td><Label for="savedate">작성 시간:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="savedate" value="${sessionScope.totalboardlist['savedate']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="modifydate">수정 시간:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="modifydate" value="${sessionScope.totalboardlist['modifydate']}" readonly /></td>
           </tr>
           <tr>
            <td><Label for="access">접근 모드:</Label></td>
            <td><input class="form-control mr-sm-10" type="text" name="access" value="${sessionScope.totalboardlist['anonymous']}" readonly /></td>
           </tr>
            <tr>
             <td><Label for="clicks">조회수:</Label></td>
             <td><input class="form-control mr-sm-10" type="text" name="clicks" value="${sessionScope.totalboardlist['clicks']}" readonly /></td>
           </tr>
          </table>
          </form>
          <br> 
 </div>