<div class="top-head">
	<div class="heading"></div>
	<div class="instruction">
		<a href="#" style="text-decoration: none; color: white;"
			onclick="showModule('instructionModal')" title="See Instructions">
			<div style="float: right; margin-top: 5px; padding-right: 20px;">
				<span class="instruction_icon"> </span>Instructions
			</div>
		</a>
	</div>
</div>
<input type="hidden" id="expandCollapse">
<div class="container">
	<div style="width: 100%; height: 19%;">
	<div class="leftSection">
		<div class="test-topic">
			<c:forEach items="${test.sections}" var="section">
				<button class="test-topic-title" onclick="getSection(${section.id})">
					<div style="text-align: center;">${section.name}
						<div class="subject_instruction_icon1"></div>
					</div>
				</button>
			</c:forEach>
		</div>
		<div class="section-header">
			<input type="hidden" id="totalSection" value="${test.totalSections}">
			<div class="section">Section:</div>
			<div class="timer">
				<b>Time Left: <span id="timer"></span>
				</b>
			</div>
		</div>
		<div class="section-selection">
			<div class="active-topic">
				<div style="margin-top: 7px;">${section.name}
					<div class="subject_instruction_icon1" id="icon0"></div>
				</div>
			</div>
			<input type="hidden" id="lastQuestion" value="${lastQuestion}">
		</div>

	</div>
	<div class="rightSection">
		<form id="quiztest" method="post" action="submitTest.html">
			<input type="hidden" id="userId" name="userId" value="${user.id}" />
		</form>
		<div class="profile">
			<form id="sectionform" method="post" action="nextSection.html">
				<div style="width: 40%; float: left;">
					<img src="img/profile.png">
				</div>
				<div style="float: left; width: 60%;">
					<input type="hidden" id="timeleft" name="timeleft"
						value="${section.duration}"> <input type="hidden"
						id="userId" name="userId" value="${user.id}" /> <input
						type="hidden" id="sectionId" name="sectionId"
						value="${section.id}" /> <input type="hidden" id="language"
						value="${user.defaultLanguage}">
					<p>
						<strong>${user.firstName } ${user.lastName }</strong>
					</p>
					<a href="#" onclick="showModule('profileModal')"
						title="See Profile">profile</a>

				</div>
			</form>
		</div>
		<br>

	</div>
	</div>
	<div class="qstn-box" id="questionBox">
		<%@ include file="questionBox.jsp"%>
	</div>



</div>
<div class="action-section">
	<div class="button-box">
		<input type="button" class="btn-mark" value="Mark for Review & Next"
			id="markAndReview" onclick="markAndReview()"> <input
			type="button" class="btn-clear" value="Clear Response"
			id="clearResponse" onclick="clearResponse()"> <input
			type="button" class="btn-save-next nxt-question" value="Save & Next"
			id="saveAndNext" onclick="saveAndNext()"> <input
			type="button" onclick="getNextSection()"
			class="btn-save-next next-section" value="Next Section"
			id="nextSection">

	</div>
	<div class="submit-box">
		<center>
			<input type="button" class="btn-submit" value="Submit" disabled
				onclick="submitTest()">
		</center>
	</div>
</div>
<div id="popupModal"></div>