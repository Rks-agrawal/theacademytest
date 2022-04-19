var TotalSeconds;
window.setTimeout("Tick()", 1000);

function Tick() {
	if (TotalSeconds > 0) {
		TotalSeconds -= 1;
		UpdateTimer();
	}
	window.setTimeout("Tick()", 1000);
}

function UpdateTimer() {
	var Seconds = parseInt(TotalSeconds);
	if (Seconds == 600) {
		alert("You have only 10 minutes left...!!!");
	}
	if (Seconds <= 0) {
		alert("Times Up...!!! Your answers has been saved succcessfully...!!!");
		$("#quiztest").submit();

	}
	if (Seconds == 30) {
		alert("You have only 5 minutes left to Complete your Exam..!!!");
	}
	if (Seconds <= 300) {
		$(".timer").css("color", "#f07f5f");
		$(".btn-submit").css("background-color", "#3366ff");
		$(".btn-submit").css("cursor", "pointer");
		$(".btn-submit").removeAttr("disabled");
	} else {
		$(".btn-submit").css("color", "#3e637e");
	}
	var Hours = Math.floor(Seconds / 3600);
	Seconds -= Hours * (3600);

	var Minutes = Math.floor(Seconds / 60);
	Seconds -= Minutes * (60);

	var TimeStr = ((Hours > 0) ? LeadingZero(Hours) + ":" : "00:")
			+ LeadingZero(Minutes) + ":" + LeadingZero(Seconds);

	timer.innerHTML = TimeStr;
}
function submitTest() {
	$("#quiztest").submit();
}
function LeadingZero(Time) {

	return (Time < 10) ? "0" + Time : +Time;

}
function changeLanguage() {
	$("#language").val($("#questionlanguage").val());
	updateView();
}

