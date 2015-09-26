var expanded = false;
function showCheckboxes() {
	var checkboxes = document.getElementById("checkboxes");
	if (!expanded) {
		checkboxes.style.display = "block";
		expanded = true;
	} else {
		checkboxes.style.display = "none";
		expanded = false;
	}
}

/*
 * function checkMinExp(elem) { var firstValue =
 * document.getElementById('sel1').value; var secondValue = Number(firstValue) +
 * Number(1); document.getElementById('sel2').value = secondValue; var lastValue =
 * $('#sel1 option:last-child').val(); if (firstValue == lastValue) {
 * document.getElementById('sel2').value = firstValue; }
 *  }
 */
/*
 * function checkMinSal(elem) { var firstValue =
 * document.getElementById('salary1').value; var secondValue =
 * Number(firstValue) + Number(1); document.getElementById('salary2').value =
 * secondValue; var lastValue = $('#salary1 option:last-child').val(); if
 * (firstValue == lastValue) { document.getElementById('salary2').value =
 * firstValue; }
 *  }
 */

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

function getCityList(data) {

	var stateId = document.getElementById(data.id).value;
	alert(stateId);
	$.ajax({
		url : "getCompanyJDCityListByStateId.do?stateId=" + stateId,
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

function ifStateNotSelected(field, rules, i, options) {
	var a = document.getElementById('currentState').value;
	if (a == 0) {
		return "*Please select an option, this field is required";
	}
}

function ifCityNotSelected(field, rules, i, options) {
	var b = document.getElementById('currentStateCity').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}

function ifSkillNotSelected(field, rules, i, options) {
	var fields = $("input[name='skill']").serializeArray();
	if (fields.length == 0) {
		return "*Please select an option, this field is required";
	}
}

$(document).ready(function() {
	$("#datepicker").datepicker();
});
