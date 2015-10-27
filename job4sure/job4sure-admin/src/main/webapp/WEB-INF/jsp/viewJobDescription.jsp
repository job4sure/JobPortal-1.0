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
<link rel="stylesheet" href="resources/css/dropdown.css" type="text/css" />

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
<!--  <script type="text/javascript">
jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine({
				onFormSuccess:formSuccess,
				onFormFailure:formFailure
			});
		});
		
		
function clearAllErrors() {
	$('#formID').validationEngine('hideAll');
}

</script> -->


<style type="text/css">
#error {
	color: red;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".dropdown1 dt a").on('click', function() {
			$(".dropdown1 dd ul").slideToggle('fast');
		});

		$(".dropdown1 dd ul a").on('click', function() {
			$(".dropdown1 dd ul").hide();
		});

		function getSelectedValue(id) {
			return $("#" + id).find("dt a span.value").html();
		}

		$(document).bind('click', function(e) {
			var $clicked = $(e.target);
			if (!$clicked.parents().hasClass("dropdown1"))
				$(".dropdown1 dd ul").hide();
		});

		$('.mutliSelect input[type="checkbox"]').on(
				'click',
				function() {
					var title = $(this).closest('.mutliSelect').find(
							'input[type="checkbox"]').val(), title = $(this)
							.val()
							+ ",";
					if ($(this).is(':checked')) {
						/*       var html = '<span title="' + title + '">' + title + '</span>'; */
						$('.multiSel').append(html);
						$(".hida").hide();
					} else {
						$('span[title="' + title + '"]').remove();
						var ret = $(".hida");
						$('.dropdown1 dt a').append(ret);
					}
				});
	});
</script>
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
			<ul class="box">
				<li><a
					href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
				<li><a
					href="http://all-free-download.com/free-website-templates/">Terms
						And Conditions</a></li>
				<li><a
					href="http://all-free-download.com/free-website-templates/">Contact
						Us</a></li>
				<li><a
					href="http://all-free-download.com/free-website-templates/">Leave
						Us Feedback</a></li>
			</ul>
		</div>
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">

			<h5 style="color: red;">${status}</h5>


			<form:form action="" method="POST" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');"
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
					<%-- <tr>
						<td>Job Location</td>
						<td>${jobDescription.jobLocation}</td>
					</tr> --%>
					<tr>
						<td>Salary</td>
						<td>${jobDescription.minSalary.salary}To
							${jobDescription.maxSalary.salary} lacs/year</td>
					</tr>
					<tr>
						<td>Education</td>
						<td>${jobDescription.education}</td>
					</tr>
					<tr>
						<td>Skills</td>
						<td><c:forEach items="${jobDescription.skillsSet}"
								var="refskills">
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
				<c:set var="Id" value="${jobDescription.jobDescriptionId}"
					scope="page" />
			</form:form>
		</div>
		<div id="content" class="box">
			<form:form action="referToAdmin" method="POST" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');"
				modelAttribute="reference" enctype="multipart/form-data">
				<div class="box">
					<input type="hidden" id="thisField" name="jobId" value="${Id}">
					<input type="text" name="note" id="note"> <input
						type="file" name="upload" id="resumeUpload"
						accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
						multiple="multiple" /> <input type="submit"
						value="Refer to admin" />
				</div>
			</form:form>
		</div>

		<div id="content" class="box">
			<form:form action="" method="POST" id="formID"
				onsubmit="return jQuery(this).validationEngine('validate');"
				modelAttribute="references">
				<c:set var="count" value="0" scope="page" />
				<table class="basic-table">
					<thead>
						<tr>
							<th colspan="2" width="10%">Resume no.</th>
							<th colspan="2" width="10%" >Resume attached</th>
							<th colspan="2" width="10%">Note</th>
							<th colspan="2" width="10%">Refer by</th>
						</tr>
					</thead>
					<c:forEach items="${references}" var="reference">
						<c:set var="count" value="${count + 1}" scope="page" />
						<tbody>
							<tr>
								<td width="10%">${count}</td>
								<td width="10%">${reference.attachment.attachmentName}</td>
								<td width="10%">${reference.note}</td>
								<td width="10%">${reference.registration.fullName}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</form:form>
		</div>
	</div>

</body>
</html>