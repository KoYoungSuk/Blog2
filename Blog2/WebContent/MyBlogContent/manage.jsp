<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-8" style="padding: 0px; margin: 70px; background-color: #DCDCDC;">
   <h3 class="htitle" style="border: ridge;">Manage Center </h3>
    <c:choose>
     <c:when test="${sessionScope.id eq 'admin'}">
       <h4>&nbsp;&nbsp;Current User: ${sessionScope.id} </h4>
       <br> 
       <div style="text-align: center;">
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='/manager/status'"><span class="material-symbols-outlined">dns</span>Server Status</button>
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='totaldb.do'"><span class="material-symbols-outlined">person</span>Member Management</button>
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='./pdfviewer/pdflist.do'"><span class="material-symbols-outlined">upload_file</span>Upload PDF Files</button>
       </div>
       <p></p> 
      </c:when>
     <c:otherwise>
       <script>
         alert("Administrator Only.");
         history.go(-1); 
       </script>
    </c:otherwise>
   </c:choose>
</div>