<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <div class="col-lg-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
     <h3 class="htitle" style="border: ridge;">Download File</h3>
     <div style="text-align: right;">
       <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
       <c:choose>
       <c:when test="${sessionScope.id eq 'admin'}">
       <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='modifyfile.do?num=${sessionScope.detaildownloadlist['num']}'"><span class="material-symbols-outlined">create</span>Modify</button>
       <button type="button" class="btn btn-danger btn-sm" onclick="location.href='deletefile.do?num=${sessionScope.detaildownloadlist['num']}'"><span class="material-symbols-outlined">delete</span>Delete</button>
       </c:when>
       <c:otherwise></c:otherwise>
       </c:choose> 
       &nbsp;&nbsp; 
     </div>
     <br> 
         <table class="table" style="background-color: lightyellow;">
           <tr>
            <td style="font-weight: bold; font-size: 20px;">제목:</td>
            <td>${sessionScope.detaildownloadlist["title"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">내용:</td>
            <td>${sessionScope.detaildownloadlist["content"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size:20px">파일 다운로드</td>
            <td><a href="/download/${sessionScope.detaildownloadlist['num']}/${sessionScope.detaildownloadlist['filename']}" download>파일 다운로드(${sessionScope.detaildownloadlist['filename']})</a></td>
           </tr> 
           <tr>
            <td style="font-weight: bold; font-size: 20px;">작성 시간:</td>
            <td>${sessionScope.detaildownloadlist["savedate"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">수정 시간:</td>
            <td>${sessionScope.detaildownloadlist["modifydate"]}</td>
           </tr>
       </table>
     <br> 
</div>