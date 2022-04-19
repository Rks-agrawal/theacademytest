<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="leftSection" style="height: 100%;">
	<div class="qstn-type">
		<div style="margin-top: 5px;"><strong>Question Type : Multiple Choice Question</strong></div>
	</div>
	<div id="e-collapse" style="height: 93%;">
	<div class="view-in">
		<div style="float: right; margin-top: 5px;">
			View in: <select id="questionlanguage" onchange="changeLanguage();"
				style="width: 150px; height: 25px; margin-top: 2px; margin-right: 10px;">
				<option value="english">English</option>
				<option value="hindi">Hindi</option>
			</select>
		</div>
	</div>
	<div class="expand_icon" onclick="collapse()" style="display: none;"></div>
	<div class="q-no">
		<input type="hidden" id="questionId" value="${question.id}" /> <input
			type="hidden" id="questionNo" value="${question.questionno}" /> <b>Question
			No. ${question.questionno}</b>
	</div>
	<c:if test="${question.type eq 'General' or question.type eq 'Equations'}">
		<div>
			<div class="qstn english">${question.question}</div>
			<div class="qstn hindi">${question.qHindi}</div>
			<c:if test="${question.type eq 'Equations'}">
				<div style="margin-left: 40px; float: left; width: 100%;">
					<img src="img/qstn/${question.filepath}" />
				</div>
			</c:if>
			<div class="options">
				<c:forEach items="${question.options}" var="option" varStatus="op">
					<p>
						<b>${op.index+1})</b> <input type="radio" id="option"
							name="option" value="${option.key}"
							<c:if test= "${question.optionMarked == option.key }"> checked </c:if> />
						<span class="english">${option.value}</span><span class="hindi">${option.valueHindi}</span>
					</p>
				</c:forEach>
			</div>
		</div>
	</c:if>

	<c:if test="${question.type eq 'Graph' or question.type eq 'Passage'}">
		<div id="qstn-english" class="qstn-details">
			<div class="qstn english">${question.question}</div>
			<div class="qstn hindi">${question.qHindi}</div>
			
			<div class="options">
				<c:forEach items="${question.options}" var="option" varStatus="op">
					<p>
						<b>${op.index+1})</b> <input type="radio" id="option"
							name="option" value="${option.key}"
							<c:if test= "${question.optionMarked == option.key }"> checked </c:if> />
						<span class="english">${option.value}</span><span class="hindi">${option.valueHindi}</span>
					</p>
				</c:forEach>
			</div>

		</div>

		<div class="optionhelper">
			<c:if test="${question.type eq 'Graph'}">
				<div class="graph-direction">${question.paragraph}</div>
				<p></p>
				<img src="img/qstn/${question.filepath}" style="float: left;" />
			</c:if>
			<c:if test="${question.type eq 'Passage'}">
				<b>Read the passage carefully :</b>
				<div class="passage">
					
					<p></p>
					<div class="english">${question.paragraph}</div>
					<div class="hindi">${question.pHindi}</div>
				</div>
			</c:if>
		</div>
	</c:if>
	</div>
</div>

<div class="right-rail rightSection">
<span onclick="expand()" class="collapse_icon"></span>
	<div class="q-details">
		<table>
			<tr>
				<td class="t-answered">${section.answered}</td>
				<td>Answered</td>
				<td class="t-not-answered">${section.notAnswered}</td>
				<td>Not Answered</td>
			</tr>
			<tr>
				<td class="t-not-visited">${section.notVisited}</td>
				<td>Not Visited</td>
				<td class="t-marked">${section.marked}</td>
				<td>Marked for Review</td>
			</tr>
			<tr>
				<td class="t-marked-answered">${section.answeredAndMarked}</td>
				<td colspan="3">Answered & Marked for Review</td>
			</tr>
		</table>
	</div>
	<div class="topic-header">${section.name}</div>
	<div style="padding-left: 12px; background-color: white;">Choose
		a question.</div>
	<div style="overflow: auto; height: 69%;">
		<table class="tab-qstns">
			<%
				int i = 0;
			%>
			<c:forEach items="${section.answers}" var="answer">
				<%
					if (i++ % 4 == 0) {
				%>
				<tr>
					<%
						}
					%>
					<td class="${answer.qStatus }"
						onMouseOver="this.style.cursor='pointer'"
						onclick="getQuestion(${answer.questionId})">${answer.questionno }</td>
					<%
						if (i % 4 == 0) {
					%>
				</tr>
				<%
					}
				%>
			</c:forEach>

		</table>
	</div>
</div>