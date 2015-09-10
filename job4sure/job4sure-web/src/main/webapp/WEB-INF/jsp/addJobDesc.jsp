<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Description</title>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<!-- <link rel="stylesheet" href="resources/css/dropdown.css" type="text/css" /> -->

<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>

<!--  <script type="text/javascript" src="resources/js/verfyEmailId.js"></script> -->
<!--  <script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script> -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#formID").validationEngine();

	});

	function clearAllErrors() {
		$('#formID').validationEngine('hideAll');
	}
</script>


<style type="text/css">
#error {
	color: red;
}

#content ul li {
	padding-left: 15px;
	background: url("../design/gg.gif") 0 4px no-repeat;
}
</style>
<!-- <script>
    var expanded = false;
    function showCheckboxes() {
        var checkboxes = document.getElementById("checkboxes");
        if (!expanded) {
            checkboxes.style.display = "block";
            expanded = true;
        } else {
            checkboxes.style.display = "none";
            expanded = false;
        }
    }
</script> -->
<style>
.multiselect {
	width: 200px;
}

.selectBox {
	position: relative;
}

.selectBox select {
	width: 100%;
	font-weight: bold;
}

.overSelect {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
}

#checkboxes {
	display: none;
	border: 1px #dadada solid;
}

#checkboxes label {
	display: block;
}

#checkboxes label:hover {
	background-color: #1e90ff;
}
</style>
<script>
var expanded = false;
function showCheckboxes() {
    var checkboxes = document.getElementById("checkboxes");
    if (!expanded) {
        checkboxes.style.display = "block";
        expanded = true;
    } else {
        checkboxes.style.display = "none";
        expanded = false;
    }
}
</script>
</head>
<body>
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



		</div>
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">

			<h5 style="color: red;">${status}</h5>
			<form:form action="createJobDescription" method="POST" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');"
				modelAttribute="jobDescription">
				<form:hidden path="jobDescriptionId" />

				<table width="100%">
					<tr>
						<td colspan="2" align="center"><h5>Job Description</h5></td>
					</tr>
					<tr>
						<td><font color="red">*</font>Job Title</td>
						<td><form:input path="jobTitle"
								class="validate[required] input-text" size="30" />
							<div id="error">
								<form:errors path="jobTitle" />
							</div></td>
					</tr>
					<tr>
						<td>Job Description</td>
						<td><form:textarea path="jobDesc"
								class="validate[required] input-text" cols="50" rows="5" />
							<div id="error">
								<form:errors path="jobDesc" />
							</div></td>
					</tr>
					<tr>
						<td><font color="red">*</font>Job Location</td>
						<td><form:input path="jobLocation"
								class="validate[required,custom[onlyLetterSp]] input-text allmydiv"
								size="30" />
							<div id="error">
								<form:errors path="jobLocation" />
							</div></td>
					</tr>
					<tr>
						<td>Salary</td>
						<td><form:select path="minSalary.salaryId">
								<%-- <form:option value="0" label="Min Annual Salary" /> --%>
								<c:forEach items="${salaryList}" var="salary">
									<form:option value="${salary.salaryId}"
										label="${salary.salary}" />
								</c:forEach>
							</form:select>&nbsp;to&nbsp; <form:select path="maxSalary.salaryId">
								<%-- <form:option value="0" label="Max Annual Salary" /> --%>
								<c:forEach items="${salaryList}" var="salary">
									<form:option value="${salary.salaryId}"
										label="${salary.salary}" />
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<td><font color="red">*</font>Experience</td>
						<%-- <td><form:input path="experience" size="10"
								class="validate[required] input-text" />
							<div id="error">
								<form:errors path="experience" />
							</div></td> --%>

						<td><form:select path="minExperience.experienceId">
								<%-- <form:option value="0" label="Min Annual Salary" /> --%>
								<c:forEach items="${experienceList}" var="experience">
									<form:option value="${experience.experienceId}"
										label="${experience.experience}" />
								</c:forEach>
							</form:select>&nbsp;to&nbsp; <form:select path="maxExperience.experienceId">
								<%-- <form:option value="0" label="Max Annual Salary" /> --%>
								<c:forEach items="${experienceList}" var="experience">
									<form:option value="${experience.experienceId}"
										label="${experience.experience}" />
								</c:forEach>
							</form:select></td>

					</tr>
					<tr>
						<td>Education</td>
						<td><form:input path="education" size="10"
								class="validate[required] input-text" /></td>
					</tr>
					<%-- <tr>
						<td>Skills</td>
						<td>
							<dl class="dropdown1">
								<dt>
									<a href="javascript:void(0);"> <span class="hida">Select</span>
										<p class="multiSel"></p>
									</a>
								</dt>
								<dd>
									<div class="mutliSelect">
										<ul>
											<c:forEach items="${skillsList}" var="refskills">
												<li><form:checkbox path="skill"
														value="${refskills.skillsId}"
														label="${refskills.skillsName}"
														id="${refskills.skillsName}" /></li>
											</c:forEach>
										</ul>
									</div>
								</dd>
							</dl>
						</td>
					</tr> --%>
					<tr>
						<td>Skills</td>
						<td>
							<div class="multiselect">
								<div class="selectBox" onclick="showCheckboxes()">
									<select>
										<option>Select an option</option>
									</select>
									<div class="overSelect"></div>
								</div>
								<div id="checkboxes">


									<c:forEach items="${skillsList}" var="refskills">
										<label><form:checkbox path="skill"
												id="${refskills.skillsName}" value="${refskills.skillsId}" />${refskills.skillsName}</label>
									</c:forEach>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font>Job Role</td>
						<td><form:input path="role" size="20"
								class="validate[required] input-text" />
							<div id="error">
								<form:errors path="role" />
							</div></td>
					</tr>
					<tr>
						<td>Number Of Candidates</td>
						<td><form:input path="noOfCandidates" size="3"
								class="validate[required] input-text" />
							<div id="error">
								<form:errors path="noOfCandidates" />
							</div></td>
					</tr>
					<tr>
						<td><font color="red">*</font>Job Valid Date</td>
						<td><form:input path="jobValidDate" size="10"
								class="validate[required] input-text" />
							<div id="error">
								<form:errors path="jobValidDate" />
							</div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Submit" onclick="jQuery('#formID').submit();" /> <input
							type="button" value="Clear" onclick="clearAllErrors();" /></td>




					</tr>
				</table>
			</form:form>
		</div>
	</div>

</body>
</html>