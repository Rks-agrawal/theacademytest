<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/instr.js"></script>
<title>Assessment Examination Center</title>
<script>
	function submitForm() {
		document.getElementById("frmname").submit();
		//window.location.href="quiz.html";
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

			<form id="frmname" method="post" action="quiz.html">
				<input type="hidden" name="time_to_submit" id="time_to_submit"
					value="600"> <input type="hidden" name="hLanguage"
					value="EN">
					<input type="hidden" id="userid" name="userId" value="${userid}">
			</form>

			<div id="body_container_inner">
				<div id="ca_inst_wrapper">
					<div class="outerbox">
						<div class="innerbox">
							<div class="innerbox_container_common">
								<div class="pager_header_common">Candidate Instructions</div>
								<div class="content_container_common">
									<div class="content_container_box_common">
										<div id="ca_inst_content">





























											<div align="center">
												<b>अभ्यास परीक्षा</b><br>
											</div>
											<br>
											<u><b>डिसक्लेमर</b></u><br>
											<br>1) यह `कंप्‍यूटर आधारित परीक्षा` हेतु आपके अभ्‍यास
											और आपको परिचित कराने के लिए केवल एक प्रदर्शन है ।<br>
											<br>2) परीक्षा के वास्‍तविक प्रश्‍न पत्र में 100 प्रश्‍न
											हैं जिन्‍हें 1 घंटा 15 मिनट में करना होगा और इस `अभ्‍यास
											परीक्षा` में 25 प्रश्‍न हैं जिन्‍हें 18 मिनट 45 सेकंड में
											करना होगा ।
											<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
											<span lang="HI" style="font-family: Mangal;"></span>
											<!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" LatentStyleCount="156">
 </w:LatentStyles>
