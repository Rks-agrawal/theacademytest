<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<title>Assessment Examination Center</title>
<script>
	function validate() {
		document.getElementById("frmlogincheck").submit();
		//window.location.href="instructions.html";
	}
</script>
</head>
<body oncontextmenu="return false">
	<div id="wrapper">
  <div id="header_container">
    <div id="header_container_inner">
      <!-- <div id="header_sify_logo"><img src="themes/default/images/sify_logo.png" width="70" height="37" /></div> -->
	  <div id="header_sify_logo">
	  <table width="850px" border="0" cellspacing="0" cellpadding="0">
	  <tbody><tr>
		<td width="25%" align="left"></td>
		<td width="50%" align="center"><img src="img/sify_logo.png" width="250" height="45"></td>
		<td width="25%"></td>
	  </tr>
	  </tbody></table>
	  </div>
    </div>
  </div>
  <div class="clear"></div>
  <div id="body_container">

<form id="frmlogincheck" method="post" autocomplete="off" action="instructions.html">
	<input type="hidden" id="userid" name="userId" value="${user.id}">
    <div id="body_container_inner">
      <div class="innerbox_container_cadetails_wrapper"><div class="outerbox">
	<div class="innerbox">
    	<div class="innerbox_container_cadetails">
        	<div class="pager_header_common">Candidate Details</div>
            <div class="content_container_cadetails">
            	<div class="content_container_box_cadetails">
                
                <div class="content_container_inner_box_cadetails">
        
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="content_container_inner_box_cadetails_inner_tb">
            <tbody><tr>
              <td width="25%" height="30" align="right" class="tb_rw1">Roll no</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td width="72%" height="30" class="tb_rw2">${user.rollno}</td>
            </tr>
            <tr>
              <td width="25%" height="30" align="right" class="tb_rw1">Name</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td width="72%" height="30" class="tb_rw2">${user.firstName} ${user.lastName}</td>
            </tr>
            <tr>
              <td width="25%" height="30" align="right" class="tb_rw1">Address</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td width="72%" height="30" class="tb_rw2">RANCHI</td>
            </tr>
            <tr>
              <td width="25%" height="30" align="right" class="tb_rw1">Exam Code</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td width="72%" height="30" class="tb_rw2">100(PRACTICE TEST)</td>
            </tr>
            <tr>
              <td width="25%" height="30" align="right" class="tb_rw1">Subject Code</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td width="72%" height="30" class="tb_rw2">101(PRACTICE TEST)</td>
            </tr>
            <tr>
              <td height="30" align="right" class="tb_rw1">Medium Code</td>
              <td width="3%" height="30" class="tb_col">:</td>
              <td height="30" class="tb_rw2">
<input type="hidden" value="EN" name="lstmedium">
ENGLISH / HINDI
<!--<select name='lstmedium' class="dropdownbox">-->
<!--</select>-->
               </td>
            </tr>
          </tbody></table>
        </div>
            	</div>
            </div>
            <div class="button_container_common">
              <input class="green_button" id="Confirm" type="button" value="Confirm" name="confirm" onclick="validate()">
              <br><span id="submitstatus" class="errormsg"></span>							  
              <input type="hidden" name="old_mediumcode" id="old_mediumcode" value="EN">
              <!--  Added for BOI -->
              <input type="hidden" name="opt_subcode" value="">
              <input type="hidden" name="instruction_subcode" value="101">
              <!--  Added for BOI ends here-->
            </div>
        </div>
    
    </div>
</div></div>
    </div>
</form>
  </div>
  <div class="clear"></div>
  <div id="footer_links">
    <div id="footer_links_inner">
      <div id="footer_copyright_txt">Copyright © 2016, All Rights Reserved.</div>
    </div>
  </div>
</div>

</body>
</html>