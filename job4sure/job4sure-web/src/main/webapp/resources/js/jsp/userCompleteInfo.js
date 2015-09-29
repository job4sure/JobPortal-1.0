function getCityList(data) {

	var stateId = document.getElementById(data.id).value;
	// alert(stateId);
	$.ajax({
		url : "getCityListByStateId.do?stateId=" + stateId,
		type : "GET",
		contentType : "application/json; charset=utf-8",
		success : function(response) {

			var cityValues = response.cityList;
			$('#' + data.id + 'City').html('');// Empty select box before fill
			// data.without this line when i
			// fill, i got old data also.
			$('#' + data.id + 'City')// Due to above line all data is clear
			// so i add this line for "select city"
			// label.
			.append(
					$("<option value='" + 0 + "'></option>")
							.text("Select City"));
			for (i = 0; i < cityValues.length; i++) {
				$('#' + data.id + 'City').append(
						$("<option value='" + cityValues[i].id + "'></option>")
								.text(cityValues[i].cityname));
			}
		},
		error : function() {
			$('#' + data.id + 'City').append(
					$("<option value='0'></option>").text('Select City'))
		}
	});
}


$(document).ready(function() {
	$("#datepicker").datepicker();
});


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
function previewImagepic(input) {
	var preview = document.getElementById('preview');
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			preview.setAttribute('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		preview.setAttribute('src');
	}
}

function previewImage() {
	var imgpath = document.getElementById("imageUpload");
	if (!imgpath.value == "") {
		var img = imgpath.files[0].size;
		var imgsize = img / 1024;
		if (imgsize == 512 || imgsize <= 512) {
			return true;
		} else {
			document.getElementById("demo").innerHTML = "Please select image of 512 kb";
		}
	}
}

$(window).load(function() {
	var maxprice = $('#maxSalary').html();
	$('#minSalary').change(function() {
		$('#maxSalary').html(maxprice);
		$('#maxSalary option').each(function() {
			if ($(this).val() <= $('#minSalary').val())
				$(this).remove();
		});
	});
});

$(window).load(function() {
	var maxprice = $('#maxExperience').html();
	$('#minExperience').change(function() {
		$('#maxExperience').html(maxprice);
		$('#maxExperience option').each(function() {
			if ($(this).val() <= $('#minExperience').val())
				$(this).remove();
		});
	});
});

function previewfile() {
	var filepath = document.getElementById("resumeUpload");
	if (!filepath.value == "") {
		var file = filepath.files[0].size;
		var filesize = file / 1024;
		if (filesize == 512 || filesize <= 512) {
			return true;
		} else {
			document.getElementById("demo1").innerHTML = "Please select file of 512 kb";
		}
	}
}

function ifRoleTypeNotSelected(field, rules, i, options) {
	var b = document.getElementById('roletype').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}

function ifCurrentStateTypeNotSelected(field, rules, i, options) {
	var b = document.getElementById('currentState').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
function ifCurrentStateCityTypeNotSelected(field, rules, i, options) {
	var b = document.getElementById('currentStateCity').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
function ifPreferredStateTypeNotSelected(field, rules, i, options) {
	var b = document.getElementById('preferredState').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
function ifPreferredStateCityTypeNotSelected(field, rules, i, options) {
	var b = document.getElementById('preferredStateCity').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}

function ifGenderNotSelected(field, rules, i, options) {
	var fields = $("input[name='gender']").serializeArray();
	if (fields.length == 0) {
		return "*Please select an option, this field is required";
	}
}
function ifMaritalStatusNotSelected(field, rules, i, options) {
	var fields = $("input[name='maritalstatus']").serializeArray();
	if (fields.length == 0) {
		return "*Please select an option, this field is required";
	}
}

function ifHomeStateNotSelected(field, rules, i, options) {
	var b = document.getElementById('homeState').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
function ifHomeStateCityNotSelected(field, rules, i, options) {
	var b = document.getElementById('homeStateCity').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
