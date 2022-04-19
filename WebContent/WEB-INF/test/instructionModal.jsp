	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="TB_overlay" class="TB_overlayBG"></div>
	<div id="TB_window" hidden="hidden"
	style="margin-left: -460px; width: 520px; display: block;">
	<div id="TB_ajaxContent" class="TB_modal"
		style="width: 900px; height: -5px;">
		<div class="portlet_topper">
			<div class="popupheader sysInstruLabel">Instructions</div>
			<div class="arrowplace">
				<a href="#" onclick="tb_remove();removeActiveLinks()">Close X</a>
			</div>
		</div>
		
		<center><span><b><font size="4em" color="#2F72B7" class="sysInstruLabel">Instructions</font></b></span></center>
		<div class="popup_content">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style= "font-size: 12px;border-collapse: separate;">
				<tbody>
					<tr>
						<td valign="top">
						<div id="commonPageInstruction">
			<div
				style="overflow: hidden; border: 1px solid rgb(204, 204, 204); padding: 2px; height: 496px;"
				id="firstPage">
				<span style="float: right;"><span class="viewIn">View
						in :</span><select
					onchange="changeSysInst(this.value,'sysInstText','cusInstText')"
					id="basInst"><option value="sysInstText1">English</option>
						<option value="sysInstText2">Hindi</option></select></span> <br> <br>
				<div style="height: 93%; width: 100%; overflow: auto;" id="insEng"
					class="sysInstText1">
					<center>
						<span><b>Please read the instructions carefully</b></span>
					</center>
					<p></p>
					<p>
						<strong><u>General Instructions:</u></strong>
					</p>
					<p></p>
					<ol
						style="TEXT-ALIGN: left; LIST-STYLE-TYPE: decimal; PADDING-LEFT: 4%; PADDING-TOP: 5px">
						<li>Total duration of examination is <strong><span
								class="completeDuration">2</span> </strong>Hours.
						</li>
						<li>The clock will be set at the server. The countdown timer
							in the top right corner of screen will display the remaining time
							available for you to complete the examination. When the timer
							reaches zero, the examination will end by itself. You will not be
							required to end or submit your examination.</li>
						<li>The Question Palette displayed on the right side of
							screen will show the status of each question using one of the
							following symbols:
							<table style="FONT-SIZE: 100%" class="instruction_area">
								<tbody>
									<tr>
										<td><span title="Not Visited" class="m-not-visited">1</span></td>
										<td>You have not visited the question yet.</td>
									</tr>
									<tr>
										<td><span title="Not Answered" class="m-not-answered">3</span></td>
										<td>You have not answered the question.</td>
									</tr>
									<tr>
										<td><span title="Answered" class="m-answered">5</span></td>
										<td>You have answered the question.</td>
									</tr>
									<tr>
										<td><span title="Not Answered &amp; Mark for Review"
											class="m-marked">7</span></td>
										<td>You have NOT answered the question, but have marked
											the question for review.</td>
									</tr>
									<tr>
										<td><span title="Answered &amp; Mark for Review"
											class="m-marked-answered">9</span></td>
										<td>You have answered the question, but marked it for
											review.</td>
									</tr>
								</tbody>
							</table> The Marked for Review status for a question simply indicates
							that you would like to look at that question again.<span
							style="color: #ff0000;"> If a question is answered and
								Marked for Review, your answer for that question will be
								considered in the evaluation.</span>
						</li>
						<li>You can click on the "&gt;" arrow which appears to the
							left of question palette to collapse the question palette thereby
							maximizing the question window. To view the question palette
							again, you can click on "&lt;" which appears on the right side of
							question window.</li>
					</ol>
					<p>
						<br> <b><u>Navigating to a Question : </u></b>
					</p>
					<ol
						style="TEXT-ALIGN: left; LIST-STYLE-TYPE: decimal; PADDING-LEFT: 4%; PADDING-TOP: 5px"
						start="5">
						<li>To answer a question, do the following:
							<ol type="a"
								style="TEXT-ALIGN: left; PADDING-LEFT: 4%; PADDING-TOP: 3px">
								<li>Click on the question number in the Question Palette at
									the right of your screen to go to that numbered question
									directly. Note that using this option does NOT save your answer
									to the current question.</li>
								<li>Click on <strong>Save &amp;Next</strong> to save your
									answer for the current question and then go to the next
									question.
								</li>
								<li>Click on <strong>Mark for Review &amp; Next </strong>to
									save your answer for the current question, mark it for review,
									and then go to the next question.
								</li>
							</ol>
						</li>
					</ol>
					<p>
						<br> <b><u>Answering a Question : </u></b>
					</p>
					<ol
						style="TEXT-ALIGN: left; LIST-STYLE-TYPE: decimal; PADDING-LEFT: 4%; PADDING-TOP: 5px"
						start="6">
						<li>Procedure for answering a multiple choice type question:
							<ol type="a"
								style="TEXT-ALIGN: left; PADDING-LEFT: 4%; PADDING-TOP: 5px">
								<li>To select your answer, click on the button of one of
									the options</li>
								<li>To deselect your chosen answer, click on the button of
									the chosen option again or click on the <b>Clear Response</b>
									button
								</li>
								<li>To change your chosen answer, click on the button of
									another option</li>
								<li>To save your answer, you MUST click on the <b>Save
										&amp; Next</b> button
								</li>
								<li>To mark the question for review, click on the <b>Mark
										for Review &amp; Next</b> button.If an answer is selected for a
									question that is Marked for Review, that answer will be
									considered in the evaluation.
								</li>
							</ol>
						</li>
						<li>To change your answer to a question that has already been
							answered, first select that question for answering and then
							follow the procedure for answering that type of question.</li>
						<li>Note that ONLY Questions for which answers are saved or
							marked for review after answering will be considered for
							evaluation.</li>
					</ol>
					<p>
						<br> <b><u>Navigating through sections: </u></b>
					</p>
					<ol
						style="TEXT-ALIGN: left; LIST-STYLE-TYPE: decimal; PADDING-LEFT: 4%; PADDING-TOP: 5px"
						start="9">
						<li>Sections in this question paper are displayed on the top
							bar of the screen. Questions in a section can be viewed by
							clicking on the section name. The section you are currently
							viewing is highlighted.</li>
						<li>After clicking the Save &amp; Next button on the last
							question for a section, you will automatically be taken to the
							first question of the next section.</li>
						<li>You can shuffle between tests and questions anytime
							during the examination as per your convenience only during the
							time stipulated.</li>
						<li>Candidate can view the corresponding section summary as
							part of the legend that appears in every section above the
							question palette.</li>
					</ol>
				</div>
				<div id="insHindi"
					style="display: none; height: 93%; width: 100%; overflow: auto"
					class="sysInstText2">
					<div>
						<h5>
							<font size="4">कृपया निम्नलिखित निर्देशों को ध्यान से
								पढ़ें </font><br> <br> <b><u>सामान्य अनुदेश</u></b>
						</h5>
					</div>
					<div>
						<ol
							style="text-align: left; list-style-type: decimal; padding-left: 4%; padding-top: 5px">
							<li>सभी प्रश्नों को हल करने के लिए आपको <strong>2
							</strong>घंटे का समय दिया जाएगा।
							</li>
							<li>सर्वर पर घड़ी लगाई गई है तथा आपकी स्क्रीन के दाहिने कोने
								में शीर्ष पर काउंटडाउन टाइमर में आपके लिए परीक्षा समाप्त करने के
								लिए शेष समय प्रदर्शित होगा। परीक्षा समय समाप्त होने पर, आपको
								अपनी परीक्षा बंद या जमा करने की जरूरत नहीं है । यह स्वतः बंद या
								जमा हो जाएगी।</li>
							<li>स्क्रीन के दाहिने कोने पर प्रश्न पैलेट, प्रत्येक प्रश्न
								के लिए निम्न में से कोई एक स्थिति प्रकट करता है:<br>
								<table style="font-size: 100%" class="instruction_area">
									<tbody>
										<tr>
											<td><span title="Not Visited" class="m-not-visited">1</span></td>
											<td>आप अभी तक प्रश्न पर नहीं गए हैं।</td>
										</tr>
										<tr>
											<td><span title="Not Answered" class="m-not-answered">3</span></td>
											<td>आपने प्रश्न का उत्तर नहीं दिया है।</td>
										</tr>
										<tr>
											<td><span title="Answered" class="m-answered">5</span></td>
											<td>आप प्रश्न का उत्तर दे चुके हैं।</td>
										</tr>
										<tr>
											<td><span
												title="Not Answered &lt;br&gt; &lt;br&gt; &amp; Mark for Review"
												class="m-marked">7</span></td>
											<td>आपने प्रश्न का उत्तर नहीं दिया है पर प्रश्न को
												पुनर्विचार के लिए चिन्हित किया है।</td>
										</tr>
										<tr>
											<td><span title="Answered &amp; Mark for Review"
												class="m-marked-answered">9</span></td>
											<td>आप प्रश्न का उत्तर दे चुकें हैं पर प्रश्न को
												पुनर्विचार के लिए चिन्हित किया है।</td>
										</tr>
									</tbody>
								</table>
							</li>
						</ol>
					</div>
					<p>
						पुनर्विचार के लिए चिह्नित (<strong>Marked for Review</strong>)
						स्थिति सामान्यतः अनुस्मारक के रूप में कार्य करती है जिसे आपने
						प्रश्न को दुबारा देखने के लिए सेट किया है। <span
							style="color: rgb(255, 0, 0)"><em>यदि आपने किसी
								प्रश्न के लिए उत्तर चुना है जिसे पुनर्विचार के लिए चिह्नित किया
								है, तब मूल्यांकन में उस उत्तर पर विचार किया जाएगा।</em></span>
					</p>
					<ol
						style="text-align: left; list-style-type: decimal; padding-left: 4%; padding-top: 5px"
						start="4">
						<li>आप प्रश्न पैलेट को छुपाने के लिए, "&gt;" चिन्ह पर क्लिक
							कर सकते है, जो प्रश्न पैलेट के बाईं ओर दिखाई देता है, जिससे
							प्रश्न विंडो सामने आ जाएगा. प्रश्न पैलेट को फिर से देखने के लिए,
							"&lt;" चिन्ह पर क्लिक कीजिए जो प्रश्न विंडो के दाईं ओर दिखाई देता
							है।</li>
					</ol>
					<p>
						<br> <b>किसी प्रश्न पर जाना : </b>
					</p>
					<ol
						style="text-align: left; list-style-type: decimal; padding-left: 4%; padding-top: 5px"
						start="5">
						<li>उत्तर देने हेतु कोई प्रश्न चुनने के लिए, आप निम्न में से
							कोई एक कार्य कर सकते हैं:
							<ol type="a"
								style="text-align: left; padding-left: 4%; padding-top: 3px">
								<li>स्क्रीन के दायीं ओर प्रश्न पैलेट में प्रश्न पर सीधे
									जाने के लिए प्रश्न संख्या पर क्लिक करें। ध्यान दें कि इस विकल्प
									का प्रयोग करने से मौजूदा प्रश्न के लिए आपका उत्तर सुरक्षित नहीं
									होता है।</li>
								<li>वर्तमान प्रश्न का उत्तर सुरक्षित करने के लिए और क्रम
									में अगले प्रश्न पर जाने के लिए <strong>Save and Next </strong>पर
									क्लिक करें।
								</li>
								<li>वर्तमान प्रश्न का उत्तर सुरक्षित करने के लिए,
									पुनर्विचार के लिए चिह्नित करने और क्रम में अगले प्रश्न पर जाने
									के लिए <strong>Mark for Review and Next </strong>पर क्लिक करें।
								</li>
							</ol>
						</li>
					</ol>
					<p>
						<b>प्रश्नों का उत्तर देना : </b>
					</p>
					<ol
						style="text-align: left; list-style-type: decimal; padding-left: 4%; padding-top: 5px"
						start="6">
						<li>बहुविकल्प प्रकार प्रश्न के लिए
							<ol type="a"
								style="text-align: left; padding-left: 4%; padding-top: 5px">
								<li>अपना उत्तर चुनने के लिए, विकल्प के बटनों में से किसी एक
									पर क्लिक करें।</li>
								<li>चयनित उत्तर को अचयनित करने के लिए, चयनित विकल्प पर
									दुबारा क्लिक करें या <strong>Clear Response </strong>बटन पर
									क्लिक करें।
								</li>
								<li>अपना उत्तर बदलने के लिए, अन्य वांछित विकल्प बटन पर
									क्लिक करें।</li>
								<li>अपना उत्तर सुरक्षित करने के लिए, आपको <strong>Save
										&amp; Next </strong>पर क्लिक करना जरूरी है।
								</li>
								<li>किसी प्रश्न को पुनर्विचार के लिए चिह्नित करने हेतु <strong>Mark
										for Review &amp; Next </strong>बटन पर क्लिक करें। <span
									style="color: rgb(255, 0, 0)">यदि किसी प्रश्न के लिए
										उत्तर चुना हो जो कि पुनर्विचार के लिए चिह्नित किया गया है, तब
										अंतिम मूल्यांकन में उस उत्तर पर विचार किया जाएगा।</span></li>
							</ol>
						</li>
					</ol>
					<ol
						style="text-align: left; list-style-type: decimal; padding-left: 4%; padding-top: 5px"
						start="7">
						<li>किसी प्रश्न का उत्तर बदलने के लिए, पहले प्रश्न का चयन
							करें, फिर नए उत्तर विकल्प पर क्लिक करने के बाद <strong>Save
								&amp; Next </strong>बटन पर क्लिक करें।
						</li>
						<li>उत्तर देने के बाद जो प्रश्न सुरक्षित हैं या पुनर्विचार के
							लिए चिह्नित हैं, सिर्फ उन पर ही मूल्यांकन के लिए विचार किया
							जाएगा।<br> <br> <strong>अनुभागों द्वारा प्रश्न
								पर जाना:</strong>
						</li>
						<li>इस प्रश्नपत्र में स्क्रीन के शीर्ष बार पर अनुभाग
							(Sections) प्रदर्शित हैं। किसी अनुभाग के प्रश्न, उस अनुभाग के नाम
							पर क्लिक करके देखे जा सकते हैं। आप वर्तमान में जिस अनुभाग का
							उत्तर दे रहे हैं, वह अनुभाग हाइलाइट होगा।</li>
						<li>किसी अनुभाग के लिए अंतिम प्रश्न के Save &amp; Next बटन पर
							क्लिक करने के बाद, आप स्वचालित रूप से अगले अनुभाग के प्रथम प्रश्न
							पर पहुंच जाएंगे।</li>
						<li>आप परीक्षा में निर्धारित समय के दौरान किसी भी समय
							प्रश्नावलियों और प्रश्नों के बीच अपनी सुविधा के अनुसार आ-जा (शफल
							कर) सकते हैं।</li>
						<li>परीक्षार्थी संबंधित सेक्शन की समीक्षा को लीजेन्ड के भाग
							के रूप में देख सकते हैं जो हर एक सेक्शन में प्रश्न पॅलेट के ऊपर
							दिखाई देता है।</li>
					</ol>
				</div>
			</div>
			<div
				style="overflow: hidden; display: none; border: 1px solid rgb(204, 204, 204); padding: 2px; height: 375px;"
				id="secondPagep1">
				<center>
					<span style="display: none" id="otherImpInstru"><b><font
							size="4em" color="#2F72B7" id="otherInstruLabel">Other
								Important Instructions</font></b></span>
				</center>
				<span style="float: right;" id="secondPageLangView"><span
					class="viewIn">View in :</span><select
					onchange="changeSysInst(this.value,'cusInstText','sysInstText')"
					id="cusInst"><option value="cusInstText1">English</option>
						<option value="cusInstText2">Hindi</option></select></span> <br> <br>
				<div style="height: 91%; width: 100%; overflow: auto;"
					class="cusInstText1">
					<p>This is a Mock test. Question Paper displayed is for
						practice purpose only. Under no circumstances should this be
						presumed as a sample paper.</p>
				</div>
				<div style="display: none; height: 91%; width: 100%; overflow: auto"
					class="cusInstText2">
					<p>This is a Mock test. Question Paper displayed is for
						practice purpose only. Under no circumstances should this be
						presumed as a sample paper.</p>
				</div>
			</div>
		</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</div>