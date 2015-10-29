/**
 * view job description
 */
function handleClick(cb) {
		var txt;
		if (cb.checked == true) {
			var r = confirm("Are you sure to refer to company " + cb.value);
			if (r == true) {
				ajaxToChangeStatus('true',cb.value);
			}
		} else {
			var r = confirm("Want to descard refrence to company " + cb.value);
			if (r == true) {
				ajaxToChangeStatus('false',cb.value);
			}
		}
	}
function ajaxToChangeStatus(status, referId){
	alert(status);
	$.ajax({
		url : "changeReferStatus.do?referenceId=" + referId
				+ "&isRefer="+status,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		success : function(response) {
			var refrence = response.refrence;
		},
		error : function() {
		}
	});
}