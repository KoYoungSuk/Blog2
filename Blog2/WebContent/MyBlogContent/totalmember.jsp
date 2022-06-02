<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-12">
                 <H3>Member Management Center </H3>
                 <hr>
                 <form action="deleteMember.do" method="POST">
                   Delete ID:&nbsp;&nbsp;<input type="text" name="id" required />
                   &nbsp;&nbsp;<button class="btn btn-danger" type="submit">DELETE</button>
                 </form>
                 <hr>
                    <table border=1>
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
                        <button class="btn btn-primary" onclick="location.href='totaldb.do'">Refresh</button>
                        <button class="btn btn-primary" onclick="history.go(-1);">Back</button>
             </div>
        </div>
    </div>