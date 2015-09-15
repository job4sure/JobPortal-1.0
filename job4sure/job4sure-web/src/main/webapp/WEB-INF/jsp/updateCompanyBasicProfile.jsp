<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- for validation -->
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css"
	type="text/css" />
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>
<!-- End validation -->
<script type="text/javascript" src="resources/js/verfyEmailId.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#formID").validationEngine();

	});
</script>
<style type="text/css">

#content table {
    border: 0px solid #cfcfcf;
}
</style>
</head>
<body>

	<!-- <div id="main"> -->
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="http://all-free-download.com/free-website-templates/"><img
						src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="http://all-free-download.com/free-website-templates/"
					method="get" id="search">
					<fieldset>
						<legend>Search</legend>
						<p>
							<input type="text" size="17" name="" class="input-text" />
							&nbsp; <input type="submit" value="OK" class="input-submit-02" />
							<br /> <a href="javascript:toggle('search-options');"
								class="ico-drop">Advanced search</a>
						</p>
						<!-- Advanced search -->
						<div id="search-options" style="display: none;">
							<p>
								<label> <input type="checkbox" name="" checked="checked" />
									By Location
								</label> <br /> <label> <input type="checkbox" name="" /> By
									keywords
								</label> <br /> <label> <input type="checkbox" name="" /> By
									name
								</label>
							</p>
						</div>
						<!-- /search-options -->
					</fieldset>
				</form>
				<!-- Create a new project -->

			</div>
			<!-- /padding -->
			<ul class="box">
			</ul>

		</div>
<div id="content" class="box">
<center>
<h2>Company Basic Information:-</h2>
</center>
</div>

		<div id="content" class="box">
			<hr class="noscreen" />


			<form:form method="POST" action="saveUpdatedCompanyBasicInformation"
				modelAttribute="Registration" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');">



				<form:hidden path="registrationId" />
				<form:hidden path="password" />
				<h3 style="color: red;">${message}</h3>
				<input hidden="radio" name="roleType" value="2" checked />
				<div id="DivFree">
					<table>
						<tr>
							<td style="width: 150px;"><label id="username">Name<font color="red">*</font></label><label
								id="companyname" style="display: none;">CompanyName*:</label></td>
							<td><form:input type="text" size="30" path="fullName"
									class="validate[required] input-text" maxlength="80"
									id="fullName" /></td>
						</tr>
						<tr>
							<td>Contact Number<font color="red">*</font></td>
							<td><form:input type="text" size="40" path="mobileNo"
									class="validate[required,custom[phone],minSize[10],maxSize[10]] input-text"
									maxlength="10" id="mobileNo" />&nbsp&nbsp&nbsp&nbsp<span
								style="color: red"><form:errors path="mobileNo"></form:errors></span><br></td>
						</tr>

						<tr>
							<td>Url<font color="red">*</font>:</td>
							<td><form:input type="text" size="40" path="Companyurl"
									class="validate[required,custom[url]] input-text" maxlength="80" /><font color="red">(Ex: http://google.com)</font></td>
						</tr>
						
						<tr>
							<td>Email Id<font color="red">*</font>:</td>
							<td><form:input type="text" size="40" path="email"
									class="validate[required,custom[email]] input-text" maxlength="80" /></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="submit" value="submit"
								class="input-submit-02" onclick="jQuery('#formID').submit();" /></td>
						</tr>

					</table>
				</div>
				</p>
			</form:form>
		</div>

	</div>
</body>
</html>