<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-6" style="background-color: #DCDCDC; padding: 0px; margin: 70px;">
         <h3 class="htitle" style="border: ridge;">ETC</h3>
         <h4>&nbsp;&nbsp;ETC Link</h4>
         <br> 
         <div style="text-align: center;">
         <form action="selectetc.do" method="GET">
             <input type="text" class="form-control" name="ServiceSearch" placeholder="Search ETC Link Name" />
             <br> 
             <select class="form-control" name="Services" size="7" required>
                <option value="Clock">Clock</option>
                <option value="NewClock">Clock(New)</option>
                <option value="Calendar">Calendar</option>
                <option value="MyDiary">MyDiary(Web)</option>
                <option value="MyDiaryNew">MyDiary(Web) Calendar Mode</option>
                <option value="DailyManager">DailyManager(Web)</option>
                <option value="SportReport">SportReport(Web)</option>
                <option value="HomeProduct(Web)">HomeProduct(Web)</option>
              </select> 
              <br> 
              <button class="btn btn-secondary btn-sm" type="submit"><span class="material-symbols-outlined">arrow_forward</span>Go to Link</button>
         </form>
         <!-- 
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='clock'"><span class="material-symbols-outlined">timer</span>Clock(Javascript)</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='clock_new'"><span class="material-symbols-outlined">timer</span>NewClock(Javascript)</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='calendar'"><span class="material-symbols-outlined">calendar_month</span>Calendar(Javascript)</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='diary'"><span class="material-symbols-outlined">book</span>MyDiary(Web) List System</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='diary_new'"><span class="material-symbols-outlined">book</span>MyDiary(Web) Calendar System</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='daily'"><span class="material-symbols-outlined">calendar_month</span>DailyManager(Web) Calendar System</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='sport'"><span class="material-symbols-outlined">fitness_center</span>SportReport(Web) Calendar System</button>
          <br><br>
          <button class="btn btn-secondary btn-sm" style="width: 300px; height: 40px;" onclick="location.href='product'"><span class="material-symbols-outlined">category</span>HomeProduct(Web) List System</button>
          &nbsp;&nbsp; 
          --> 
         </div> 
         <br> 
</div>