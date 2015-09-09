<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<style>
.hidden-div {
	display: none;
}
</style>
<script type="text/javascript">
	document.getElementById('show_button').addEventListener('click', hideshow,
			false);

	function hideshow() {
		document.getElementById('hidden-div').style.display = 'block';
		this.style.display = 'none'
	}

	document.getElementById('show_button1').addEventListener('click',
			hideshow1, false);

	function hideshow1() {
		document.getElementById('hidden-div1').style.display = 'block';
		this.style.display = 'none'
	}
</script>

</head>
<body>
	<div id="main">
		<hr class="noscreen" />
		<!-- Columns -->
		<div id="cols" class="box">
			<!-- Aside (Left Column) -->
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
									<label> <input type="checkbox" name=""
										checked="checked" /> By Location
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

				<!-- Active -->


			</div>
			<!-- /aside -->

			<div id="content" class="box">

				<div class="reform">
					<form:form action="edusave" method="POST" id="formID"
						modelAttribute="ED">
						<form:hidden path="education_id" />

						<fieldset>
							<table width="100%" class="nostyle" style="border-collapse: separate;border-spacing: 5px">
								<tr>
									<td><font color="red">*</font>Basic/Graduation</td>
									<td><form:select path="graduation">
											<form:option value="BE/BTECH">BE/BTECH</form:option>
											<form:option value="BSc">BSc</form:option>
											<form:option value="Bcom">Bcom</form:option>
										</form:select></td>
								</tr>

								<tr>
									<td ><form:radiobutton path="education" value="Full Time" />Full
										Time</td>
						<td	colspan="2"><form:radiobutton path="education" value="Part Time" />Part
										Time
									&nbsp;&nbsp;<form:radiobutton path="education"
											value="Correspondance/Distance learning" />Correspondance/Distance
										learning</td>
								</tr>

								<tr>
									<td><font color="red">*</font>Specialization</td>
									<td><form:select path="specialization">
											<form:option value="Automobile">Automobile</form:option>
											<form:option value="Aviation">Aviation</form:option>
											<form:option value="Agriculture">Agriculture</form:option>
										</form:select></td>
								</tr>

								<tr>
									<td><font color="red">*</font>University/Institute</td>
									<td><form:select path="institute">
											<form:option value="LPU">LPU</form:option>
											<form:option value="RGPV">RGPV</form:option>
											<form:option value="Punjab University">Punjab University</form:option>
										</form:select></td>
								</tr>

								<tr>
									<td><font color="red">*</font>Year</td>
									<td><form:select path="yearr">
											<form:option value="2012">2012</form:option>
											<form:option value="2013">2013</form:option>
											<form:option value="2014">2014</form:option>
											<form:option value="2015">2015</form:option>
										</form:select></td>
								</tr>
							</table>
						</fieldset>

						<a href="#" id="show_button" onclick="hideshow()">PostGraduation</a>
						<div class="hidden-div" id="hidden-div">

							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate;border-spacing: 5px">
									<tr>
										<td><font color="red">*</font>Post Graduation</td>
										<td><form:select path="postgraduation">
												<form:option value="ME/MTECH">ME/MTECH</form:option>
												<form:option value="MSc">MSc</form:option>
												<form:option value="Mcom">Mcom</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><form:radiobutton path="posteducation"
												value="Full Time" />Full Time<br></td>
										<td	colspan="2"><form:radiobutton path="posteducation"
												value="Part Time" />Part Time
										&nbsp;&nbsp;<form:radiobutton path="posteducation"
												value="Correspondance/Distance learning" />Correspondance/Distance
											learning</td>
									</tr>

									<tr>
										<td><font color="red">*</font>Specialization</td>
										<td><form:select path="post_specialization">
												<form:option value="Automobile">Automobile</form:option>
												<form:option value="Aviation">Aviation</form:option>
												<form:option value="Agriculture">Agriculture</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><font color="red">*</font>University/Institute</td>
										<td><form:select path="post_institute">
												<form:option value="LPU">LPU</form:option>
												<form:option value="RGPV">RGPV</form:option>
												<form:option value="Punjab University">Punjab University</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><font color="red">*</font>Year</td>
										<td><form:select path="post_yearr">
												<form:option value="2012">2012</form:option>
												<form:option value="2013">2013</form:option>
												<form:option value="2014">2014</form:option>
												<form:option value="2015">2015</form:option>
											</form:select></td>
									</tr>
								</table>
							</fieldset>

						</div>
						<a href="#" id="show_button1" onclick="hideshow1()">PHD</a>
						<div class="hidden-div" id="hidden-div1">

							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate;border-spacing: 5px">
									<tr>
										<td><font color="red">*</font>PhD/Doctorate</td>
										<td><form:select path="doctorate">
												<form:option value="MPHIL">MPHIL</form:option>
												<form:option value="Other">Other</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><form:radiobutton path="doc_education"
												value="Full Time" />Full Time<br></td>
										<td	colspan="2"><form:radiobutton path="doc_education"
												value="Part Time" />Part Time
										&nbsp;&nbsp;<form:radiobutton path="doc_education"
												value="Correspondance/Distance learning" />Correspondance/Distance
											learning</td>
									</tr>

									<tr>
										<td><font color="red">*</font>Specialization</td>
										<td><form:select path="doc_specialization">
												<form:option value="Automobile">Automobile</form:option>
												<form:option value="Aviation">Aviation</form:option>
												<form:option value="Agriculture">Agriculture</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><font color="red">*</font>University/Institute</td>
										<td><form:select path="doc_institute">
												<form:option value="IIT">LPU</form:option>
												<form:option value="NIT">RGPV</form:option>
												<form:option value="IIM">Punjab University</form:option>
											</form:select></td>
									</tr>

									<tr>
										<td><font color="red">*</font>Year</td>
										<td><form:select path="doc_yearr">
												<form:option value="2012">2012</form:option>
												<form:option value="2013">2013</form:option>
												<form:option value="2014">2014</form:option>
												<form:option value="2015">2015</form:option>
											</form:select></td>
									</tr>
								</table>
							</fieldset>
						</div>


						<h3 align="center"><input type="submit" value="Save" style="width: 13em;height: 3em;font-size:large;"></h3>
					</form:form>
				</div>
</body>
</html>