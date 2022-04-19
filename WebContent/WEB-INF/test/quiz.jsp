<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/test.js"></script>
<title>Assessment Examination Center</title>
</head>
<body id="body" oncontextmenu="return false">
	<div id="wrapper">
		<div id="header_container">
			<div id="header_container_inner">

				<div id="header_sify_logo">
					<table width="850px" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="25%" align="left"></td>
								<td width="50%" align="center"><img src="img/sify_logo.png"
									width="250" height="45" id="id938159477211703"></td>
								<td width="25%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="quizBody">
		<%@ include file="quizbody.jsp"%>
		</div>
	</div>
	<div id="popupModal" style="display: none;">
		<%@ include file="previewSubmitModal.jsp"%>
	</div>
</body>
</html>