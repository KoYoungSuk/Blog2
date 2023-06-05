<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-sm-4" style="padding: 0px; margin: 70px; background-color: #DCDCDC;">
   <h3 class="htitle" style="border: ridge;">Manage Center </h3>
    <c:choose>
     <c:when test="${sessionScope.id eq 'admin'}">
       <h4>&nbsp;&nbsp;Current User: ${sessionScope.id} </h4>
       <!-- 
       <p><a href="./manager/status">Tomcat Server Status(ID: ${id})</a></p>
       <p><a href="dbmanager">JSPOracleManager</a></p>
       <p><a href="totaldb.do">Member Management Center</a>
       -->
       <br> 
       <div style="text-align: right;">
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='../manager/status'"><span class="material-symbols-outlined">dns</span>Tomcat Server Status</button>
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='dbmanager'"><span class="material-symbols-outlined">database</span>JSPOracleManager</button>
       <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='totaldb.do'"><span class="material-symbols-outlined">person</span>Member Management Center</button>&nbsp;&nbsp;
       </div>
      </c:when>
     <c:otherwise>
       <h4>&nbsp;&nbsp;Administrator Only. </h4> 
    </c:otherwise>
   </c:choose>
</div>