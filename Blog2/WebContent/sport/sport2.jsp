<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:choose>
<c:when test="${sessionScope.id ne 'admin'}">
 <c:redirect url="../3217"></c:redirect>
</c:when>
<c:otherwise></c:otherwise> 
</c:choose>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Friendly Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Ignore Internet Explorer 8 Compatible Mode -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap 4.4 CSS -->
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<!-- Google Span Buttons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- JQuery -->
<script src="../JS/jquery-3.2.1.slim.min.js"></script> 
<title> SportReport(Web) </title>
<style>
 body{
         background-color: #008080; 
 }
 .htitle{
         background-color: blue; 
         text-align: center;
         color: white;
         border: ridge; 
 }
 .footer{
        text-align: right;
        color: white; 
 }
</style>
</head>
<body>
 <div id="maindiv" class="col-lg-6" style="background-color: #DCDCDC; margin: 120px; padding: 0px;">
 <H3 class="htitle" id="htitle_id"> SportReport(Web) </H3>
 <hr>
 <div style="text-align: center;">
 <button type="button" onclick="location.href='../signout.do?check=7'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
 <H5 style="font-weight: bold; "> This is Administrator Only. </H5>
 </div> 
 <hr> 
 <div id="calendar" style="text-align: center;"></div>
 <div style="text-align: center;">
 <H5 style="font-weight: bold;">CHOOSED DATE: ${param.choosed_date}</H5>
 <H5 style="font-weight: bold;">${sessionScope.errormessage_sport}</H5>
 <c:choose>
  <c:when test="${sessionScope.errormessage_sport ne null}">
   <button type="button" onclick="location.href='sport.jsp?page=3&date=${param.choosed_date}'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
  </c:when>
  <c:otherwise></c:otherwise> 
 </c:choose> 
 </div>
 <br> 
</div>
<div class="footer" id="footerid">
  <p>Last updated: Monday, November 20, 2023 </p>
  <p>This is not Copyrighted, But don't use this for illegal purpose. </p> 
