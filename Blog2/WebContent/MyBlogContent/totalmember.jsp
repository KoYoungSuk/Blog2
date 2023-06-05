<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
             <div class="col-sm-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
                 <h3 class="htitle" style="border: ridge;">Member Management Center </h3>
                 <hr>
                 <form action="deleteMember.do" method="POST">
                   <div style="text-align: center;">
                   <input class="form-control-sm " type="text" name="id" placeholder="Delete ID" required />
                   &nbsp;&nbsp;
                   <button class="btn btn-secondary btn-sm" type="button" onclick="history.go(-1);"><span class="material-symbols-outlined">arrow_back_ios</span>Back</button>
                   <button class="btn btn-danger btn-sm" type="submit"><span class="material-symbols-outlined">delete</span>Delete</button>
                   <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='totaldb.do'"><span class="material-symbols-outlined">refresh</span>Refresh</button>
                   </div>
                 </form>
                 <hr>
                    <table class="table" >
                         <thead>
                         <tr>
                            <th>Number</th>
                            <th>ID</th>
                            <th>Password</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Birthday</th>
                            <th>Join Date</th>
                         </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="memberDO" items="${sessionScope.memberlist}" varStatus="status">
                            <tr>
                            <td>${status.count}</td>
                            <td><c:out value="${memberDO.id}" /></td>
                            <td>PASSWORD CENSORED</td>
                            <td><c:out value="${memberDO.firstname}" /></td>
                            <td><c:out value="${memberDO.lastname}" /></td>
                            <td><c:out value="${memberDO.birthday}" /></td>
                            <td><c:out value="${memberDO.joindate}" /></td>
                            </tr>
                             </c:forEach>
                         </tbody>
                         </table>
                         <hr>
                       
             </div>