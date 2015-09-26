function previewImage(input) {
	alert("mk11");
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
function getCityList(data) {

	var stateId = document.getElementById(data.id).value;
	//alert(stateId);
	$.ajax({
		url : "getCompanyCityListByStateId.do?stateId=" + stateId,
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

function ifDomainNotSelected(field, rules, i, options) {
	var b = document.getElementById('domain').value;
	if (b == 0) {
		return "*Please select an option, this field is required";
	}
}
