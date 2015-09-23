<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Profile</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/companyProfile.css" />
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jsp/companyProfile.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#formID").validationEngine();

	});

	function clearAllErrors() {
		$('#formID').validationEngine('hideAll');
	}
</script>
<script type="text/javascript">
	function getCityList(data) {

		var stateId = document.getElementById(data.id).value;
		alert(stateId);
		$.ajax({
			url : "1getCityListByStateId.do?stateId=" + stateId,
			type : "GET",
			contentType : "application/json; charset=utf-8",
			success : function(response) {

				var cityValues = response.cityList;
				$('#' + data.id + 'City').html('');//Empty select box before fill data.without this line when i fill, i got old data also.
				$('#' + data.id + 'City')//Due to above line all data is clear so i add this line for "select city" label.
				.append(
						$("<option value='"+0+"'></option>")
								.text("Select City"));
				for (i = 0; i < cityValues.length; i++) {
					$('#' + data.id + 'City').append(
							$("<option value='"+cityValues[i].id+"'></option>")
									.text(cityValues[i].cityname));
				}
			},
			error : function() {
				$('#' + data.id + 'City').append(
						$("<option value='0'></option>").text('Select City'))
			}
		});
	}
</script>
</head>
<body>
	<form:form method="POST" action="saveCompanyCompleteProfile"
		modelAttribute="companyProfile" id="formID"
		enctype="multipart/form-data"
		onsubmit="return jQuery(this).validationEngine('validate');">
		<div id="main">
			<hr class="noscreen" />
			<form:hidden path="compId" />
			<div id="cols" class="box">
				<div id="aside" class="box">
					<div class="padding box">
						<!-- Logo (Max. width = 200px) -->
						<p id="logo">
							<a href="http://all-free-download.com/free-website-templates/"><img
								src="resources/design/logo.gif" alt="" /></a>
						</p>
						<!-- Search -->
						<form
							action="http://all-free-download.com/free-website-templates/"
							method="get" id="search">
							<fieldset>
								<legend>Search</legend>
								<p>
									<input type="text" size="17" name="" class="input-text" />
									&nbsp; <input type="submit" value="OK" class="input-submit-02" />
									<br /> <a href="javascript:toggle('search-options');"
										class="ico-drop">Advanced search</a>
								</p>

								<div id="search-options" style="display: none;">
									<p>
										<label> <input type="checkbox" name=""
											checked="checked" /> By location
										</label> <br /> <label> <input type="checkbox" name="" /> by
											keywords
										</label> <br /> <label> <input type="checkbox" name="" /> By
											name
										</label>
									</p>
								</div>

							</fieldset>
						</form>
					</div>
				</div>
				<div id="content" class="box">

					<center>
						<h2>Update Company Profile</h2>
					</center>
				</div>

				<div id="content" class="box">

					<h3 style="color: red;">${message}</h3>
					<fieldset>

						<div width="41%" valign="middle">
							<img src="${attachment}" id="preview" height="32px" width="38px" />
						</div>

						<center>
							<table>

								<form:hidden path="registrationId" />
								<tr>
									<%-- <td>Company name*:</td>
	<td><form:input type="text" size="40" path="companyName"/>
	</td> --%>
									<%-- <tr>
	<td>Company Logo:</td>
	<td><form:input type="text" size="40" path="companylogo"/></td>
	</tr> --%>
								<tr>
									<td>Company size<font color="red">*</font>:
									</td>
									<td><select name="companySize" class="validate[required]">
											<option value="5-10">5-10</option>
											<option value="10-50">10-50</option>
											<option value="50-100">50-100</option>
											<option value="100 & above">100 & above</option>
									</select>
								<tr>
									<td>About Us:</td>
									<td><form:textarea path="aboutUs"
											class="validate[required]" /></td>
								</tr>

								<tr>
									<td>Domain</td>
									<td><form:select path="Domain" class="validate[required]">
											<form:option value="Select" label="Select" />
											<form:option value="IT" label="IT" />
											<form:option value="MANAGER" label="MANAGER" />
										</form:select></td>
								</tr>
								<tr>
									<td>Company URL<font color="red">*</font>:
									</td>
									<td><form:input path="companyUrl"
											class="validate[required] text-input" /></td>
								</tr>
								<tr>
									<td>Address1<font color="red">*</font>:
									</td>
									<td><form:input path="address1"
											class="validate[required,minSize[5],maxSize[300]] input-text" /></td>
								</tr>
								<tr>
									<td>Address2<font color="red">*</font>:
									</td>
									<td><form:input path="address2"
											class="validate[required,minSize[5],maxSize[300]] input-text" /></td>
								</tr>
								<tr>
									<td>Current Location<font color="red">*</font>:
									</td>
									<td>State<font color="red"
										colspan="2">*</font> <form:select
											path="currentCityId.state.stateId" id="currentState"
											onchange="getCityList(this)"
											style="height:20px; width:150px;">

											<!-- <option value="null">select</option> -->
											<c:forEach items="${stateList}" var="state">
												<form:option value="${state.stateId}">${state.stateName}</form:option>
											</c:forEach>
										</form:select> <br></td>
								</tr>
								<tr>
									<td>City<font color="red">*</font></td>
									<td><form:select path="currentCityId.id"
											id="currentStateCity" style="height:25px; width:158px;">
											<form:option value="0" label="Select City" />
											<c:forEach items="${currentCityList}" var="city">
												<form:option value="${city.id}">${city.cityname} </form:option>
											</c:forEach>
										</form:select> <br></td>
								</tr>
								<tr>
									<td>ZipCode<font color="red">*</font>:
									</td>
									<td><form:input path="zipcode"
											class="validate[required] input-text" /></td>
								</tr>

								<tr>
									<td><label>Select Profile<font color="red">*</font>:
									</label></td>
									<td><input type="file" name="upload"
										path="uploadImagesName" onchange="previewImage(this)"
										accept="image/*" /></td>

								</tr>
								<%-- <div width="41%" valign="middle">
									<img src="${attachment}" id="preview" height="140px"
										width="140px" />
								</div> --%>
								<tr>
									<td><input type="submit" value="submit"
										onclick="jQuery('#formID').submit();" /></td>
								</tr>

							</table>
						</center>
					</fieldset>
				</div>

			</div>

		</div>
	</form:form>
</body>
</html>
