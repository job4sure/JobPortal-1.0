<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css" />
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/jsp/viewEdjucationDetails.js"></script>
<script type="text/javascript" src="resources/js/jsp/commonForFormValidation.js"></script>
</head>
<body>
	<div id="main">
		<hr class="noscreen" />
		<div id="cols" class="box">
			<div id="aside" class="box">
				<div class="padding box">
					<p id="logo">
						<a href="javascript:void(0)"><img src="resources/tmp/logo.gif" alt="" /></a>
					</p>
					<form action="javascript:void(0)" method="get" id="search">
						<fieldset>
							<legend>Search</legend>
							<p>
								<input type="text" size="17" name="" class="input-text" /> &nbsp; <input type="submit" value="OK"
									class="input-submit-02" /> <br /> <a href="javascript:toggle('search-options');" class="ico-drop">Advanced
									search</a>
							</p>
							<div id="search-options" style="display: none;">
								<p>
									<label> <input type="checkbox" name="" checked="checked" /> By Location
									</label> <br /> <label> <input type="checkbox" name="" /> By keywords
									</label> <br /> <label> <input type="checkbox" name="" /> By name
									</label>
								</p>
							</div>
						</fieldset>
					</form>
				</div>
				<ul class="box">
				</ul>
			</div>
			<div id="content" class="box">
				<center>
					<h2>User Education Details:-</h2>
				</center>
			</div>

			<div id="content" class="box">
				<h3>${message}</h3>
				<div class="reform">
					<form:form action="educationSave" method="POST" id="formID" modelAttribute="ED">
						<form:hidden path="educationId" />
						<a href="javascript:toggleRow('row1')"><h3 align="center">
								<font color="red">Graduation</font>
							</h3></a>
						<div id="row1" style="display: none">
							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
									<tr>
										<td><font color="red">*</font>Basic/Graduation</td>
										<td><form:select path="graduation" id="graduation" class="validate[funcCall[ifGraduationNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="BE/BTECH">BE/BTECH</form:option>
												<form:option value="BSc">BSc</form:option>
												<form:option value="Bcom">Bcom</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><form:radiobutton path="education" value="Full Time"
												class="validate[funcCall[ifEducationRadioNotSelected]]" />Full Time</td>
										<td colspan="2"><form:radiobutton path="education" value="Part Time" />Part Time &nbsp;&nbsp;<form:radiobutton
												path="education" value="Correspondance/Distance learning" />Correspondance/Distance learning</td>
									</tr>
									<tr>
										<td><font color="red">*</font>Specialization</td>
										<td><form:select path="specialization" id="specialization"
												class="validate[funcCall[ifSpecializationNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="Automobile">Automobile</form:option>
												<form:option value="Aviation">Aviation</form:option>
												<form:option value="Agriculture">Agriculture</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>University/Institute</td>
										<td><form:select path="institute" id="institute" class="validate[funcCall[ifInstituteNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="LPU">LPU</form:option>
												<form:option value="RGPV">RGPV</form:option>
												<form:option value="Punjab University">Punjab University</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>Year</td>
										<td><form:select path="year" id="yearr" class="validate[funcCall[ifYearNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="2012">2012</form:option>
												<form:option value="2013">2013</form:option>
												<form:option value="2014">2014</form:option>
												<form:option value="2015">2015</form:option>
											</form:select></td>
									</tr>
								</table>
								<br>
								<h3 align="left">
									&nbsp;&nbsp;&nbsp;<input type="submit" value="Save Details" style="width: 6em; height: 2em; font-size: large;">
								</h3>
							</fieldset>
						</div>
						<br>
						<a href="javascript:toggleRow('row2')"><h3 align="center">
								<font color="red">Post Graduation</font>
							</h3></a>
						<div id="row2" style="display: none">
							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
									<tr>
										<td><font color="red">*</font>Post Graduation</td>
										<td><form:select path="postgraduation" id="postgraduation"
												class="validate[funcCall[ifPostgraduationNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="ME/MTECH">ME/MTECH</form:option>
												<form:option value="MSc">MSc</form:option>
												<form:option value="Mcom">Mcom</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><form:radiobutton path="posteducation" value="Full Time"
												class="validate[funcCall[ifPostEducationRadioNotSelected]]" />Full Time<br></td>
										<td colspan="2"><form:radiobutton path="posteducation" value="Part Time" />Part Time &nbsp;&nbsp;<form:radiobutton
												path="posteducation" value="Correspondance/Distance learning" />Correspondance/Distance learning</td>
									</tr>
									<tr>
										<td><font color="red">*</font>Specialization</td>
										<td><form:select path="postSpecialization" id="post_specialization"
												class="validate[funcCall[ifPostSpecializationNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="Automobile">Automobile</form:option>
												<form:option value="Aviation">Aviation</form:option>
												<form:option value="Agriculture">Agriculture</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>University/Institute</td>
										<td><form:select path="postInstitute" id="post_institute"
												class="validate[funcCall[ifPostInstituteNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="LPU">LPU</form:option>
												<form:option value="RGPV">RGPV</form:option>
												<form:option value="Punjab University">Punjab University</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>Year</td>
										<td><form:select path="postYear" id="post_yearr" class="validate[funcCall[ifPostYearrNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="2012">2012</form:option>
												<form:option value="2013">2013</form:option>
												<form:option value="2014">2014</form:option>
												<form:option value="2015">2015</form:option>
											</form:select></td>
									</tr>
								</table>
								<br>
								<h3 align="left">
									&nbsp;&nbsp;&nbsp;<input type="submit" value="Save Details" style="width: 6em; height: 2em; font-size: large;">
								</h3>
							</fieldset>
						</div>
						<br>
						<a href="javascript:toggleRow('row3')"><h3 align="center">
								<font color="red">Phd</font>
							</h3></a>
						<div id="row3" style="display: none">

							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
									<tr>
										<td><font color="red">*</font>PhD/Doctorate</td>
										<td><form:select path="doctorate" id="doctorate" class="validate[funcCall[ifDoctorateNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="MPHIL">MPHIL</form:option>
												<form:option value="Other">Other</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><form:radiobutton class="validate[funcCall[ifDocRadioNotSelected]]" path="docEducation"
												value="Full Time" />Full Time<br></td>
										<td colspan="2"><form:radiobutton path="docEducation" value="Part Time" />Part Time &nbsp;&nbsp;<form:radiobutton
												path="docEducation" value="Correspondance/Distance learning" />Correspondance/Distance learning</td>
									</tr>
									<tr>
										<td><font color="red">*</font>Specialization</td>
										<td><form:select path="docSpecialization" id="doc_specialization"
												class="validate[funcCall[ifDocSpecializationNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="Automobile">Automobile</form:option>
												<form:option value="Aviation">Aviation</form:option>
												<form:option value="Agriculture">Agriculture</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>University/Institute</td>
										<td><form:select path="docInstitute" id="doc_institute"
												class="validate[funcCall[ifDocInstituteNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="IIT">LPU</form:option>
												<form:option value="NIT">RGPV</form:option>
												<form:option value="IIM">Punjab University</form:option>
											</form:select></td>
									</tr>
									<tr>
										<td><font color="red">*</font>Year</td>
										<td><form:select path="docYear" id="doc_yearr" class="validate[funcCall[ifDocYearrNotSelected]]">
												<form:option value="0">Select</form:option>
												<form:option value="2012">2012</form:option>
												<form:option value="2013">2013</form:option>
												<form:option value="2014">2014</form:option>
												<form:option value="2015">2015</form:option>
											</form:select></td>
									</tr>
								</table>
								<br>
								<h3 align="left">
									&nbsp;&nbsp;&nbsp;<input type="submit" value="Save Details" style="width: 6em; height: 2em; font-size: large;">
								</h3>
							</fieldset>

						</div>

					</form:form>
				</div>
			</div>
</body>
</html>