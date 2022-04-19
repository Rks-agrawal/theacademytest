<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sam_quest_left_container">
	<div class="sam_quest_heading_bg">
		<h1>Text Size</h1>
		<div class="sam_quest_heading_ft_div">
			<img style="cursor: hand" onclick="changeQPFontSize(&#39;0&#39;);"
				src="img/A-.png" title="Decrease Font" width="26" height="26"
				id="id19532668227092786"> <img style="cursor: hand"
				onclick="changeQPFontSize(&#39;1&#39;);" src="img/A+.png"
				title="Increase Font" width="26" height="26" id="id435011048530082">
		</div>
	</div>
	<div class="sam_group">
		<div class="sam_quest_text_container" id="q0" style="display: block;">
			<h1>
				<b></b>
			</h1>
			<input type="hidden" name="question_id[0]" value="6">
			<div id="mark">
				(Mark : <span>2.00)&nbsp;(Negative Mark/s - 0.50)</span>
			</div>
			<div class="sam_quest_text_inner_container"
				id="sam_quest_text_inner_container">
				<input type="hidden" id="questionId" value="${question.id}" /> <input
					type="hidden" id="questionNo" value="${question.questionno}" /> <span
					id="samp_quest_div_quest_no">Q${question.questionno}. </span>
				<c:if
					test="${question.type eq 'General' or question.type eq 'Equations'}">
					<div id="samp_quest_div_quest_text" class="sam_quest_wid">
						<p class="greybluetextquestion">
							<span id="qtextEN6" style="display: inline;">${question.question}<br>
								<c:if test="${not empty question.qHindi}">
									<br>${question.qHindi}<br>
								</c:if> <c:if test="${not empty question.paragraph}">
									<br>
								${question.paragraph}</c:if>
								<c:if test="${not empty question.pHindi}">
									<br>
								${question.pHindi}</c:if>
							</span>
						</p>
					</div>
				</c:if>
				<c:if test="${question.type eq 'Graph'}">
					<div id="samp_quest_div_quest_text" class="sam_quest_wid">
						<p class="greybluetextquestion">
							<span id="qtextEN6" style="display: inline;"><c:if
									test="${not empty question.paragraph}">${question.paragraph}<br>
								</c:if> 
								<c:if test="${not empty question.pHindi}">
									<br>
								${question.pHindi}</c:if>
								<div style="overflow: auto;">
									<img src="question/${question.filepath}" border="0" vspace="10"
										hspace="10" style="vertical-align: middle;">
								</div> <c:if test="${not empty question.question}">
									<br>${question.question}<br>
								</c:if> <c:if test="${not empty question.qHindi}">
									<br>${question.qHindi}<br>
								</c:if> </span>
						</p>
					</div>
				</c:if>
				<c:if test="${question.type eq 'Passage'}">
					<div id="samp_quest_div_quest_text" class="sam_quest_wid">
						<p class="greybluetextquestion">
							<span id="qtextEN6" style="display: inline;"><c:if
									test="${not empty question.paragraph}">${question.paragraph}<br>
									<br>
								</c:if> <c:if test="${not empty question.pHindi}">${question.pHindi}<br>
									<br>
									<br>
								</c:if> <c:if test="${not empty question.question}">${question.question}<br>
								</c:if> <c:if test="${not empty question.qHindi}">
									<br>${question.qHindi}<br>
								</c:if> </span>
						</p>
					</div>
				</c:if>

				<div class="sam_ans_text_container">
					<ul>
						<c:forEach items="${question.options}" var="option" varStatus="op">
							<c:if
								test="${(not empty option.value) or (not empty option.valueHindi) or (not empty option.filepath)}">
								<li class="greybluetextans"><input type="radio" id="option"
									name="option" value="${option.key}"
									<c:if test= "${question.optionMarked == option.key }"> checked </c:if>>${op.index+1})
									<label onclick="javascript:changeChecked(0)" dir="ltr"><span
										id="qopt1EN6" style="display: inline;"> <c:if
												test="${not empty option.value}">${option.value}<br>
											</c:if> <c:if test="${not empty option.valueHindi}">
												<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${option.valueHindi} </c:if>
											<c:if test="${not empty option.filepath}">

												<img src="question/${option.filepath}" border="0"
													vspace="10" hspace="10" style="vertical-align: middle;">
											</c:if>
									</span></label></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>



		<input type="hidden" name="question_count" id="question_count"
			value="25">

	</div>

</div>

<div class="sam_quest_right_bottom_container" id="preview_div"
	style="visibility: visible; display: block;">
	<div id="sam-que-att">
		<h1 style="padding-top: 12px;">
			<b>Number of Questions</b>
		</h1>
		<div id="que-scroll">
			<div id="qnodetails">

				<c:forEach items="${section.answers}" var="answer">
					<a id="q_disp_${answer.questionId}"
						title="Click to view Q${answer.questionno}" href="#"
						class="${answer.qStatus}"
						onclick="getQuestion(${answer.questionId})"><span>Q${answer.questionno}</span></a>
				</c:forEach>
			</div>
		</div>
		<div class="clear"></div>
		<div class="attempt_container">

			<div class="sam_attempt" id="no_attempt">${section.answered}</div>
			<div class="sam_attempt_txt">Attempted</div>

			<div class="sam_tag" id="no_tagged">${section.marked}</div>
			<div class="sam_tag_text">Tagged</div>

			<div class="sam_ans_tag" id="no_ans_tagged">${section.answeredAndMarked}</div>
			<div class="sam_ans_tag_text">
				Attempted <br> &amp; Tagged
			</div>

			<div class="sam_unattempt" id="no_unattempt">${section.notVisited + section.notAnswered}</div>
			<div class="sam_unattempt_text">Unattempted</div>

		</div>
	</div>
</div>