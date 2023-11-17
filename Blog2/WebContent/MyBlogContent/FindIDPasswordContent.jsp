<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-6" style="background-color: #DCDCDC; margin: 70px; padding: 0px;">
<H3 class="htitle" style="border: ridge;"> Find ID and Password </H3>
<hr> 
<c:choose> 
<c:when test="${sessionScope.id eq null}">
<div style="text-align: center;"> 
<button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=21'"  ><span class="material-symbols-outlined">search</span>Find ID</button>
<br> 
<p></p>
<button class="btn btn-secondary btn-sm" onclick="location.href='main.do?page=22'"><span class="material-symbols-outlined">search</span>Find Password</button>
<br> 
<p></p> 
</div>
</c:when>
<c:otherwise>
<!--  아이디 및 비밀번호 찾기 기능은 로그인되지 않았을 경우에만 사용가능.  -->
<script>
    alert("Loginned user can't use this function.");
    history.go(-1); 
</script>
</c:otherwise> 
</c:choose> 
</div> 