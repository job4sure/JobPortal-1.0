var isVisible = $("#myDiv").is(":visible");
var isHidden = $("#myDiv").is(":hidden");
function showRow(rowname) {
	if (document.getElementById(rowname)) {
		document.getElementById(rowname).style.display = '';
	}
}
function hideRow(rowname) {
	if (document.getElementById(rowname)) {
		document.getElementById(rowname).style.display = 'none';
	}
}
function toggleRow(rowname) {
	if (document.getElementById(rowname)) {
		if (document.getElementById(rowname).style.display == 'none') {
			showRow(rowname)
		} else {
			hideRow(rowname)
		}
	}
}

// for row1
function ifGraduationNotSelected(field, rules, i, options) {
	if (document.getElementById('row1').style.display != 'none') {
		var b = document.getElementById('graduation').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifSpecializationNotSelected(field, rules, i, options) {
	if (document.getElementById('row1').style.display != 'none') {
		var b = document.getElementById('specialization').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifInstituteNotSelected(field, rules, i, options) {
	if (document.getElementById('row1').style.display != 'none') {
		var b = document.getElementById('institute').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifYearNotSelected(field, rules, i, options) {
	if (document.getElementById('row1').style.display != 'none') {
		var b = document.getElementById('yearr').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}

function ifEducationRadioNotSelected(field, rules, i, options) {
	if (document.getElementById('row1').style.display != 'none') {
		var fields = $("input[name='education']").serializeArray();
		if (fields.length == 0) {
			return "*Please select an option, this field is required";
		}
	}
}

// for row2

function ifPostgraduationNotSelected(field, rules, i, options) {
	if (document.getElementById('row2').style.display != 'none') {
		var b = document.getElementById('postgraduation').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifPostSpecializationNotSelected(field, rules, i, options) {
	if (document.getElementById('row2').style.display != 'none') {
		var b = document.getElementById('post_specialization').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifPostInstituteNotSelected(field, rules, i, options) {
	if (document.getElementById('row2').style.display != 'none') {
		var b = document.getElementById('post_institute').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifPostYearrNotSelected(field, rules, i, options) {
	if (document.getElementById('row2').style.display != 'none') {
		var b = document.getElementById('post_yearr').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}


function ifPostEducationRadioNotSelected(field, rules, i, options) {
	if (document.getElementById('row2').style.display != 'none') {
		var fields = $("input[name='posteducation']").serializeArray();
		if (fields.length == 0) {
			return "*Please select an option, this field is required";
		}
	}
}

// for row3

function ifDoctorateNotSelected(field, rules, i, options) {
	if (document.getElementById('row3').style.display != 'none') {
		var b = document.getElementById('doctorate').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifDocSpecializationNotSelected(field, rules, i, options) {
	if (document.getElementById('row3').style.display != 'none') {
		var b = document.getElementById('doc_specialization').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifDocInstituteNotSelected(field, rules, i, options) {
	if (document.getElementById('row3').style.display != 'none') {
		var b = document.getElementById('doc_institute').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifDocYearrNotSelected(field, rules, i, options) {
	if (document.getElementById('row3').style.display != 'none') {
		var b = document.getElementById('doc_yearr').value;
		if (b == 0) {
			return "*Please select an option, this field is required";
		}
	}
}
function ifDocRadioNotSelected(field, rules, i, options) {
	if (document.getElementById('row3').style.display != 'none') {
		var fields = $("input[name='docEducation']").serializeArray();
		if (fields.length == 0) {
			return "*Please select an option, this field is required";
		}
	}
}




