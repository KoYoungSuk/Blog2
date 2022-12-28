<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="container" style="margin-top:20px">
<div class="row">
<div class="col-sm-12">
 <h3 class="htitle">HomePage Manage Center </h3>
   <hr>  
   <div id="smalldiv">
    <c:choose>
     <c:when test="${sessionScope.id eq 'admin'}">
       <p>Current User: ${sessionScope.id} </p>
       <p><a href="manager/status">Tomcat Server Status(ID: ${id})</a></p>
       <p><a href="dbmanager">JSPOracleManager</a></p>
       <p><a href="totaldb.do">Member Management Center</a>
      </c:when>
     <c:otherwise>
       <p>Administrator Only. </p> 
    </c:otherwise>
   </c:choose> 
   </div>
</div>
</div>
</div>