</div>
 <script>
   //자바스크립트 달력(참고 출처: https://carrotweb.tistory.com/164)
   //위치 맞추기 부분은 이해를 못하겠음..
   
			var date = new Date();
			
            var yearmonth = "${param.yearmonth}"; //파라미터에서 날짜값을 가져오기 

            var calendarYear = null;
            var calendarMonth = null;
            var calendarToday = date.getDate();
            
            if(!yearmonth){ //파라미터로 가져온 날짜값이 없을때는 현재 날짜를 기준으로 한다. 
            	calendarYear = date.getFullYear();
            	calendarMonth = date.getMonth() + 1;
            }
            else{
            	calendarYear = yearmonth.split('-')[0]; 
            	calendarMonth = yearmonth.split('-')[1]; 
            }

			var monthLastDate = new Date(calendarYear, calendarMonth, 0);
			
			
			var calendarMonthLastDate = monthLastDate.getDate();
			
			var monthStartDay = new Date(calendarYear, calendarMonth - 1, 1);
			
			// 월 시작날짜 
			var calendarMonthStartDay = monthStartDay.getDay();
			
			// 주 (올림)
			var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7); 
	
			
			var html = "";
			html += "<H3 style= \" font-weight: bold; text-align: center; \" >";
			
			//바로 1월로 가기
			html += "<button type=\"button\" class = \" btn btn-secondary btn-sm \" onclick=\"location.href=\'sport2.jsp?yearmonth=";
			html += calendarYear + "-1\'\" ><span class=\"material-symbols-outlined\">keyboard_double_arrow_left</span></button>&nbsp;&nbsp;"; 
			
		    html += "<button type=\"button\" class= \" btn btn-secondary btn-sm \" onclick=\" location.href= \'sport2.jsp?yearmonth=";
		    var calendarMonth_minus = 0;
		    var calendarYear_minus = parseInt(calendarYear); 
		    if(calendarMonth <= 1){
		    	calendarMonth_minus = 12;
		    	calendarYear_minus = calendarYear_minus - 1; 
		    } 
		    else{
		    	calendarMonth_minus = parseInt(calendarMonth) - 1; 
		    }
			html +=  calendarYear_minus + "-" + calendarMonth_minus; 
			html += "\'\">"; 
			html += "<span class= \"material-symbols-outlined\">chevron_left</span>"; 
			html += "</button>&nbsp;&nbsp;&nbsp;&nbsp;"; 

			if(calendarMonth < 10){
				html += calendarYear + "-0" + calendarMonth; 
			}
			else{
				html += calendarYear + "-" + calendarMonth; 
			}
			
		   html += "&nbsp;&nbsp;&nbsp;&nbsp;<button type=\"button\" class=\"btn btn-secondary btn-sm\" onclick=\'location.href=\"sport2.jsp?yearmonth=";
		   var calendarMonth_plus = parseInt(calendarMonth) + 1; 
		   var calendarYear_plus = parseInt(calendarYear); 
		   if(calendarMonth >= 12){
			   calendarMonth_plus = 1;
			   calendarYear_plus = calendarYear_plus + 1; 
		   }
		   else{
			   calendarMonth_plus = parseInt(calendarMonth) + 1; 
		   }
		   
		   html +=  calendarYear_plus + "-" + calendarMonth_plus; 
		   html += " \" \' >"; 
		   html += "<span class= \"material-symbols-outlined\">chevron_right</span>"; 
		   html += "</button>"; 


		   //바로 12월로 가기 
		   html += "&nbsp;&nbsp;<button type=\"button\" class = \" btn btn-secondary btn-sm \" onclick=\"location.href=\'sport2.jsp?yearmonth=";
		   html += calendarYear + "-12\'\" ><span class=\"material-symbols-outlined\">keyboard_double_arrow_right</span></button>"; 
		   
		   html += "</H3>"; 
		   html += "<hr>"; 
			
			
		   html += "<table class= \" table \" style= \" background-color: lightyellow; \" >";
		   html += "<thead>";
		   html += "<tr>";
		   html += "<th>Sunday</th>";
		   html += "<th>Monday</th>";
		   html += "<th>Tuesday</th>";
		   html += "<th>Wednesday</th>";
		   html += "<th>Thursday</th>";
		   html += "<th>Friday</th>";
		   html += "<th>Saturday</th>";
		   html += "</tr>"; 
		   html += "</thead>";
		   html += "<tbody>"; 
			
		    // 위치
			var calendarPos = 0;
			// 날짜
			var calendarDay = 0;
			
			for (var index1 = 0; index1 < calendarWeekCount; index1++) {
				html += "<tr>";
				for (var index2 = 0; index2 < 7; index2++) {
					html += "<td style= \" text-align: center; font-weight: bold; font-size: 25px; \" >"; 
					if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) { //마지막 일까지만 출력&위치 맞추기 	
						calendarDay++;
						if(calendarDay < 10){ //10일 이하일때 
							if(calendarMonth < 10){ //1~9월 
								html += "<a href= \"detailsport?date=" + calendarYear + "-0" + calendarMonth + "-0" + calendarDay +  " \">";
							}
							else{ //10~12월 
								html += "<a href= \"detailsport?date=" + calendarYear + "-" + calendarMonth + "-0" + calendarDay +  " \">";
							}
						}
						else{
							if(calendarMonth < 10){ //1~9월 
								html += "<a href= \"detailsport?date=" + calendarYear + "-0" + calendarMonth + "-" + calendarDay +  " \">";
							}
							else{ //10~12월 
								html += "<a href= \"detailsport?date=" + calendarYear + "-" + calendarMonth + "-" + calendarDay +  " \">";
							}
						}
						html += "<span "; 
						//현재 날짜일때 빨간색으로 바꾸기 
						if(calendarDay == calendarToday && calendarMonth == date.getMonth() + 1 && calendarYear == date.getFullYear()){
							html += "style=\" color: white; background-color: red; border-radius: 50%;  \" >"; 
						}
						else{
							html += ">";
						}
						html += calendarDay; 
						html += "</span> </a>"; 
					}
					html += "</td>";
					calendarPos++; //위치 맞추는 쪽은 이해가 안되네... 
				}
				html += "</tr>";
			}
			html += "</tbody>"; 
			html += "</table>";

			//id에 맞춰서 출력 
			$("#calendar").html(html);
			
			//Seasonal Easter Egg
			if(calendarMonth == 1){ //Jan 
			   document.getElementById("htitle_id").innerHTML = "Happy New Year " + calendarYear + "!"; //Happy New Year! 
			   const body = document.querySelector("body");
			   const footerid = document.getElementById("footerid");
			   
			   body.style.backgroundImage = "url('../pictures/happynewyear.jpg')"; 
			   footerid.style.color = "black"; 
		    }
			else if(calendarMonth == 12){
			   document.getElementById("htitle_id").innerHTML = "Merry Christmas!"; 
			   const htitleid = document.getElementById("htitle_id"); 
			   const body = document.querySelector("body"); 
			   const maindiv = document.getElementById("maindiv"); 
			   const table = document.querySelector("table"); 
			   /*
			     document.getElementById: id로 가져온다.
			     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
			   */
			   htitleid.style.backgroundColor = "#c54245"; //Christmas Red HTITLE 
			   body.style.backgroundColor = "green"; //Christmas Green Wallpaper 
			   maindiv.style.backgroundColor = "white"; //Christmas Card Style 
			   table.style.backgroundColor = "white"; //Christmas Card Style 
			}
			else if(calendarMonth >= 7 && calendarMonth <= 8){ //July and August (Beach Theme)
				const body = document.querySelector("body"); 
				const maindiv = document.getElementById("maindiv"); 
				const table = document.querySelector("table"); 
				   /*
				     document.getElementById: id로 가져온다.
				     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
				   */
				body.style.backgroundColor = "#186690"; //Blue 
			    maindiv.style.backgroundColor = "#cec8c1"; //Sand Color 1
				table.style.backgroundColor = "#f6f0fc"; //Sand Color 2 
			}
			else if(calendarMonth == 10){ //Autumn Theme (October )
				const htitleid = document.getElementById("htitle_id"); 
				const body = document.querySelector("body"); 
				   /*
				     document.getElementById: id로 가져온다.
				     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
				   */
				htitleid.style.backgroundColor = "#cc9d3a";
				body.style.backgroundColor = "#8f2323";  
			}
			else if(calendarMonth >= 3 && calendarMonth <= 4){ //March & April (Cherry Blossom Theme)
				const htitleid = document.getElementById("htitle_id"); 
				const body = document.querySelector("body"); 
				const footerid = document.getElementById("footerid"); 
				   /*
				     document.getElementById: id로 가져온다.
				     document.querySelector: 일반 태그 값(div, p 등)으로 가져온다. 
				   */
				body.style.backgroundImage = "url('../pictures/cherrybloosm.jpg')"; 
				body.style.color = "black"; 
				htitleid.style.backgroundColor ="#e3aab5"; //Cherry Blossom 
				footerid.style.color = "black"; 
				footerid.style.backgroundColor = "#87ceeb"; //skyblue 
			}
		</script>
</body>
</html>