<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/test-main.css">
<script type="text/javascript" charset="UTF-8"
	src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="js/admin.js"></script>
<title>Assessment Examination Center</title>
</head>
<body>
	<div class="heading"></div>

	<div class="admin-container">
		<h3>Topic : ${section.name}</h3>
		<p></p>

		<c:if test="${not empty section.questions}">




			<c:forEach items="${section.questions}" var="question">
				<input type="hidden" name="questionid" value="${question.id}">
				<input type="hidden" name="sectionid" value="${section.id}">
				<table class="t-section">
					<tr>
						<th style="width: 10%;">Q No.</th>
						<th>Question</th>
						<th>In Hindi</th>
						<th>Type</th>
						<th>Paragraph</th>
						<th>Paragraph_Hindi</th>
						<th>File</th>
						<th>Correct Option</th>
						<th>Marks</th>
						<th>Update</th>
					</tr>

					<tr>
						<td style="width: 10%;"><input type="text"
							style="width: 25px;" value='${question.questionno}'></td>
						<td><input type="text" id="question_${question.id}"
							value="${question.question}" style="width: 290px;"></td>
						<td><input type="text" id="qname_hindi_${question.id}"
							style="width: 250px;" value="${question.qHindi}"></td>
						<td><select id="type_${question.id}">
								<option value="General"
									<c:if test= "${question.type eq 'General'}">selected</c:if>>General</option>
								<option value="Passage"
									<c:if test= "${question.type eq 'Passage'}">selected</c:if>>Passage</option>
								<option value="Graph"
									<c:if test= "${question.type eq 'Graph'}">selected</c:if>>Graph</option>
								<option value="Equations"
									<c:if test= "${question.type eq 'Equations'}">selected</c:if>>Equations</option>
						</select></td>
						<td><textarea id="paragraph_${question.id}">${question.paragraph}</textarea></td>
						<td><textarea id="pHindi_${question.id}">${question.pHindi}</textarea></td>
						<td><input type="text" id="filename_${question.id}"
							value="${question.filepath}"></td>
						<td><input type="text" id="answer_${question.id}"
							value="${question.optionId}"></td>
						<td><input type="text" id="marks_${question.id}"
							style="width: 30px;" value="${question.marks}"></td>
						<td><input type="button"
							onclick="updateQuestion(${question.id})" value="Save"></td>
					</tr>
				</table>
				<div style="width: 60%; float: left;">
					<span>Options</span>

					<c:if test="${not empty question.options}">
						<table class="t-option">
							<tr>
								<th>Option Id</th>
								<th style="width: 40%">Option</th>
								<th style="width: 40%">In Hindi</th>
								<th>Filepath</th>
								<th>Update</th>
							</tr>
							<c:forEach items="${question.options}" var="option">
								<tr>
									<td><input type="text" value="${option.key}" readonly
										<c:if test="${option.key eq question.optionId}">style="background-color:green;color:white;"</c:if>></td>
									<td><input type="hidden" id="optionid_${option.key}"
										value="${option.key}"> <input type="text"
										id="optionValue_${option.key}" value="${option.value}"
										style="width: 250px;"></td>
									<td><input type="text" id="optionHindi_${option.key}"
										value="${option.valueHindi}" style="width: 250px;"></td>
									<td><input type="text" id="filepath_${option.key}"
										value="${option.filepath}" style="width: 150px;"></td>
									<td><input type="button"
										onclick="updateOption(${option.key})" value="Save"></td>

								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
				<div style="width: 40%; float: right; margin-top: 35px;">
					<%-- <form action="uploadFile.html" method="post"
						enctype="multipart/form-data">
						<input type="hidden" id="questionId" name="questionId" value="${question.id}">
						<input type="file" name="file" /><br/><br/> <input type="submit"
							value="Upload File" />
					</form> --%>
				</div>
				<p></p>

			</c:forEach>
		</c:if>
	</div>
</body>
</html>