</xml><![endif]-->
											<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]-->
											<br>
											<u><b><br></b></u><u><b>प्रश्‍नपत्र के बारे में</b></u>
											:<br>
											<br>1) इस प्रश्‍नपत्र में बहु-विकल्पीय वस्तुनिष्ठर
											प्रश्‍न हैं जिसमें 4 विकल्पं दिए गए हैं, जिसमें से केवल 1
											विकल्प सही है ।<br>
											<br>2) कंप्‍यूटर आधारित परीक्षा द्विभाषी अर्थात अंग्रेजी
											एवं हिन्‍दी भाषा में होगी । प्रश्‍न और उत्‍तर के विकल्‍प दोनो
											भाषाओं में दिखाई देंगे ।<br>
											<br>3) स्क्रींन के शीर्ष दाएं कोने में टाइमर (घड़ी)
											उपलब्ध है; आपसे अनुरोध है कि परीक्षा पूरी करने के लिए शेष समय
											की जानकारी हेतु इसे देखते रहें ।<br>
											<br>4) प्रत्‍येक प्रश्‍न का 2 अंक है ।<br>
											<br>
											<div>5) प्रत्‍येक सही उत्‍तर के लिए 2 अंक दिये जायेंगे।
												इसमें प्रत्‍येक गलत उत्‍तर के लिए 0.50 अंक काटे जायेंगें।
												अनुत्‍तरति प्रश्‍नों के लिए अंकों की कटौती नहीं की जायेगी।</div>
											<div>
												<br>
											</div>
											6) एक बार में कंप्यूटर स्क्रीन पर केवल एक प्रश्‍न प्रदर्शित
											किया जाएगा । अभ्यर्थियों को अगले प्रश्‍न पर जाने के लिए
											स्क्रीन के नीचे दिए गए बटन <img
												src="img/ins1.jpg" border="0" width="139"
												height="26" vspace="10" hspace="10"
												style="vertical-align: middle;"> पर क्लिक करना चाहिए
											अथवा पिछले प्रश्‍न पर जाने के लिए <img
												src="img/ins2.jpg" border="0" width="160"
												height="30" vspace="10" hspace="10"
												style="vertical-align: middle;"> पर क्लिक करना चाहिए ।<br>
											<br>7) प्रश्‍नों को दी गई समय सीमा के भीतर किसी भी क्रम
											में हल किया जा सकता है । अभ्‍यर्थी को 4 विकल्पों में से सही
											विकल्प पर माउस से क्लिक करना होगा । यदि अभ्यर्थी प्रश्‍न का
											उत्तर नही देना चाहता है तो वह उस प्रश्‍न को खाली छोड़ सकता है
											।
											<div>
												<br>8) अभ्यर्थी यदि चाहता है तो वह नए विकल्प का चयन कर
												किसी प्रश्‍न के विकल्प को बदल सकता है । यदि अभ्यर्थी प्रश्‍न
												का उत्तर नही देना चाहता है तो वह प्रश्‍न के सामने दिए गए <img
													src="img/ins3_1.jpg" border="0" width="60"
													height="27" vspace="10" hspace="10"
													style="vertical-align: middle;"> को क्लिक कर उत्‍तर
												को अचयनित कर सकता है ।
											</div>
											<div>
												<br>9) प्रश्‍नों में आगे और पीछे जाने के लिए,
												अभ्यर्थियों को <img src="img/ins1.jpg"
													border="0" width="139" height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> या <img
													src="img/ins2.jpg" border="0" width="160"
													height="30" vspace="10" hspace="10"
													style="vertical-align: middle;"> बटन का इस्तेमाल करना
												चाहिए अथवा कंप्यूटर स्क्रीन के दाएं हाथ की ओर दी गई प्रश्‍न
												संख्या पर क्लिक करना चाहिए जहां पर प्रश्‍न संख्याओं को `किए
												गए` या `न किए गए` की स्थिति के साथ प्रदर्शित किया जाएगा।<br>
												<br>10) जब भी अभ्यर्थी <img
													src="img/ins1.jpg" border="0" width="139"
													height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> या <img
													src="img/ins2.jpg" border="0" width="160"
													height="30" vspace="10" hspace="10"
													style="vertical-align: middle;"> बटन पर क्लिक करके
												अगले प्रश्‍न पर जाता है तो उत्तरों को सहेज लिया जाएगा ।<br>
												<br>11) अभ्यर्थियों के पास स्क्रीन के निचले हिस्से में
												उपलब्ध. <img src="img/ins4_1.jpg" border="0"
													width="47" height="22" vspace="10" hspace="10"
													style="vertical-align: middle;"> बटन पर क्लिक करके
												किसी प्रश्‍न को बुकमार्क करने का विकल्प है, अगर वे बाद में
												उसकी समीक्षा करने की इच्छा रखते हैं । एक विशेष प्रश्‍न पर
												मौजूद बुकमार्क को <img src="img/ins6_1.jpg"
													border="0" width="71" height="24" vspace="10" hspace="10"
													style="vertical-align: middle;"> पर क्लिक करके हटाया
												जा सकता है ।<br>
												<br>12) स्क्रीन के दायीं ओर प्रश्‍न पैलेट में प्रत्येक
												संख्यांकित प्रश्‍न की निम्नलिखित स्थिति दिखाई देती है ।<br>
												<br>
												<img src="img/ins_c1.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> आपने प्रश्‍न का
												उत्तर दिया है।<br>
												<img src="img/ins_c2.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> आपने प्रश्‍न का
												उत्तर नहीं दिया है और समीक्षा के लिए चिन्हित किया है।<br>
												<img src="img/ins_c3.jpg" border="0"
													width="32" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> आपने प्रश्‍न का
												उत्तर दिया है लेकिन समीक्षा के लिए चिन्हित किया है।<br>
												<img src="img/ins_c4.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> आपने प्रश्‍न का
												उत्तर नहीं दिया है।<br>
												<br>
												<b>कृपया ध्यान दें: जिन </b><b>प्रश्‍नों का उत्तर दिया
													गया है और समीक्षा के लिए चिन्हित किया गया है उन </b><b>प्रश्‍नों
													को केवल तभी तक उत्तर दिया गया </b><b>प्रश्‍न माना जाएगा जब
													तक अभ्यर्थी चयनित विकल्प को <img
													src="img/ins3_1.jpg" border="0" width="60"
													height="27" vspace="10" hspace="10"
													style="vertical-align: middle;"> नहीं करता है।
												</b><br>
												<br>
												<font face="Calibri, sans-serif"><span
													style="line-height: 17.12px;">13) परीक्षा की अवधि
														पूर्ण होने पर, यदि अभ्‍यर्थी उत्‍तर पर क्लिक नहीं करता है
														अथवा <img src="img/ins5_1.jpg" border="0"
														width="144" height="26" vspace="10" hspace="10"
														style="vertical-align: middle;"> बटन पर क्लिक नहीं
														करता है तो कंप्‍यूटर द्वारा स्‍वत: शून्‍य परिणाम सहेज लिया
														जाएगा ।
												</span></font><br>
												<br>14) अभ्‍यर्थी निर्धारित 1 घण्‍टा 15 मिनट ( 75 मिनट
												) के पूर्ण होने पर ही परीक्षा को submit करने में समर्थ
												होंगें। यदि अभ्‍यर्थी ने 1 घण्‍टा 15 मिनट (75 मिनट) के पूर्ण
												होने पर अपनी परीक्षा पूर्ण नहीं की तो सिस्‍टम स्‍वत: परीक्षा
												को submit कर देगा।<br>
												<br>
												<div align="center">
													<b>"शुभकामनाएँ"</b><br>
												</div>
												<br>
												<br>
												<div align="center">
													<b>PRACTICE TEST</b><br>
												</div>
												<br>
												<u><b>Disclaimer</b></u><br>
												<br>1) This is a demo for a "Computer Based
												Examination" for your practice and familiarization purpose
												only.<br>
												<br>2) The actual question paper for the examination
												consist of 100 questions to be attempted in 1 hour 15
												minutes time and this "Practice test" consist of 25
												questions to be attempted in 18 Minutes 45 Seconds.<br>
												<br>
												<u><b>About Question Paper:</b></u><br>
												<br>1) The Question Paper consists of multiple choice
												objective type questions with 4 options out of which only 1
												is correct.<br>
												<br>2) The computer based exam will be in bilingual
												i.e. English &amp; Hindi Languages. Questions and Answer
												options will appear in both the languages.<br>
												<br>3) There is a TIMER (Clock) available on the TOP
												RIGHT HAND CORNER of the Screen; you are requested to keep
												an eye on it for knowing the time remaining for the
												completion of the exam.<br>
												<br>4) Each question carry 2 marks.<br>
												<br>5) Every correct answer will get 2 marks. There
												will be a negative marking where 0.50 marks will be deducted
												for each wrong answer. No marks will be deducted for
												unanswered questions.<br>
												<br>6) Only one question will be displayed on the
												computer screen at a time. To attempt next question the
												candidates should click on <img
													src="img/ins1.jpg" border="0" width="139"
													height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> or to go back click
												on <img src="img/ins2.jpg" border="0"
													width="160" height="30" vspace="10" hspace="10"
													style="vertical-align: middle;"> button provided at
												the bottom of the screen<br>
												<br>7) The questions can be answered in any order
												within the given time frame. The candidate should click with
												the mouse on the correct choice, from 4 options given. In
												case, the candidate does not wish to attempt any question,
												it can be left blank.<br>
												<br>8) The candidate can change the option of a
												question later by selecting a new option in case he/she
												wishes to. In case candidate does not want to answer the
												question, he/she can deselect the answer by clicking <img
													src="img/ins3_1.jpg" border="0" width="60"
													height="27" vspace="10" hspace="10"
													style="vertical-align: middle;">provided against the
												question.<br>
												<br>9) To move back and forth between questions,
												candidates should use the <img
													src="img/ins1.jpg" border="0" width="139"
													height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> OR <img
													src="img/ins2.jpg" border="0" width="160"
													height="30" vspace="10" hspace="10"
													style="vertical-align: middle;"> button or click on
												the question number on the right hand side of the computer
												screen where question numbers would be displayed along with
												the `attempted` and `not attempted` status<br>
												<br>10) The answers will be saved whenever the
												candidate goes for next question, by clicking on <img
													src="img/ins1.jpg" border="0" width="139"
													height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> OR <img
													src="img/ins2.jpg" border="0" width="160"
													height="30" vspace="10" hspace="10"
													style="vertical-align: middle;"> button.<br>
												<br>11) Candidates have the option to bookmark a
												question in case they want to review it at a later stage by
												clicking on the <img src="img/ins4_1.jpg"
													border="0" width="47" height="22" vspace="10" hspace="10"
													style="vertical-align: middle;"> button available at
												the bottom of the screen. The Bookmark on a particular
												question can be removed by clicking on <img
													src="img/ins6_1.jpg" border="0" width="71"
													height="24" vspace="10" hspace="10"
													style="vertical-align: middle;"><br>
												<br>12) The question palette at the right of the screen
												shows the following status of each of the questions numbered<br>
												<br>
												<img src="img/ins_c1.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;">You have answered the
												question<br>
												<img src="img/ins_c2.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> You have not
												answered the question and marked for review<br>
												<img src="img/ins_c3.jpg" border="0"
													width="32" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> You have answered
												the question but marked for review<br>
												<img src="img/ins_c4.jpg" border="0"
													width="31" height="29" vspace="10" hspace="10"
													style="vertical-align: middle;"> You have not
												answered the question<br>
												<br>
												<b>PS: Questions which are attempted and marked for
													review would be treated as attempted questions only as long
													as the candidate does not <img
													src="img/ins3_1.jpg" border="0" width="60"
													height="27" vspace="10" hspace="10"
													style="vertical-align: middle;">the option selected.
												</b><br>
												<br>13) On the completion of the test duration, even if
												the candidate does not click on an answer or does not click
												on the <img src="img/ins5_1.jpg" border="0"
													width="144" height="26" vspace="10" hspace="10"
													style="vertical-align: middle;"> button, a NIL result
												will be saved automatically by the computer.<br>
												<br>14) The candidate will only be able to submit the
												test on completion of the stipulated 1 hour 15 minutes (75
												Minutes). In case a candidate not completed his/her test at
												the completion of stipulated 1 hour 15 minutes (75 Minutes),
												the system shall automatically submit the test.<br>
												<br>
												<div align="center">
													<b>"ALL THE BEST"</b><br>
												</div>
												<br>
												<br>































											</div>




										</div>
									</div>
								</div>
								<div class="button_container_common">
									<input class="green_button" id="sub_form" type="button"
										value="I have read the Instructions - मैंने अनुदेशों को पढ़ लिया है"
										name="sub_form" onclick="javascript:submitForm();"> <br>
									<span id="submitstatus" class="errormsg"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Timer Alert -->
			<div id="styled_popup"
				style="cursor: hand; width: 350px; height: 78px; display: none; position: absolute; z-index: 100; top: -4px; left: -3px;"
				name="styled_popup">
				<table width="100%" height="75" border="0" cellpadding="0"
					cellspacing="0" onclick="javascript:styledPopupClose()">
					<tbody>
						<tr>
							<td bgcolor="#000000"><table width="100%" height="78"
									border="0" cellpadding="5" cellspacing="1">
									<tbody>
										<tr>
											<td align="center" bgcolor="#014A7F"
												class="ColumnHeader1 style3">TIME ALERT</td>
										</tr>
										<tr>
											<td colspan="2" align="center" class="CellTextDark"><span
												class="style4"><font
													face="Arial, Helvetica, sans-serif">You have spent
														much time for reading Instructions/Sample test and will be
														redirected to the Main exam in 5 Mins</font></span><br> <br> <input
												name="button" type="button" class="button"
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
	</div>


</body>
</html>