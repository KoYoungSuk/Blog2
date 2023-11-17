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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap 4.4 CSS -->
<link rel="stylesheet" href="../BS/bootstrap.min.css" />
<link rel="stylesheet" href="../BS/bootstrap.css" />
<!-- Google Span Buttons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="../JS/jquery-3.2.1.slim.min.js"></script> 
<title> MyDiary(Web) </title>
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
<script>
document.addEventListener('keydown', (event) => {
	  
    var address = window.location.href; 
    
    /*
    //방향키를 이용하여 페이지를 앞뒤로 왔다갔다 하는 기능 
    if(address.includes("diary_new.jsp")){
        if(event.key === "ArrowLeft"){ //왼쪽 방향키를 눌렀을때 
      	  if(address.includes("?yearmonth=")){
      		  address = address.slice(0, -1);
      		  var pagenum_minus = ${param.page_count_diary} - 1; //JSTL Code 
      		  if(pagenum_minus >= 9){ //페이지 번호가 10자리수를 넘어갈때 
      			  address = address.slice(0, -1); 
      		  }
      		  else if(pagenum_minus < 0){ //첫 페이지 번호에 도달했을때 
      			  pagenum_minus = 0; 
      		  }
      		  address = address + pagenum_minus;
      		  window.location.replace(address); 
      	  }
        }
        else if(event.key === "ArrowRight"){ //오른쪽 방향키를 눌렀을때 
            if(address.includes("?yearmonth=")){
          	  address = address.slice(0, -1);
      		  var pagenum_plus = ${param.page_count_diary} + 1; //JSTL Code 
                if(pagenum_plus >= 11){ //페이지 번호가 10자리수를 넘어갈때 
              	  address = address.slice(0, -1); 
                } 
                
                if(pagenum_plus > ${sessionScope.page_num_diary}){ //마지막 페이지 번호에 도달했을때 
              	  pagenum_plus = pagenum; 
                }
      		  address = address + pagenum_plus; 
      		  window.location.replace(address); 
      	  }
      	  else{ //첫 페이지일때(첫 접속)
      		  address = address + "?page_count_diary=2"; //2번째 페이지로 이동 
      		  window.location.replace(address); 
      	  }
        }
    }
    */
});

</script>
</head>
<body>
 <div id="maindiv" class="col-lg-6" style="background-color: #DCDCDC; margin: 120px; padding: 0px;">
 <H3 class="htitle" id="htitle_id"> MyDiary(Web) Calendar Mode </H3>
 <hr>
 <div style="text-align: center;">
 <form action="../diary/detaildiary" method="POST">
   <table style="margin: auto;">
   <tr>
   <td>
   <input type="text" class="form form-control" name="title" placeholder="Input Title Here." /> 
   <input type="hidden" name="checkcal" value="cal" />
   </td>
   <td>
   <button type="submit" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">search</span>Search</button>
   <button type="button" onclick="location.href='../signout.do?check=6'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">logout</span>Logout</button>
   </td>
   </tr>
   </table>
 </form>
 <H5 style="font-weight: bold; ">MyDiary(Web) is Administrator Only! </H5>
 </div> 
 <hr> 
 <div id="calendar" style="text-align: center;"></div>
 <div style="text-align: center;">
 <H5 style="font-weight: bold;">${sessionScope.errormessage_diary}</H5>
 <c:choose>
  <c:when test="${sessionScope.errormessage_diary ne null}">
   <c:choose> 
   <c:when test="${param.choosed_title ne null}">
   <H6 style="font-weight: bold; ">SELECTED TITLE : ${param.choosed_title}</H6> 
   </c:when>
   <c:otherwise></c:otherwise> 
   </c:choose>
   <button type="button" onclick="location.href='../diary/diary.jsp?page=3&title=${param.choosed_title}&checkcal=cal'" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">create</span>Write</button>
  </c:when>
  <c:otherwise></c:otherwise> 
 </c:choose> 
 </div>
 <br> 
</div>
<div class="footer" id="footerid">
  <p>Last updated: Thursday, November 16th, 2023 </p>
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
			
		    html += "<button type=\"button\" class= \" btn btn-secondary btn-sm \" onclick=\" location.href=\'diary_new.jsp?yearmonth=";
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
			html += "<span class= \"material-symbols-outlined\">arrow_back</span>"; 
			html += "</button>&nbsp;&nbsp;&nbsp;&nbsp;"; 

			if(calendarMonth < 10){
				html += calendarYear + "-0" + calendarMonth; 
			}
			else{
				html += calendarYear + "-" + calendarMonth; 
			}
			
		   html += "&nbsp;&nbsp;&nbsp;&nbsp;<button type=\"button\" class=\"btn btn-secondary btn-sm\" onclick=\'location.href=\"diary_new.jsp?yearmonth=";
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
		   html += "<span class= \"material-symbols-outlined\">arrow_forward</span>"; 
		   html += "</button>"; 

			
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
								html += "<a href= \"../diary/detaildiary?title=" + calendarYear + "-0" + calendarMonth + "-0" + calendarDay +  "&checkcal=cal  \">";
							}
							else{ //10~12월 
								html += "<a href= \"../diary/detaildiary?title=" + calendarYear + "-" + calendarMonth + "-0" + calendarDay +  "&checkcal=cal \">";
							}
						}
						else{
							if(calendarMonth < 10){ //1~9월 
								html += "<a href= \"../diary/detaildiary?title=" + calendarYear + "-0" + calendarMonth + "-" + calendarDay +  "&checkcal=cal \">";
							}
							else{ //10~12월 
								html += "<a href= \"../diary/detaildiary?title=" + calendarYear + "-" + calendarMonth + "-" + calendarDay +  "&checkcal=cal \">";
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