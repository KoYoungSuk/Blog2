<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to JSPOracleManager!</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../BS/bootstrap.min.css">
<link rel="stylesheet" href="../BS/bootstrap.css">
<style>
  .footer{
     text-align: center;
}; 
</style>
</head>
<body>
   <div class="container">
   <H1>JSPMyManager </H1>
   <hr>
   <form action="mysql_dbtestresult.do" method="post">
   <table>
   <tr>
   <td><label for="dburl">DB Address/port(ETC: koyoungsuk2.iptime.org:3306)</label></td>
   <td><input type="text" name="dburl" required /></td>
   </tr>
    <tr>
    <td><label for="dbid">DB ID</label></td>
    <td><input type="text" name="dbid"  required /></td>
    </tr>
    <tr>
    <td><label for="dbpw">DB Password</label></td>
    <td><input type="password" name="dbpw"  required /></td>
    </tr>
    <tr>
    <td><label for="database">DataBase Name</label></td>
    <td><input type="text" name="database" required /></td>
    </tr>
    <tr>
    <td><label for="mode">DB Mode</label></td>
    <td><input type="radio" name="mode" value="easy" />Easy Mode</td>
    <td><input type="radio" name="mode" value="professional" checked />Professional Mode</td>
    </tr>
    </table>
    <hr>
    <input type="submit" value="TEST" class="btn btn-success" />
    <input type="button" class="btn btn-primary" value="BACK" onclick="history.go(-1);" />
    <input type="button" class="btn btn-primary" value="BACK TO MAIN PAGE" onclick='location.href="index.jsp"' />
    </form>
    </div>
    <hr>
    <div class="footer">
    <p> Last updated: 29th July, 2021 </p>
    <p> This is not Copyrighted But don't be illegal!!! </p>
    <p> Actually Copyrighted: Oracle, Oracle DataBase and Java, JSP(Java Server Page) are trademark of Oracle Corporation of America. </p>
    </div>
</body>
</html>