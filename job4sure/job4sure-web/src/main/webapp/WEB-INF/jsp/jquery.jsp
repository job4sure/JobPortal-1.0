<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>JQuery Validation Engine</title>
	<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
 <script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
   <link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

	<script>
		function validate() {
			
		}
		function formSuccess() {
			alert('Success!');
		}
		
		function formFailure() {
			alert('Failure!');
		}
		jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine({
				onFormSuccess:formSuccess,
				onFormFailure:formFailure
			});
		});
		function checkHELLO(field, rules, i, options){
			if (field.val() != "HELLO") {
				// this allows to use i18 for the error msgs
				return options.allrules.validate2fields.alertText;
			}
		}
	</script>
</head>
<body>
	<p>
		This demonstration shows onFormSuccess() and onFormFailure()
		<br/>
	</p>
	<div id="test" class="test" style="width:150px;">This is a div element</div>
	<form id="formID" onsubmit="return jQuery(this).validationEngine('validate');" class="formular" method="post">
		<fieldset>
			<legend>
				Required!
			</legend>
			<label>
				<span>Field is required : </span>
				<input value="" class="validate[required] text-input" type="text" name="req" id="req" />
			</label>
		</fieldset>
		<input class="submit" type="button" onclick="jQuery('#formID').submit();" value="Validate &amp; Send the form!"/><hr/>
	</form>
</body>
</html>
