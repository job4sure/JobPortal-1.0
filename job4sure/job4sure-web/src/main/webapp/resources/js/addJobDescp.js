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
	
	function checkMinExp(elem) {
		var firstValue = document.getElementById('sel1').value;
		var secondValue = Number(firstValue) + Number(1);
		document.getElementById('sel2').value = secondValue;
		var lastValue = $('#sel1 option:last-child').val();
		if (firstValue == lastValue) {
			document.getElementById('sel2').value = firstValue;
		}

	}

	function disableMaxExpDropDown() {
		document.getElementById("sel2").disabled = true;
		document.getElementById("salary2").disabled = true;

	}
	
	function checkMinSal(elem) {
		var firstValue = document.getElementById('salary1').value;
		var secondValue = Number(firstValue) + Number(1);
		document.getElementById('salary2').value = secondValue;
		var lastValue = $('#salary1 option:last-child').val();
		if (firstValue == lastValue) {
			document.getElementById('salary2').value = firstValue;
		}

	}
	