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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="resources/js/jsp/userCompleteInfo.js"></script>
<link rel="stylesheet" href="resources/css/jsp/userCompleteInfo.css"
	type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	jQuery(document).ready(function() {
		// binds form submission and fields to the validation engine
		jQuery("#formID").validationEngine({
			onFormSuccess : formSuccess,
			onFormFailure : formFailure
		});
	});
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
</head>
<div id="main">
	<hr class="noscreen" />
	<hr class="noscreen" />
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<p id="logo">
					<a href="javascript:void(0)"><img
						src="resources/design/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="javascript:void(0)" method="get" id="search">
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
						<br> <a href="javascript:toggleRow('row1')"><h3
								align="center">
								<font color="red">Professional Details</font>
							</h3></a>
						<div id="row1" style="display: none;">

							<fieldset>
								<center>
									<table width="100%" class="nostyle"
										style="border-collapse: separate; border-spacing: 5px">
										<tr>
											<div width="41%" valign="right">
												<img src="${attachment}" id="preview" height="140px"
													width="140px" />
											</div>
										</tr>
										<form:hidden path="userId" />
										<tr>
											<td>Resume HeadLine<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="27" path="resume"
													class="validate[required] input-text" maxlength="25" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Role<font color="red">*</font>:
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
											<td style="padding: 15;">Experience<font color="red">*</font>:
											</td>
											<td><form:select path="minExperience.experienceId"
													id="minExperience">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}"
															label="${experience.experience}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select
													path="maxExperience.experienceId" id="maxExperience">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}"
															label="${experience.experience}" />
													</c:forEach>
												</form:select> in Year</td>
										</tr>
										<tr>
											<td>Annual Salary<font color="red">*</font>:
											</td>
											<td><form:select path="minSalary.salaryId"
													id="minSalary">
													<c:forEach items="${salary}" var="salary">
														<form:option value="${salary.salaryId}"
															label="${salary.salary}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select path="maxSalary.salaryId"
													id="maxSalary">
													<c:forEach items="${salary}" var="salary">
														<form:option value="${salary.salaryId}"
															label="${salary.salary}" />
													</c:forEach>
												</form:select> (Salary in Lpa)</td>
										</tr>
										<tr>
											<td style="padding: 15;">Current Location<font
												color="red">*</font>:
											</td>
											<td style="padding: 15;">State<font color="red">*</font></td>
											<td><form:select path="currentCityId.state.stateId"
													id="currentState" onchange="getCityList(this)"
													style="height:25px; width:158px;">

													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}">${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
											<td style="padding: 15;">City<font color="red">*</font></td>
											<td><form:select path="currentCityId.id"
													id="currentStateCity" style="height:25px; width:158px;">
													<form:option value="0" label="Select City" />
													<c:forEach items="${currentCityList}" var="city">
														<form:option value="${city.id}">${city.cityname} </form:option>
													</c:forEach>
												</form:select> <br></td>
											<td style="padding: 15;"><label>Select Profile:
											</label></td>
											<td><input type="file" name="upload" id="imageUpload"
												onchange="previewImagepic(this)" accept="image/*"
												multiple="multiple" />
												<div style="color: red" id="demo"></div></td>

										</tr>
										<tr>

											<td style="padding: 15;">Preferred Location<font
												color="red">*</font>:
											</td>
											<td style="padding: 15;">State<font color="red">*</font></td>
											<td width="50%"><form:select path="cityId.state.stateId"
													onchange="getCityList(this)"
													style="height:25px;  width:158px;" id="preferredState">
													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}">${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
											<td style="padding: 15;">City<font color="red">*</font>:
											</td>

											<td width="50%"><form:select path="cityId.id"
													id="preferredStateCity" style="height:25px;  width:158px;">
													<form:option value="0" label="Select City" />
													<c:forEach items="${cityList}" var="city">
														<form:option value="${city.id}">${city.cityname} </form:option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
										<tr>
											<td style="padding: 15;"><label>Select Resume: </label></td>
											<td><input type="file" name="upload" id="resumeUpload"
												onchange="previewfile(this)" multiple="multiple" />
												<div style="color: red" id="demo1"></div></td>
											<td><a
												href="downloadResume?registrationId=${registration.registrationId}">Download
													resume</a></td>
										</tr>
										<tr>
											<td style="padding: 15;"></td>
											<td><input type="submit" value="submit"
												class="input-submit-02"
												onclick="return confirm('Are you sure you want to update this item?');jQuery('#formID').submit();" /></td>
										</tr>
									</table>
									<h4 style="color: red;">${msg}</h4>
							</fieldset>
						</div>
					</div>
					</center>
					<br>
					<center>
						<a href="javascript:toggleRow('row2')"><h3 align="center">
								<font color="red">Personal Details</font>
							</h3></a>
						<div id="row2" style="display: none;">
							<fieldset>
								<table width="100%" class="nostyle"
									style="border-collapse: separate; border-spacing: 5px">
									<div width="41%" valign="right">
										<tr>
											<td style="padding: 15;">DateOfBirth<font color="red">*</font>:
											</td>
											<td>
												<form>
													<form:input path="dob" id="datepicker" style="height:25px;" />
												</form>
											</td>
										</tr>
										<tr>
											<td style="padding: 15;">Gender<font color="red">*</font></td>
											<td><form:radiobutton path="gender" value="Male" />Male
												<form:radiobutton path="gender" value="Female" />Female</td>
										</tr>
										<tr>
											<td style="padding: 15;">Marital Status<font color="red">*</font></td>
											<td><form:radiobutton path="maritalstatus"
													value="single" />Single <form:radiobutton
													path="maritalstatus" value="married" />Married</td>
										</tr>
										<tr>
											<td style="padding: 15;">Phone<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="phone"
													class="validate[required] input-text" maxlength="10" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Address<font color="red">*</font>:
											</td>
											<td><form:textarea rows="3" path="address"
													class="validate[required] input-text"
													style="width: 302px; height: 80px;" /><br></td>
										</tr>

										<tr>
											<td style="padding: 15;">State<font color="red">*</font>:
											</td>
											<td width="50%"><form:select
													path="homeCity.state.stateId" id="homeState"
													onchange="getCityList(this)"
													style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}">${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
											<td style="padding: 15;">City<font color="red">*</font>
											<td width="50%"><form:select path="homeCity.id"
													id="homeStateCity" style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${homeCityList}" var="city">
														<form:option value="${city.id}">${city.cityname}</form:option>
													</c:forEach>
												</form:select> <br></td>
										</tr>

										<tr>
											<td style="padding: 15;">ZipCode<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="zip"
													class="validate[required] input-text" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;"></td>
											<td><input type="submit" value="submit"
												class="input-submit-02"
												onclick="return confirm('Are you sure you want to update this item?');jQuery('#formID').submit();" /></td>
										</tr>
								</table>
							</fieldset>
						</div>
				</div>
			</form:form>
		</body>
	</div>
</div>
</html>