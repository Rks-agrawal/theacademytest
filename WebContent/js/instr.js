var totalSecondInstr = 600;
window.setTimeout("Tick1()", 1000);

function Tick1() {
	if (totalSecondInstr > 0) {
		totalSecondInstr -= 1;
		UpdateInstrTimer();
	}
	window.setTimeout("Tick1()", 1000);
}
function LeadingZero(Time) {
	return (Time < 10) ? "0" + Time : +Time;
}
function UpdateInstrTimer() {
	var Seconds = parseInt(totalSecondInstr);
	if (Seconds <= 0) {
		$("#readylink").removeProp('disabled');
		$("#readylink").css("background-color","#0c7cd5");

	}
	if (Seconds <= 300) {
		$(".timer").css("color", "#f07f5f");
	}
	var Hours = Math.floor(Seconds / 3600);
	Seconds -= Hours * (3600);

	var Minutes = Math.floor(Seconds / 60);
	Seconds -= Minutes * (60);

	var TimeStr = ((Hours > 0) ? LeadingZero(Hours) + ":" : "")
			+ LeadingZero(Minutes) + ":" + LeadingZero(Seconds)

	instrTimer.innerHTML = TimeStr;
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

function readyToBegin() {
	if (document.getElementById("defaultLanguage").options.length > 2) {
		var lang = document.getElementById("defaultLanguage");
		if (lang.value != '0') {
			// createDefaultSubject(lang.value);
			// window.location.href ="/test.theacademy/quiz.html";
		} else {
			alert("Please contact your administor.");
			return false;
		}
	}
	if (document.getElementById("disclaimer").checked == true) {
		// document.getElementById("readylink").removeAttribute("disabled",0);
		// showId();
		// window.location.href
		// ="/test.theacademy/quiz.html?userId="+$("#userid").val();
		$('#defLang').val($('#defaultLanguage').val());
		$("#instrform").submit();
	} else {
		alert('Please contact your administor.');
		document.getElementById("readylink").disabled = "disabled";
		return false;
	}
}
$(document).ready(function() {
	totalSecondInstr =600;
	$('#disclaimer').change(function() {
		if (document.getElementById("defaultLanguage").value != '0') {
			var c = this.checked ? '#0c7cd5' : '#38aae9';
			$("#readylink").css('background-color', c);
		}
	});

});
