<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Description</title>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<link rel="stylesheet" href="resources/css/dropdown.css" type="text/css" />
<style type="text/css">
#error {
	color: red;
}
</style>
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="javascript:void(0)"><img src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="javascript:void(0)" method="get" id="search">
					<fieldset>
						<legend>Search</legend>
						<p>
							<input type="text" size="17" name="" class="input-text" /> &nbsp; <input type="submit" value="OK"
								class="input-submit-02" /> <br /> <a href="javascript:toggle('search-options');" class="ico-drop">Advanced
								search</a>
						</p>
						<!-- Advanced search -->
						<div id="search-options" style="display: none;">
							<p>
								<label> <input type="checkbox" name="" checked="checked" /> By Location
								</label> <br /> <label> <input type="checkbox" name="" /> By keywords
								</label> <br /> <label> <input type="checkbox" name="" /> By name
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
				<li><a href="javascript:void(0)">Privacy</a></li>
				<li><a href="javascript:void(0)">Terms And Conditions</a></li>
				<li><a href="javascript:void(0)">Contact Us</a></li>
				<li><a href="javascript:void(0)">Leave Us Feedback</a></li>
			</ul>
		</div>
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">
			<h5 style="color: red;">${status}</h5>
			<form:form action="" method="POST" id="formID" onsubmit="return jQuery(this).validationEngine('validate');"
				modelAttribute="jobDescription">
				<form:hidden path="jobDescriptionId" />
				<table width="100%">
					<tr>
						<td colspan="2" align="center"><h5>Job Description</h5></td>
					</tr>
					<tr>
						<td width="30%">Job Title</td>
						<td width="70%">${jobDescription.jobTitle}</td>
					</tr>
					<tr>
						<td>Job Description</td>
						<td>${jobDescription.jobDesc}
					</tr>
					<%-- 	<tr>
						<td>Job Location</td>
						<td>${jobDescription.jobLocation}</td>
					</tr> --%>
					<tr>
						<td>Salary</td>
						<td>${jobDescription.minSalary.salary}To${jobDescription.maxSalary.salary} lacs/year</td>
					</tr>
					<tr>
						<td>Education</td>
						<td>${jobDescription.education}</td>
					</tr>
					<tr>
						<td>Skills</td>
						<td><c:forEach items="${jobDescription.skillsSet}" var="refskills">
												${refskills.skillsName},
									</c:forEach></td>
					</tr>
					<tr>
						<td>Job Role</td>
						<td>${jobDescription.role}</td>
					</tr>
					<tr>
						<td>No Of Candidates</td>
						<td>${jobDescription.noOfCandidates}</td>
					</tr>
					<tr>
						<td>Job Valid Date</td>
						<td>${jobDescription.jobValidDate}</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>