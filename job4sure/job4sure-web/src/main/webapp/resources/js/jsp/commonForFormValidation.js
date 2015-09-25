	$(document).ready(function() {
		$('#formID').validationEngine('attach', {
			promptPosition : 'topRight:-90,15',
			scroll : false,
			autoHidePrompt : false,
			fadeDuration : 0.9,
			focusFirstField : true,
			maxErrorsPerField : 1
		});
		$('body').click(function() {
			$(".formError").delay(500).remove();
			$('#msgDiv').delay(500).hide();
		});
		$("#formID").validationEngine();
	});