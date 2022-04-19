<div id="TB_overlay" class="TB_overlayBG"></div>
<div id="TB_window"
	style="margin-left: -410px; width: 420px; display: block;">
	<div id="TB_ajaxContent" class="TB_modal"
		style="width: 800px; height: -5px;">
		<div class="portlet_topper">
			<div class="popupheader">Profile</div>
			<div class="arrowplace">
				<a href="#" onclick="tb_remove();removeActiveLinks()">Close X</a>
			</div>
		</div>
		<div class="popup_content">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td valign="top"><div class="userimage">
								<img width="94" height="101" align="absmiddle"
									class="candidateImg" src="img/NewCandidateImage.jpg">
							</div>
							<div class="content" id="profileDiv" style="display: block;">
								<table width="100%" border="0" cellspacing="0" cellpadding="10"
									class="candidateDetailstbl" style="font-size: 14px; font-family: Arial, Helvetica, sans-serif;">
									<tbody>
										<tr>
											<td width="27%" align="left" class="head1" id="loginName">Roll
												No</td>
											<td align="left"><strong>: <span id="candId">${user.rollno}</span></strong></td>
										</tr>
										<tr>
											<td width="27%" align="left" class="head1" id="candName">Name</td>
											<td align="left"><strong>: <span
													class="candOriginalName" title="John Smith">${user.firstName}
														${user.lastName }</span></strong></td>
										</tr>
										<tr>
											<td align="left" class="head1" id="emailIdText"></td>
											<td align="left"><strong> <span id="emailId"></span></strong></td>
										</tr>
										<tr>
											<td align="left" class="head1" id="contactNoText">Contact
												No</td>
											<td align="left"><strong> <span id="contactNo"><b>
															: </b>${user.mobileNo}</span></strong></td>
										</tr>

									</tbody>
								</table>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>