<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="resources/css/validationEngine.jquery.css"
	type="text/css" />
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/verfyEmailId.js"></script>
<title>Insert title here</title>

<style>
.hidden-div {
	display: none;
}
</style>
<script type="text/javascript">
	jQuery(document).ready(function() {
		// binds form submission and fields to the validation engine
		jQuery("#formID").validationEngine({
			onFormSuccess : formSuccess,
			onFormFailure : formFailure
		});
	});
</script>
<script type="text/javascript">
	document.getElementById('show_button').addEventListener('click', hideshow,
			false);

	function hideshow() {
		document.getElementById('hidden-div').style.display = 'block';
		this.style.display = 'none'
	}
	</script>
<script type="text/javascript">
	function previewImage(input) {
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
</script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker();
	});
</script>
<script type="text/javascript">

#wgtmsr option{
	  width:1000px; 
      
	}
</script>
<style>
#preview {
	float: right;
	border: 1px dotted black;
	margin-right: 5%;
	margin-top: -60%;
}
</style>
</head>
<div id="main">
	<hr class="noscreen" />
	<hr class="noscreen" />
	<!-- Columns -->
	<div id="cols" class="box">
		<!-- Aside (Left Column) -->
		<div id="aside" class="box">
			<div class="padding box">
				<p id="logo">
					<a href="http://all-free-download.com/free-website-templates/"><img
						src="resources/design/logo.gif" alt="" /></a>
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
		<body align="center">

			<h3 style="color: red;">${message}</h3>

			<form:form method="POST" action="saveCompleteUserProfile"
				modelAttribute="userProfile" id="formID"
				enctype="multipart/form-data"
				onsubmit="return jQuery(this).validationEngine('validate');">

				<div id="content" class="box">
					<div class="verticalLine">

						<center>
							<h2>User Complete Information</h2>
						</center>


						<div id="content" class="box">
							<fieldset>

								<center>
									<table width="100%" class="nostyle"
										style="border-collapse: separate; border-spacing: 5px">



										<form:hidden path="userId" />
										<tr>
											<td style="padding: 15;" align="center">Resume Headine<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="resume"
													class="validate[required] input-text" maxlength="10" /><br></td>
										</tr>
										<tr>

											<td style="padding: 15;" align="center">Current Location<font
												color="red">*</font>:
											</td>
											<td><form:select path="currentlocation"
													style="height:25px; width:158px;">
													<option value="null">select</option>

													<c:forEach items="${location}" var="location">

														<option value="${location.currentlocation }">${location.currentlocation}</option>

													</c:forEach>
												</form:select> <br></td>
										</tr>


										<tr>

											<td style="padding: 15;" align="center">Preffered
												Location<font color="red">*</font>:
											</td>
											<td width="50%"><form:select path="prefferedlocation"
													style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${preferlocation}" var="location">

														<option value="${location.prefferedlocation }">${location.prefferedlocation }</option>

													</c:forEach>
												</form:select> <br></td>
										</tr>


										<tr>

											<td style="padding: 15;" align="center">Role<font
												color="red">*</font>:
											</td>
											<td><form:select path="roletype"
													style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${roletype12}" var="roleUser">

														<option value="${roleUser.roletype }">${roleUser.roletype }</option>

													</c:forEach>
												</form:select> <br></td>
										</tr>
										<tr>
											<td style="padding: 15;" align="center">DateOfBirth<font
												color="red">*</font>:
											</td>
											<td>

												<form>
													<form:input path="dob" id="datepicker" style="height:25px;" />
												</form>
											</td>
										</tr>


										<tr>


											<td style="padding: 15;" align="center">Gender<font
												color="red">*</font></td>

											<td><form:radiobutton path="gender" value="Male" />Male
												<form:radiobutton path="gender" value="Female" />Female</td>
										</tr>



										<tr>
											<td style="padding: 15;" align="center">Experience<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="experience"
													class="validate[required] input-text" maxlength="10" /><br></td>
										</tr>


										<tr>
											<td style="padding: 15;" align="center">Phone<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="phone"
													class="validate[required] input-text" maxlength="10" /><br></td>
										</tr>


										<tr>

											<td style="padding: 15;" align="center">Marital Status<font
												color="red">*</font></td>

											<td><form:radiobutton path="maritalstatus"
													value="single" />Single <form:radiobutton
													path="maritalstatus" value="married" />Married</td>
										</tr>


										<tr>
											<td style="padding: 15;" align="center">Annual Salary<font
												color="red">*</font>:
											</td>
											<td><form:select path="salary"
													style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${salary}" var="salary1">

														<option value="${salary1.salary }">${salary1.salary }</option>



													</c:forEach>
												</form:select> <br></td>
										</tr>
										</tr>
										<tr>
											<td style="padding: 15;" align="center">Address<font
												color="red">*</font>:
											</td>
											<td><form:textarea rows="3" path="address"
													class="validate[required] input-text"
													style="width: 302px; height: 80px;" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;" align="center">City<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="city"
													class="validate[required] input-text" /><br></td>
										</tr>


										<tr>
											<td style="padding: 15;" align="center">State<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="State"
													class="validate[required] input-text" /><br></td>
										</tr>

										<tr>
											<td style="padding: 15;" align="center">ZipCode<font
												color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="zip"
													class="validate[required] input-text" /><br></td>
										</tr>

										</div>
										<!-- <a href="#" id="show_button" onclick="hideshow()">Click here to upload files</a> -->
										<div class="hidden-div" id="hidden-div">

											<tr>
												<td style="padding: 15;" align="center"><label>Select
														Profile<font color="red">*</font>:
												</label></td>
												<td><input type="file" name="upload"
													path="uploadImagesName" onchange="previewImage(this)"
													accept="image/*" multiple="multiple" /></td>

											</tr>
											<tr>
												<td style="padding: 15;" align="center"><label>Select
														Resume: </label></td>
												<td><input type="file" name="upload"
													path="uploadImagesName" multiple="multiple" /></td>

											</tr>
										</div>

									</table>
									<div>
										<tr>
											<td style="padding: 15;"><input type="submit"
												value="submit" class="input-submit-02"
												onclick="return confirm('Are you sure you want to update this item?');jQuery('#formID').submit();" /></td>
										</tr>
									</div>

								</center>

							</fieldset>
						</div>
					</div>

					<div width="41%" valign="middle">
						<img src="${attachment}" id="preview" height="140px" width="140px" />
					</div>
				</div>
			</form:form>
		</body>
	</div>
</div>
</html>