function updateView() {

	var qid = $('#questionId').val();
	var status = $('#q_disp_' + qid).attr('class');
	if (status == 'qno_ans_tag' || status == 'qnodisp_tag') {
		$('#mark_btn_tag').val('De-Tag');
	} else {
		$('#mark_btn_tag').val('Tag');
	}
	if ($("#questionNo").val() == $("#firstQuestion").val()) {
		$('#Prev').css("color", "rgb(123, 123, 123)");
	} else {
		$('#Prev').css("color", "rgb(255, 255, 255)");
	}
	if ($("#questionNo").val() == $("#lastQuestion").val()) {
		$('#next_btn_div').hide();
		$('#next_section_div').show();
	} else {
		$('#next_section_div').hide();
		$('#next_btn_div').show();
	}
	if ($("#totalSection").val() == $("#sectionId").val()
			&& $("#questionNo").val() == $("#lastQuestion").val()) {
		$('#next_section_div').hide();
		$('#next_btn_div').hide();
	}
	/*
	 * selectedLanguage = $("#language").val();
	 * $("#questionlanguage").val(selectedLanguage);
	 * 
	 * if (selectedLanguage != "hindi") { $(".english").show();
	 * $(".hindi").hide(); } else { $(".english").hide(); $(".hindi").show(); }
	 * if ($("#questionNo").val() != $("#lastQuestion").val()) {
	 * $(".nxt-question").show(); $(".next-section").hide(); } else if
	 * ($("#totalSection").val() == $("#sectionId").val()) {
	 * $(".nxt-question").hide(); $(".next-section").hide(); } else {
	 * $(".nxt-question").hide(); $(".next-section").show(); } if
	 * ($("#expandCollapse").val() == "expanded") { expand(); } else {
	 * collapse(); }
	 */
}
function getQuestion(qid) {
	$.ajax({
		url : "getQuestionId.html",
		dataType : "html",
		data : {
			userId : $("#userId").val(),
			sectionId : $("#sectionId").val(),
			questionId : qid,
			timeleft : TotalSeconds
		},
		success : function(response) {
			$("#questionBox").html(response);
			updateView();
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}
function getNextSection() {
	var sectionId = parseInt($("#sectionId").val()) + 1;
	getSection(sectionId);
}

function updateSectionView(){
	var sectionId = parseInt($("#sectionId").val());
	$('#sectionButton_'+sectionId).prop("class","yellow_button");
}

function getSection(sectionid) {

	$.ajax({
		url : "nextSection.html",
		data : {
			userId : $("#userId").val(),
			sectionId : sectionid,
			timeleft : TotalSeconds
		},
		success : function(response) {
			$("#quizBody").html(response);
			updateView();
			updateSectionView();
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}

function showModule(moduleName) {
	
	var Seconds = parseInt(TotalSeconds);
	var Hours = Math.floor(Seconds / 3600);
	Seconds -= Hours * (3600);
	var Minutes = Math.floor(Seconds / 60);
	Seconds -= Minutes * (60);
	var text = ((Hours > 0) ? LeadingZero(Hours) + " Hour" : "")
	+ LeadingZero(Minutes) + " minute(s)" + LeadingZero(Seconds) +" second(s)";
	//var text ="16 minute(s) 11 second(s)";
	$("#dispayMinLeft").html(text);
	$("#popupModal").show();
}
function tb_remove() {
	$("#TB_window").fadeOut(
			"fast",
			function() {
				$('#TB_window,#TB_overlay,#TB_HideSelect').trigger("unload")
						.unbind().remove();
			});
	return false;
}
function cancelPreview() {
	$("#popupModal").hide();
}
function expand() {
	$(".right-rail").hide();
	$("#e-collapse").css("width", "125%");
	$(".expand_icon").show();
	$("#expandCollapse").val("expanded");
}
function collapse() {
	$(".right-rail").show();
	$("#e-collapse").css("width", "100%");
	$(".expand_icon").hide();
	$("#expandCollapse").val("collapsed");
}

$(document).ready(function() {
	TotalSeconds = $("#timeleft").val();
	updateView();
	updateSectionView();
});
function clearResponse() {
	var radioButtons = $("input[type='radio'][name='option']");
	$.each(radioButtons, function(index, rd) {
		$(rd).attr('checked', false);
	});
}

function markAndReview() {
	var answer = $("input[name='option']:checked").val();
	var tagVal = $('#mark_btn_tag').val();
	var status;
	if (answer == null) {
		answer = 0;
		status = (tagVal == 'Tag') ? "qnodisp_tag" : 'unattempt';
	} else {
		status = (tagVal == 'Tag') ? "qno_ans_tag" : 'attempt';
	}

	$.ajax({
		dataType : "html",
		url : "mark.html",
		data : {
			userId : $("#userId").val(),
			sectionId : $("#sectionId").val(),
			questionNo : $("#questionNo").val(),
			optionMarked : answer,
			status : status,
			questionId : $("#questionId").val(),
			timeleft : TotalSeconds
		},
		success : function(response) {
			$("#questionBox").html(response);
			updateView();
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}

function saveAndNext() {

	var status;
	var answer = $("input[name='option']:checked").val();

	if (answer == null) {
		answer = 0;
	}
	if ($('#mark_btn_tag').val() != 'Tag') {
		status = (answer == 0) ? 'qnodisp_tag' : 'qno_ans_tag';

	} else {
		if (answer == 0) {
			status = "unattempt";
		} else {
			status = "attempt";
		}
	}
	$.ajax({
		dataType : "html",
		url : "next.html",
		data : {
			userId : $("#userId").val(),
			sectionId : $("#sectionId").val(),
			questionNo : $("#questionNo").val(),
			optionMarked : answer,
			status : status,
			questionId : $("#questionId").val(),
			timeleft : TotalSeconds
		},
		success : function(response) {
			$("#questionBox").html(response);
			updateView();
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}

function saveAndPrev() {

	if ($("#questionNo").val() == $("#firstQuestion").val()) {
		return;
	}
	var status;
	var answer = $("input[name='option']:checked").val();

	if (answer == null) {
		answer = 0;
	}
	if ($('#mark_btn_tag').val() != 'Tag') {
		status = (answer == 0) ? 'qnodisp_tag' : 'qno_ans_tag';

	} else {
		if (answer == 0) {
			status = "unattempt";
		} else {
			status = "attempt";
		}
	}
	$.ajax({
		dataType : "html",
		url : "prev.html",
		data : {
			userId : $("#userId").val(),
			sectionId : $("#sectionId").val(),
			questionNo : $("#questionNo").val(),
			optionMarked : answer,
			status : status,
			questionId : $("#questionId").val(),
			timeleft : TotalSeconds
		},
		success : function(response) {
			$("#questionBox").html(response);
			updateView();
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}
function changeSysInst(param, value, value2) {
	$('*[class^="' + value + '"]').hide();
	$('.' + param).show();
	var digits = param.replace(/\D/g, "");
	finalVal = value2.concat(digits);
	$('*[class^="' + value2 + '"]').hide();
	$('.' + finalVal).show();
	if (value2 == "cusInstText") {
		$("#cusInst").val(finalVal);
	} else
		$("#basInst").val(finalVal);
}

var page = "next";
function showInstr() {
	if (page == "next") {
		$("#firstPage").hide();
		$("#secondPagep1").show();
		$("#secondPagep2").show();
		page = "previous";
		$("#instPagination").hide();
		// $("#previousbtn").text(mockLabels.previous);
		$("#instruction").removeClass("sysInstruLabel");
		$("#instruction").addClass("otherInstruLabel");
		// loadInstruLabels();
	} else if (page == "previous") {
		$("#secondPagep1").hide();
		$("#secondPagep2").hide();
		$("#firstPage").show();
		page = "next";
		$("#instPagination").show();
		// $("#nextTxt").text(mockLabels.next);
		$("#instruction").removeClass("otherInstruLabel");
		$("#instruction").addClass("sysInstruLabel");
		// loadInstruLabels();
	}
}