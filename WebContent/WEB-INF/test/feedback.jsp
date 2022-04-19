<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feed Back - Assessment Examination Center</title>
<link rel="stylesheet" type="text/css" href="feedback/keyboard.css">
<link rel="stylesheet" type="text/css" href="feedback/mock_style.css">
<link rel="stylesheet" type="text/css" href="feedback/style.css">
</head>
<body onselectstart="return false;" ondrag="return false;">

	<div class="confrmPopup" id="FeedbackSubmitPopup" style="display: none">
		<div class="cnfPopHdr">
			<div class="cnfPopHdrLbl info">Info</div>
			<a href="javascript:void(0)" class="fRight popCloseSubmit"
				onclick="feedbackSubmit()">Close</a>
			<div class="float-clear"></div>
		</div>
		<div class="cnfPopBdy">
			<img src="./Feed Back - Assessment Examination Center_files/info.gif"
				style="vertical-align: middle; margin-right: 10px;"
				class="info-icon"><span id="feedbackSubmitMsg"
				class="info-lbl"></span>
		</div>
		<div class="cnfPopBtnPnl">
			<a href="javascript:void(0)" class="greenBtn"
				onclick="feedbackSubmit()">Ok</a>
		</div>
	</div>
	<div id="container" style="height: 657px;">
		<div id="pWait"
			style="height: 100%; width: 100%; z-index: 1999; position: absolute; opacity: 0.85; display: none; background: grey;">
			<div style="top: 45%; position: relative; color: white">
				<center>
					<img
						src="./Feed Back - Assessment Examination Center_files/busy4.gif"
						style="padding: &amp;amp; #39; 32 px 0 0 36px&amp;amp; #39; , width: &amp;amp; #39; 320 px &amp;amp; #39; , height: &amp;amp; #39; 110 px &amp;amp; #39; , margin: &amp;amp; #39; 0 0 0 10% display: block;"><br>
				</center>
			</div>
		</div>

		<!--header starts-->
		<div id="header">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr>
						<td align="left" id="bannerImage">
							<div id="bannerImg" style="float: left"></div>
							<div id="bannerText" align="center"
								style="margin-top: 10px; font-weight: bold;">
								<font size="4" color="#ffffff"></font>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="mainleft" style="width: 79%; height: 598px;">
			<div class="titlepath" id="feedBackHeader">Candidate Feedback
				Form</div>

			<form action="submitFeedback.html" method="post">
				<input type="hidden" name="userid" value="${user.id}">
				<div class="instructdiv" id="instructdiv" style="height: 508px;">
					<div id="solutionInst">
						<span id="feedbackText">Dear Candidate,<br>We solicit
							your valuable feedback to understand your views and your
							experience on the digital examination.<br>Your feedback will
							enable us to improve the overall candidate experience.
						</span>

						<div class="ratingDiv">




							<div class="displayInline borderRight"
								style="border-right: none;">
								<span class="roundbg greenBg">4</span> <span
									class="displayInline exceedExpect">Exceeded expectations</span>
							</div>
							<div class="displayInline borderRight">
								<span class="roundbg yellowBg">3</span> <span
									class="displayInline metExpect">Met expectations</span>
							</div>
							<div class="displayInline borderRight">
								<span class="roundbg blueBg">2</span> <span
									class="displayInline needImprove">Improvement needed</span>
							</div>
							<div class="displayInline borderRight">
								<span class="roundbg redBg ">1</span> <span
									class="displayInline failedExpect">Failed to meet
									expectations</span>
							</div>


							<div class="clear"></div>
						</div>
						<div class="default">
							<table class="feedback_table" id="feedbackTableDiv">

								<thead>
									<tr>
										<th class="textCenter" id="header1">S.No</th>
										<th style="width: 1%;"></th>
										<th id="header2">Questions</th>
										<th id="header3">Response</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="textCenter fontBold">1.</td>
										<td></td>
										<td id="ques1">How was your experience with the exam
											support provided including usefulness of the mock test,
											access to exam related information, helpline support, etc?</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques1"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques1"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques1"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques1"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="textCenter fontBold">2.</td>
										<td></td>
										<td id="ques2">How was your experience in giving a
											digital exam on aspects such as navigating on the candidate
											console, ease of using the candidate console, etc?</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques2"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques2"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques2"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques2"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="textCenter fontBold">3.</td>
										<td></td>
										<td id="ques3">How was your experience as to the
											following aspects of the test-center:</td>
										<td>
											<!--<table class="radioTable">
                                               <tr>
                                                    <td class="fontBold">4</td>
                                                    <td class="fontBold">3</td>
                                                    <td class="fontBold">2</td>
                                                    <td class="fontBold">1</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="radio" name="ques3" value="4-Exceeded expectations"/></td>
                                                    <td><input type="radio" name="ques3" value="3-Met expectations"/></td>
                                                    <td><input type="radio" name="ques3" value="2-Improvement needed"/></td>
                                                    <td><input type="radio" name="ques3" value="1-Failed to meet expectations"/></td>

                                                </tr>
                                            </table>-->
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="textCenter fontBold">3.1</td>
										<td id="ques31">Ease of Locating the Test Center.</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques31"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques31"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques31"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques31"
															value="1-Failed to meet expectations"></td>


													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="textCenter fontBold">3.2</td>
										<td id="ques32">Ease of finding your designated exam seat
											through clear notice board instructions, directional arrows,
											staff guidance, etc.</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques32"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques32"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques32"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques32"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="textCenter fontBold">3.3</td>
										<td id="ques33">Seating arrangement</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques33"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques33"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques33"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques33"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="textCenter fontBold">3.4</td>
										<td id="ques34">Availability of basic facilities like
											water dispenser, rest rooms, etc.</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques34"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques34"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques34"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques34"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									<tr>
										<td></td>
										<td class="textCenter fontBold">3.5</td>
										<td id="ques35">Exam node/ desktop quality</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques35"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques35"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques35"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques35"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="textCenter fontBold">3.6</td>
										<td id="ques36">Behavior of staff, their knowledge and
											competency of conducting the exam.</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td class="fontBold">4</td>
														<td class="fontBold">3</td>
														<td class="fontBold">2</td>
														<td class="fontBold">1</td>
													</tr>
													<tr>
														<td><input type="radio" name="ques36"
															value="4-Exceeded expectations"></td>
														<td><input type="radio" name="ques36"
															value="3-Met expectations" checked="checked"></td>
														<td><input type="radio" name="ques36"
															value="2-Improvement needed"></td>
														<td><input type="radio" name="ques36"
															value="1-Failed to meet expectations"></td>

													</tr>
												</tbody>
											</table>
										</td>
									</tr>


									<tr>
										<td class="textCenter fontBold">4.</td>
										<td></td>
										<td id="ques4">How was your overall experience of taking
											up a digital exam?</td>
										<td>
											<table class="radioTable">
												<tbody>
													<tr>
														<td><textarea id="feedbackTextArea"
																name="overallFeedback"
																style="height: 50px; width: 95%; resize: none; overflow: auto;"></textarea></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="configurableDiv"></div>

					<div class="btnsection" align="center">
						<!--                        <a id="previousbtn" class="btn btn-primary" href="#">
                            <span>
                                <strong>
                                    <img id="backwordImage" width="25" height="25" src="images/Backword-25.png">
                                        Previous
                                </strong>
                            </span>
                        </a>-->
						<button class="btn btn-primary btn-primary-blue" type="submit"
							style="text-align: center" id="submitBtnDiv">Submit</button>
						<!--<a href="#" class="btn btn-primary" id="nextbtn"><span><strong>Next <img id="forwordImage" src="images/Forward-25.png" width="25" height="25" /></strong></span></a>-->
					</div>
				</div>

			</form>
		</div>
		<div id="mainright" style="height: 598px; width: 20%;">
			<div style="position: relative; padding: 20px">
				<center>
					<img class="candidateImg" width="38%"
						src="img/NewCandidateImage.jpg">
				</center>
			</div>
			<div id="name" class="candOriginalName"
				style="font-size: 20px; color: rgb(79, 104, 135); font-weight: bold; text-align: center;"
				title="">${user.firstName}${user.lastName}</div>
			<div class="bluebg"></div>
		</div>


	</div>



	<div id="footer">
		<center>
			<div id="VersionNo">Version 15.00.00</div>
		</center>
		<div class="clear"></div>
	</div>
	<div class="overlay" style="display: none;"></div>


</body>
</html>