function updateQuestion(qid) {
//alert($("#qname_hindi_"+qid).val());
	$.ajax({
		url : "updateQuestion.html",
		data : {
			questionid : qid,
			name : encodeURIComponent($("#question_"+qid).val()),
			name_hindi : encodeURIComponent($("#qname_hindi_"+qid).val()),
			type : $("#type_"+qid).val(),
			marks : $("#marks_"+qid).val(),
			answer : $("#answer_"+qid).val(),
			paragraph : encodeURIComponent($("#paragraph_"+qid).val()),
			pHindi: encodeURIComponent($("#pHindi_"+qid).val()),
			filename : $("#filename_"+qid).val()
		},
		success : function(response) {
			alert("Question updated successfully");
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}

function updateOption(id) {

	$.ajax({
		url : "updateOption.html",
		data : {
			optionid : id,
			value : encodeURIComponent($("#optionValue_"+id).val()),
			value_hindi : encodeURIComponent($("#optionHindi_"+id).val()),
			filepath : $("#filepath_"+id).val()
		},
		success : function(response) {
			alert("Updated Successfully");
		},
		error : function(e) {
			alert("Internal error occured. Please refresh the page.");
		}
	});
}