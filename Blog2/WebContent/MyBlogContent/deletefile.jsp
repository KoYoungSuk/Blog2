<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
     <div class="col-lg-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
     <h3 class="htitle" style="border: ridge;">Delete File</h3>
     <br>
     <p>CAUTION: You can't recover after deleting file. continue? </p> 
     <form action="deletefile.do" method="POST">
     <div style="text-align: right;">
       <button type="button" class="btn btn-secondary btn-sm" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
       <button type="submit" class="btn btn-danger btn-sm" ><span class="material-symbols-outlined">delete</span>Delete</button>
       &nbsp;&nbsp; 
     </div>
     <br> 
         <table class="table" style="background-color: lightyellow;">
           <tr>
            <td style="font-weight: bold; font-size: 20px;">제목:</td>
            <td>
            <input type="hidden" name="num" value="${sessionScope.detaildownloadlist['num']}" /> 
            ${sessionScope.detaildownloadlist["title"]}
            </td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size: 20px;">내용:</td>
            <td>${sessionScope.detaildownloadlist["content"]}</td>
           </tr>
           <tr>
            <td style="font-weight: bold; font-size:20px">파일명</td>
            <td>${sessionScope.detaildownloadlist['filename']}</a></td>
           </tr> 
       </table>
       </form>
     <br> 
</div>
</c:when>
<c:otherwise>
  <script>
    alert("Administrator Only.");
    history.go(-1); 
  </script>
</c:otherwise>
</c:choose>