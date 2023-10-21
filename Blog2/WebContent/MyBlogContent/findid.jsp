<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-6" style="background-color: #DCDCDC; margin: 70px; padding: 0px;">
<H3 class="htitle" style="border: ridge;"> Find ID </H3>
<hr> 
<c:choose>
<c:when test="${sessionScope.id eq null }"> 
<form action="findid.do" method="POST">
  <table class="table">
    <tr>
     <td><label for="MailAddress">Your MailAddress:</label></td>
     <td><input type="text" class="form-control" name="mailaddress" /></td> 
    </tr> 
  </table>
  <div style="text-align: center;">
    <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">search</span>Find ID</button> 
  </div> 
  <br>
  <p></p> 
</form>
</c:when>
<c:otherwise>
  <!--  아이디 및 비밀번호 찾기 기능은 로그인되지 않았을때만 사용가능.  -->
  <p>Actually Loginned.</p> 
</c:otherwise> 
</c:choose>
</div> 