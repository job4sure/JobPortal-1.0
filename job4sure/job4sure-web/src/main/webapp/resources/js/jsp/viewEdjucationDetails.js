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
