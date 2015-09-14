<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Description</title>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<!-- <link rel="stylesheet" href="resources/css/dropdown.css" type="text/css" /> -->

<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

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
<script src="resources/js/addJobDescp.js"></script>

<link href="resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />

<script src="resources/js/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker();
	});
</script>

<script type="text/javascript">

function checkedSkill(){
	<c:forEach items="${checkedSkillsList}" var="checkedSkills">
	 $('#${checkedSkills.skillsId}').attr('checked', true);
	</c:forEach>
}

</script>
</head>
<body onload="disableMaxExpDropDown();checkedSkill()">
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="#"><img src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="#" method="get" id="search">
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



		</div>
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">

			<h5 style="color: red;">${status}</h5>
			<form:form action="createJobDescription" method="POST" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');" modelAttribute="jobDescription">
				<form:hidden path="jobDescriptionId" />

				<table width="100%">
					<tr>
						<td colspan="2" align="center"><h5>Job Description</h5></td>
					</tr>
					<tr>
						<td>Job Title<font color="red">*</font></td>
						<td><form:input path="jobTitle" class="validate[required,custom[onlyLetterSp]] input-text" maxlength="50" />
							<div id="error">
								<form:errors path="jobTitle" />
							</div></td>
					</tr>
					<tr>
						<td>Job Description</td>
						<td><form:textarea path="jobDesc" class="validate[required] input-text" cols="50" rows="5" maxlength="200" />
							<div id="error">
								<form:errors path="jobDesc" />
							</div></td>
					</tr>
					<tr>
						<td>Job Location<font color="red">*</font></td>
						<td><form:input path="jobLocation" class="validate[required,custom[onlyLetterSp]] input-text allmydiv"
								maxlength="30" />
							<div id="error">
								<form:errors path="jobLocation" />
							</div></td>
					</tr>
					<tr>
						<td>Salary</td>
						<td><form:select path="minSalary.salaryId" onChange="checkMinSal(this);" id="salary1">
								<%-- <form:option value="0" label="Min Annual Salary" /> --%>
								<c:forEach items="${salaryList}" var="salary">
									<form:option value="${salary.salaryId}" label="${salary.salary}" />
								</c:forEach>
							</form:select>&nbsp;to&nbsp; <form:select path="maxSalary.salaryId" id="salary2">
								<%-- <form:option value="0" label="Max Annual Salary" /> --%>
								<c:forEach items="${salaryList}" var="salary">
									<form:option value="${salary.salaryId}" label="${salary.salary}" />
								</c:forEach>
							</form:select> (Salary in Lpa)</td>
					</tr>
					<tr>
						<td>Experience<font color="red">*</font></td>

						<td><form:select path="minExperience.experienceId" onChange="checkMinExp(this);" id="sel1">
								<%-- <form:option value="0" label="Min Annual Salary" /> --%>
								<c:forEach items="${experienceList}" var="experience">
									<form:option value="${experience.experienceId}" label="${experience.experience}" />
								</c:forEach>
							</form:select>&nbsp;to&nbsp; <form:select path="maxExperience.experienceId" disable="disable" id="sel2">
								<%-- <form:option value="0" label="Max Annual Salary" /> --%>
								<c:forEach items="${experienceList}" var="experience">
									<form:option value="${experience.experienceId}" label="${experience.experience}" />
								</c:forEach>
							</form:select> in Year</td>

					</tr>
					<tr>
						<td>Education</td>
						<td><form:input path="education" maxlength="20" class="validate[required] input-text" /></td>
					</tr>

					<tr>
						<td>Skills</td>
						<td>
							<div class="multiselect">
								<div class="selectBox" onclick="showCheckboxes();">
									<select>
										<option>Select an option</option>
									</select>
									<div class="overSelect"></div>
								</div>
								<div id="checkboxes">
									<c:forEach items="${skillsList}" var="refskills">
										<label><form:checkbox path="skill" class="validate[required]" id="${refskills.skillsId}"
												value="${refskills.skillsId}" />${refskills.skillsName}</label>
									</c:forEach>
								</div>
							</div>
							<div id="error">
								<form:errors path="skill" />
							</div>
						</td>
					</tr>
					<tr>
						<td>Job Role<font color="red">*</font></td>
						<td><form:input path="role" maxlength="20" class="validate[required,custom[onlyLetterSp]] input-text" />
							<div id="error">
								<form:errors path="role" />
							</div></td>
					</tr>
					<tr>
						<td>Number Of Vacancies</td>
						<td><form:input path="noOfCandidates" maxlength="3" class="validate[required,custom[integer]] input-text" />
							<div id="error">
								<form:errors path="noOfCandidates" />
							</div></td>
					</tr>
					<tr>
						<td>Last Date of Submission<font color="red">*</font></td>
						<td><form:input path="jobValidDate" maxlength="10" id="datepicker" class="validate[required] input-text" />
							<div id="error">
								<form:errors path="jobValidDate" />
							</div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" value="Submit" onclick="jQuery('#formID').submit();" />
							<input type="button" value="Clear" onclick="clearAllErrors();" /></td>

					</tr>
				</table>
			</form:form>
		</div>
	</div>

</body>
</html>