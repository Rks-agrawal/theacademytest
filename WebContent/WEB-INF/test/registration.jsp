<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<title>Assessment Examination Center</title>
</head>
<body>
	<div class="top-head">
		<div class="heading"></div>
	</div>
	<div class ="r-form" align="center">
		<div class="r-form-header" id="registerPageHeader">Register your
			details</div>
		<form method="post" name="registerForm" action="registerUser.html">
			<table>
			<tr><td></td></tr>
				<tr>
					<td>First Name </td>
					<td><input type="text" name="firstName"></td>
				</tr>
				<tr>
					<td>Last Name :</td>
					<td><input type="text" name="lastName"></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="emailID"></td>
				</tr>
				<tr>
					<td>Date of Birth :</td>
					<td><input type="date" name="dob"></td>
				</tr>
				<tr>
					<td>Mobile :</td>
					<td><input type="number" name="mobileNo"></td>
				</tr>
				<tr>
					<td>Gender :</td>
					<td><input type="radio" name="gender" value="M">Male
						&nbsp; <input type="radio" name="gender" value="F">Female</td>
		</tr>
		<tr><td></td></tr>
		</table><p></p>
		<input class="btn-primary-blue reg" type="submit" value="Register"> <p></p>
	</form>
	</div>
</body>
</html>