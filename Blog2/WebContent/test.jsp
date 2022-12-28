<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML> 
<html>
<head>
   <title>www.webmadang.net</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script language="javascript">
      var sum = 0; 
      function itemSum(frm) {
         var count = frm.checkbox.length;
         for (var i = 0; i < count; i++) {
            if (frm.checkbox[i].checked == true) {
               sum += parseInt(frm.chkbox[i].value);
            }
         }
         //frm.total_sum.value = sum;
         
         sum = document.getElementById("SCORE").innerHTML; 
      }
      function buttonclick()
      {
    	  if(sum == 3)
          {
         	 window.location.replace('./main.do');
          }
          else if(sum == 2)
          {
        	  window.location.replace('./diary');
          }
      }
      
   </script>
</head>
<body>
   <form name="form">
      <table width="500" border="0" cellspacing="0" cellpadding="0">
         <tr><td>01. 말 잘하는 것을 매력이라고 생각한다.</td></tr>

         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="2" onClick="itemSum(this.value);">&nbsp;그렇다</td>
         </tr>
         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="1" onClick="itemSum(this.value);">&nbsp;조금 그렇다</td>
         </tr>
         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="0" onClick="itemSum(this.value);">&nbsp;아니다</td>
         </tr>


         <tr><td>02. 자기의 가치에 대해 자랑하고 다닌다.</td></tr>

         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="2" onClick="itemSum(this.value);">&nbsp;그렇다</td>
         </tr>
         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="1" onClick="itemSum(this.value);">&nbsp;조금 그렇다</td>
         </tr>
         <tr>
            <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="0" onClick="itemSum(this.value);">&nbsp;아니다</td>
         </tr>
   </table>
   <!-- <label for="SCORE" id="SCORE"></label> -->
   
   </form>
    <input type="text" id="SCORE" onKeyPress="buttonclick(this.value);">
  </body>
  </html>
