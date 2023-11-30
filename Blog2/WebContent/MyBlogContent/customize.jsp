<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="col-lg-6" style="margin: 70px; padding: 0px; background-color: #DCDCDC;">
       <h3 class="htitle" style="border: ridge;">Site Customize</h3>
       <div style="text-align: center;">
          <p style="font-weight: bold; ">You can change background color of this WebSite. </p> 
          <p style="font-weight: bold; ">See Below, you can search color code. than input color code and click change Button. </p>
          <p style="font-weight: bold; ">This Customize Mode uses cookie. if you delete cookies, Customize setting will be reset. </p> 
          <p style="font-weight: bold; ">Also notice: this cookie remains 1 years. after 1 years, Customize setting will be reset. </p>
          <H4 style="font-weight: bold; color: ${cookie.colorcode.value}; ">CURRENT COLOR VALUE: ${cookie.colorcode.value} </H4> 
          <form action="customize.do" method="POST">
              <table style="margin: auto; ">
              <tr>
              <td>
              <input type="text" class="form-control" name="colorcode" placeholder="COLOR CODE (FOR EXAMPLE: #FFFFFF for White)" value="${cookie.colorcode.value}" style="width: 410px; text-align: center; "/> 
              </td>
              <td> 
              <button type="submit" class="btn btn-secondary btn-sm"><span class="material-symbols-outlined">tune</span>Change</button>
              <button type="button" class="btn btn-danger btn-sm" onclick="location.href='resetcustomize.do'"><span class="material-symbols-outlined">tune</span>Reset</button> 
              </td>
              </tr>
              </table>
          </form>
          <iframe src="https://html-color-codes.info/" width="640" height="600"></iframe>
          <br> 
          <a href="https://html-color-codes.info/" style="font-weight: bold; ">If you can't see iframe... click this link!</a>
       </div> 
       <br> 
</div>