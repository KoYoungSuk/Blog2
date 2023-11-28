<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id eq 'admin'}">
             <div class="col-lg-6" style="background-color: #DCDCDC; padding: 0px; margin: 70px">
                <h3 class="htitle" style="border: ridge; ">Modify File</h3> 
                     <form action="modifyfile.do" method="POST" enctype="multipart/form-data" > 
                     <div style="text-align: right;">
                     <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
                     <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">create</span>Modify</button>
                     &nbsp;&nbsp;
                     </div>
                     <br> 
                     <table class="table" style="background-color: lightyellow;">
                     <tr>
                     <td><p><label for="title" style="font-weight: bold; font-size: 20px;">Title:</label></p></td>
                     <td>
                     <input class="form-control mr-sm-10" type="text" name="title" value="${sessionScope.detaildownloadlist['title']}" required />
                     <input type="hidden" name="num" value="${sessionScope.detaildownloadlist['num']}" /> 
                     </td>
                     </tr>
                     <tr>
                     <td><p><label for="content" style="font-weight: bold; font-size: 20px;">Content:</label></p></td>
                     <td><p><textarea class="form-control mr-sm-10" rows="15" cols="68" autofocus name="content" wrap="hard" >${sessionScope.detaildownloadlist['content']}</textarea></p></td>
                     </tr>
                     <tr>
                     <td><p><label for="file" style="font-weight: bold; font-size: 20px;">Modify File</label></p></td>
                     <td>
                     <input type="file" name="file"> 
                     CURRENT FILENAME: ${sessionScope.detaildownloadlist['filename']}
                     </td>
                     </tr>
                     </table> 
                     <br> 
                     </form>
            </div>
</c:when>
<c:otherwise>
  <script>
  alert("Administrator Only.");
  history.go(-1); 
  </script> 
</c:otherwise>
</c:choose>
