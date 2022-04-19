<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/test-main.css">
<title>Assessment Examination Center</title>
</head>
<body>
	<div class="heading"></div>

	<div class="admin-container">

		<h3>Welcome Admin</h3>
		<form method="post" action="updateTest.html">
			<table class="t-d">
				<tr>
					<th style="width: 15%">Test ID</th>
					<th>Name of the test</th>
					<th>Total Sections</th>
					<th>Total Marks</th>
					<th>Duration</th>
					<th>Save</th>
				</tr>
				<tr>
					<td>1<input type="hidden" name="testid" value="${test.id}"></td>
					<td><input type="text" name="name" value='${test.name}'></td>
					<td><input type="text" name="totalSections"
						value="${test.totalSections}"></td>
					<td><input type="text" name="totalMarks"
						value="${test.totalMarks}"></td>
					<td><input type="text" name="duration"
						value="${test.duration}"></td>
					<td><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>
		<p></p>
		<c:if test="${not empty test.sections}">
			<h4>Sections</h4>
			<c:forEach items="${test.sections}" var="section">
				<form method="post" action="updateSection.html">
					<input type="hidden" name="testid" value="${test.id}"> <input
						type="hidden" name="sectionid" value="${section.id}">
					<table class="t-section">
						<tr>
							<th style="width: 15%;"></th>
							<th>Name of Section</th>
							<th>Total Questions</th>
							<th>Total Marks</th>
							<th>Duration</th>
							<th>Edit/Save</th>
						</tr>


						<tr>
							<td><a href="showQuestionList.html?sectionId=${section.id}">See
									Questions</a></td>
							<td><input type="text" name="name" value='${section.name}'></td>
							<td><input type="text" name="totalQuestions"
								value="${section.totalQuestions}"></td>
							<td><input type="text" name="totalMarks"
								value="${section.totalMarks}"></td>
							<td><input type="text" name="duration"
								value="${section.duration}"></td>
							<td><input type="submit" Value="Save"></td>
						</tr>


					</table>
				</form>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>