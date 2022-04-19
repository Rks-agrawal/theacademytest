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
		document.getElementById("loginform").submit();
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
						<tbody>
							<tr>
								<td width="25%" align="left"></td>
								<td width="50%" align="center"><img
									src="img/sify_logo.png" width="250" height="45"></td>
								<td width="25%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="body_container">


			<div id="body_container_inner">
				<div class="innerbox_container_calogin_wrapper">
					<div class="outerbox">
						<div class="innerbox">
							<div class="innerbox_container_calogin">
								<div class="pager_header_common">Candidate Login</div>
								<div class="content_container_calogin">
									<!--<div class="content_container_box_calogin" >-->
									<form id="loginform" method="post" action="validateLogin.html">
										<input type="hidden" name="from_page" value=""> <input
											type="hidden" name="hid_lefttime" value=""> <input
											type="hidden" name="ta_override" value="">
										<table width="95%" border="0" align="center" cellpadding="0"
											cellspacing="0" id="content_container_box_calogin_inner_tb">
											<tbody>
												<tr>
													<td width="37%" align="center"><label> Roll No
															<br> &nbsp;
													</label></td>
													<td width="63%"><input type="text" name="rollno"
														class="textbox" value="" maxlength="20"
														onkeypress="return letternumber(event)"><br>
													<label>Please click on the tab key to move to
															password field</label></td>
												</tr>
												<tr>
													<td width="37%" align="center"><label>Password<br>(Date
															of Birth)<br>(DDMMYYYY)
													</label></td>
													<td width="63%"><input type="password"
														name="password" class="textbox" maxlength="50"
														value="" onkeypress="return letternumber(event)">
														<input type="hidden" name="cpassword" id="cpassword"
														value=""></td>
												</tr>
											</tbody>
										</table>
									</form>
									<!--</div>-->
								</div>
								<div class="button_container_common">
									<input name="go" id="go" class="green_button" type="button"
										value="Submit" style="margin-right: 6px;"
										onclick="validate()">
									<!--<input name="sub_view2" id='sub_view' class="green_button" type="button" value="Back" onclick="javascript:window.location='ta_options.php'" />-->
									<br>
									<c:if test="${loginerror ne ''}">
									<span id="submitstatus" class="errormsg">${loginerror}</span>
									</c:if>
								</div>
							</div>
							<div class="errMsg"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="footer_links">
			<div id="footer_links_inner">
				<div id="footer_copyright_txt">Copyright © 2016, All Rights
					Reserved.</div>
			</div>
		</div>
	</div>



</body>
</html>