<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<title>Assessment Examination Center</title>
<script type="text/javascript">
	function loadDefault() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();

		if (dd < 10) {
			dd = '0' + dd
		}

		if (mm < 10) {
			mm = '0' + mm
		}
		var now = today.getHours() + ":" + today.getMinutes() + " Hrs.";
		today = dd + '/' + mm + '/' + yyyy;
				
		document.getElementById("today").innerHTML = today;
		document.getElementById("now").innerHTML = now;
	}
</script>
</head>

<body onload="loadDefault()">
	<div id="wrapper">
		<div id="header_container">
			<div id="header_container_inner">
				<!-- <div id="header_sify_logo"><img src="img/sify_logo.png" width="70" height="37" /></div> -->
				<div id="header_sify_logo">
					<table width="850px" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="25%" align="left"></td>
								<td width="50%" align="center"><img src="img/sify_logo.png"
									width="250" height="45"></td>
								<td width="25%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="body_container">


			<form name="feedback" method="post" action="">
				<input type="hidden" name="membership_no" value="TEST1"> <input
					type="hidden" name="exam_code" value="100"> <input
					type="hidden" name="subject_code" value="101">
				<!-- Added for BOI -->
				<input type="hidden" name="cafeid" value="600113A">
				<!-- Added for BOI Ends here-->

				<!--table width="785" border="0" cellspacing="0" cellpadding="0" align=center >
	<tr> 
					<td align="center" width="785" valign="top" class="menu">&nbsp;</td>
			</tr>
	<tr>
		<td width="785" class="ColumnFooter">&nbsp;</td>
	</tr>
</table-->
				<div id="body_container_inner">
					<div class="ca_ex_res_wrapper">
						<div class="outerbox">
							<div class="innerbox">
								<div class="innerbox_container_common">
									<div class="pager_header_common">Test Summary</div>
									<div class="content_container_common">
										<div class="content_container_box_common">
											<div id="ca_ex_res_inner_box">
												<table width="95%" border="0" align="center" cellpadding="0"
													cellspacing="0" id="ca_ex_res_inner_box_inner_tb">
													<tbody>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Roll no</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">${user.rollno}</td>
														</tr>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Name</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">${user.firstName}
																${user.lastName}</td>
														</tr>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Address</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">RANCHI</td>
														</tr>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Examination</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">SSC - CGL (Tier I)<br></td>
														</tr>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Subject
																Name</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">PRACTICE TEST<br></td>
														</tr>
														<tr>
															<td width="25%" align="right" class="tb_rw1">Examination
																Centre</td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td width="72%" class="tb_rw2">Lakshya Online Test
																Centre<br>
															</td>
														</tr>
														<tr>
															<td align="right" class="tb_rw1">Examination Date<br></td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td class="tb_rw2"><span id="today"></span><br></td>
														</tr>
														<tr>
															<td align="right" class="tb_rw1">Examination Time<br></td>
															<td width="3%" align="left" class="tb_col">:</td>
															<td class="tb_rw2"><span id="now"></span><br></td>
														</tr>

													</tbody>
												</table>
												<div class="clear"></div>
												<h1>Thank you for taking the online examination</h1>
												<div id="tot_no_quest">
													Total number of question attempted<span class="N-attempt">${testDetails.totalAttempted}</span>
												</div>
												<div id="tot_no_quest_right">
													Unattempted<span class="N-unattempt">${testDetails.totalUnAttempted}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="button_container_common">
										<a href="finish.html"><input name="exitbtn" class="green_button" type="button"
											 value="Exit"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
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