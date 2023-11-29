<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
<div style="text-align: right;">
<button class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
<button class="btn btn-primary btn-sm" onclick="location.href='window.location.refresh();"><span class="material-symbols-outlined">refresh</span>Refresh</button>
&nbsp;&nbsp; 
</div>
<br> 
<table class="table" style="background-color: lightyellow;">
<tr>
 <td style="font-weight: bold; font-size: 20px; ">현재 달(yyyy-MM)</td>
 <td style="font-weight: bold; font-size: 20px;  ">${sessionScope.yearmonth_sport}</td> 
</tr> 
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 평균 소모 칼로리(Kcal):</td>
 <td style="font-weight: bold; font-size: 20px; ">${sessionScope.avgcalories}Kcal</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 평균 이동 거리(걸음수):</td>
 <td style="font-weight: bold; font-size: 20px; ">${sessionScope.avgdistance}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 최소 소모 칼로리 및 날짜</td>
 <td style="font-weight: bold; font-size: 20px; ">${sessionScope.mincalories}Kcal/${sessionScope.mintitle_calories}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 최대 소모 칼로리 및 날짜</td>
 <td style="font-weight: bold; font-size: 20px;">${sessionScope.maxcalories}Kcal/${sessionScope.maxtitle_calories}</td>
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 최소 이동 거리(걸음수) 및 날짜 </td>
 <td style="font-weight: bold; font-size: 20px;">${sessionScope.mindistance}/${sessionScope.mintitle_distance}</td> 
</tr>
<tr>
 <td style="font-weight: bold; font-size: 20px; ">달별 최대 이동 거리(걸음수) 및 날짜 </td>
 <td style="font-weight: bold; font-size: 20px;">${sessionScope.maxdistance}/${sessionScope.maxtitle_distance}</td> 
</tr>
</table>
<br> 
</c:when>
<c:otherwise> 
  <script>
    alert("Administrator Only.");
    history.go(-1); 
  </script>
</c:otherwise>
</c:choose> 