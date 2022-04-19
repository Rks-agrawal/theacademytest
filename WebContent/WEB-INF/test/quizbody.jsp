<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="samp_quest_body_container">
	<input type="hidden" id="totalSection" value="${test.maxSectionId}">
	<input type="hidden" id="lastQuestion" value="${lastQuestion}">
	<input type="hidden" id="firstQuestion" value="${firstQuestion}">
	<form action="submitTest.html" method="post" id="quiztest">
		<input type="hidden" id="userId" name="userId" value="${user.id}" />
	</form>
	<input type="hidden" id="sectionId" name="sectionId"
		value="${section.id}" /> <input type="hidden" id="timeleft"
		name="timeleft" value="${section.duration}"> <input
		type="hidden" id="language" value="${user.defaultLanguage}">

	<form name="frmonlineexam" method="post" action="" autocomplete="off">

		<!-- Top Container -->
		<div id="top-container-wrapper">
			<div id="top-container" class="container">
				<div class="text_bold">
					PRACTICE TEST<span class="lang_disp">Language : <select
						id="langlist" name="langlist" class="listbox"
						onchange="changeLangList()"><option selected="selected"
								value="EN">ENGLISH/HINDI</option></select></span>
				</div>
				<div class="sam_quest_ti_lt_container">
					<div class="sam_quest_ti_lt_hrs" id="timeleft">
						<span id="timer">00:00:00</span>
					</div>
					<div class="sam_quest_ti_lt_txt">
						<b>Time Left</b>
					</div>

				</div>
				<div id="allSection" style="margin-left: 5px; margin-top: 10px;">
					<c:forEach items="${test.sections}" var="section">
						<input type="button" id="sectionButton_${section.id}"
							class="green_button"
							onclick="javascript:getSection(${section.id})"
							value="${section.name}">

					</c:forEach>
				</div>
				<div class="sam_quest_pap_container" id="questionpaper_div"
					style="position: relative; visibility: visible; display: block;">




					<div class="sam_quest_right_top_container">
						<div class="sam_quest_photo">
							<img src="img/photo_no.jpg" title="Photo" width="125"
								height="140" border="0" id="id2834491000008481">
						</div>
						<div class="sam_quest_sig">
							<img src="img/sign.jpg" title="Signature" width="125" height="40"
								border="0" id="id5201439570209327">
						</div>
						<div class="sam_quest_ca_detail">
							<div id="can-dt2">
								<!--<span class="can-lable2">Subject Name</span> 
					<span class="details2"><input title="PRACTICE TEST" type="text" name="subname" id="subname" class="bigtextbox" readonly="readonly" value="PRACTICE TEST" /></span> -->

								<span class="can-lable2">Roll no. </span> <span class="details2">${user.rollno}</span>
								<span class="can-lable2">Candidate Name</span> <span
									class="details2">${user.firstName} ${user.lastName }</span>
							</div>
						</div>
					</div>
					<div id="questionBox">
						<%@include file="questionBox.jsp"%>
					</div>
				</div>
			</div>

			<!-- Link Container-->
			<div class="clear"></div>
			<div id="link-con" class="fixed-btm">
				<div class="container">
					<div id="pre_btn_div">
						<div id="prev_arrow_div">
							<a href="#" onclick="javascript:saveAndPrev()"><img
								src="img/prev_arrow.png" width="12" height="16"
								id="id8173172010957861"></a>
						</div>
						<div id="prev_arrow_text">
							<a href="#" onclick="javascript:saveAndPrev()"
								title="Click to view previous question" id="Prev"
								style="color: rgb(123, 123, 123);">Previous Question</a>
						</div>
					</div>

					<div id="next_btn_div">
						<div id="next_arrow_text">
							<a title="Click to view next question" href="#"
								onclick="saveAndNext()" id="Next"
								style="color: rgb(255, 255, 255);">Next Question</a>
						</div>
						<div id="next_arrow_div">
							<a href="#" onclick="javascript:saveAndNext();"><img
								src="img/next_arrow.png" width="12" height="16"
								id="id853370557330891"></a>
						</div>
					</div>
					<div id="next_section_div" style="display: none;">
						<div id="next_arrow_text">
							<a title="Click to view next section" href="#"
								onclick="getNextSection()" id="Next"
								style="color: rgb(255, 255, 255);">Next Section</a>
						</div>
						<div id="next_arrow_div">
							<a href="#" onclick="getNextSection();"><img
								src="img/next_arrow.png" width="12" height="16"
								id="id853370557330891"></a>
						</div>
					</div>



					<div id="final_submit_btn_div">
						<div id="final_submit_arrow_div">
							<a href="#" onclick="showModule('previewSubmitModal')"><img
								src="img/final_submit_arow.png" width="16" height="13"
								id="id3228807802821252"></a>
						</div>
						<div id="final_submit_arrow_text">
							<a title="Click to submit Question Paper" href="#"
								onclick="showModule('previewSubmitModal')">Preview Submit</a>
						</div>
					</div>

					<input type="hidden" name="qindex" id="qindex" value="0">

					<div class="sam_quest_tag_btn_div" id="tagDiv">
						<input title="Click to review the question" type="button"
							name="mark_btn_6" id="mark_btn_tag" class="yellow_button"
							value="Tag" onclick="markAndReview()">
					</div>
					<div class="sam_quest_er_ans_btn_div" id="eraseDiv">
						<input title="Click to unmark the answer"
							onclick="clearResponse()" class="red_button" type="button"
							value="Erase">
					</div>

				</div>
			</div>
			<div id="statusContainer" style="visibility: hidden;"></div>
			<div id="statusMessageContainer" style="visibility: hidden;"></div>
			<div id="screenoverlay" style="visibility: hidden;"></div>

			<!-- Timer Alert -->
			<div id="styled_popup"
				style="cursor: hand; width: 350px; height: 78px; display: none; position: absolute; z-index: 100; top: -4px; left: -3px;"
				name="styled_popup">
				<table width="100%" height="75" border="0" cellpadding="0"
					cellspacing="0" onclick="javascript:styledPopupClose()">
					<tbody>
						<tr>
							<td><table width="100%" height="78" border="0"
									cellpadding="5" cellspacing="1" class="Report_tb">
									<tbody>
										<tr>
											<th colspan="10">Time Alert</th>
										</tr>
										<tr class="tb_rw3">
											<td colspan="2" align="center">5 Minutes left to auto
												submit your exam.<br> <br> <input name="button"
												type="button" class="green_button"
												onclick="javascript:styledPopupClose()" value=" Close ">
											</td>
										</tr>
									</tbody>
								</table></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- Timer Alert -->


		</div>
		<div class="clear"></div>
		<div id="footer_links">
			<div id="footer_links_inner">
				<div id="footer_copyright_txt">Copyright © 2016, All Rights
					Reserved.</div>
			</div>
		</div>
	</form>
</div>

