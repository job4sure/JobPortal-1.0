$(document).ready(function(){	
	$('input[name=roleType]').click(function() {
		if($(this).val() == "1") {
			$('#companyname').hide();
			$('#username').show();
			$('#companyemail').hide();
			$('#useremail').show();
			$('#Companyurl').hide();
			$('#urllabel').hide();
			$('#contactNo').hide();
			$('#mobileNo').show();
		} else {
			$('#username').hide();
			$('#companyname').show();
			$('#useremail').hide();
			$('#companyemail').show();
			$('#Companyurl').show();
			$('#urllabel').show();
			$('#mobileNo').hide();
			$('#contactNo').show();
		}
		document.getElementById("cpassword").value="";
		document.getElementById("password").value="";
		document.getElementById("fullName").value="";
		document.getElementById("email").value="";
		document.getElementById("mobileNo").value="";
	});
});