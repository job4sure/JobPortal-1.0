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
	document.getElementById('show_button').addEventListener('click', hideshow, false);
	function hideshow() {
		document.getElementById('hidden-div').style.display = 'block';
		this.style.display = 'none'
	}
	</script>
<script type="text/javascript">

function showRow(rowname) {
	if (document.getElementById(rowname)) {
		document.getElementById(rowname).style.display = '';
	}
}
function hideRow(rowname) {
	if (document.getElementById(rowname)) {
		document.getElementById(rowname).style.display = 'none';
	}
}
function toggleRow(rowname) {
	if (document.getElementById(rowname)) {
		if (document.getElementById(rowname).style.display == 'none') {
			showRow(rowname)
		} else {
			hideRow(rowname)
		}
	}
}
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
<script src="resources/js/addJobDescp.js"></script>
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
	margin-right: 3%;
	margin-top: 4%;
}
</style>
<script type="text/javascript">
function previewImage(){
  var imgpath=document.getElementById("imageUpload");
  if (!imgpath.value==""){
    var img=imgpath.files[0].size;
    var imgsize=img/1024; 
    alert(imgsize);
    if(imgsize== 512 || imgsize<=512){
    	alert("sdf1");
    }else{
    	document.getElementById("demo").innerHTML = "Please select image of 512 kb";
    }
  }
}
</script>
<script type="text/javascript">
 function previewfile(){
	 alert("jj");
	  var filepath=document.getElementById("resumeUpload");
	  if (!filepath.value==""){
	    var file=filepath.files[0].size;
	    var filesize=file/1024; 
	    alert(filesize);
	    if(filesize== 512 || filesize<=512){
	    	alert("sdf2");
	    }else{
	    	alert("else");
	    	document.getElementById("demo1").innerHTML = "Please select file of 512 kb";
	    }
	  }
	}
</script>
</head>
<div id="main">
	<hr class="noscreen" />
	<hr class="noscreen" />
	<div id="cols" class="box">
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
		<body align="center" onload="disableMaxExpDropDown();">
			<h3 style="color: red;">${message}</h3>
			<form:form method="POST" action="saveCompleteUserProfile"
				modelAttribute="userProfile" id="formID"
				enctype="multipart/form-data"
				onsubmit="return jQuery(this).validationEngine('validate');">
				<div id="content" class="box">
					<div class="verticalLine">
						<center >
							<h2>User Complete Information</h2>
						</center>
						<br>
											<a href="javascript:toggleRow('row1')"><h3 align="center"><font color="red">Professional Details</font></h3></a>
						<div id="row1">
					
							<fieldset>
									<center>
										<table width="100%" class="nostyle"
											style="border-collapse: separate; border-spacing: 5px">
											<div width="41%" valign="right">
												<img src="${attachment}" id="preview" height="140px"
													width="140px" />
											</div>
											<form:hidden path="userId" />
											<tr>
											<td ">Resume HeadLine<font
												color="red">*</font>:
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
													onChange="checkMinExp(this);" id="sel1">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}"
															label="${experience.experience}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select
													path="maxExperience.experienceId" disable="disable"
													id="sel2">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}"
															label="${experience.experience}" />
													</c:forEach>
												</form:select> in Year</td>
										</tr>
										<tr>
											<td style="padding: 15;">Annual Salary<font color="red">*</font>:
											</td>
											<td><form:select path="minSalary.salaryId"
													onChange="checkMinSal(this);" id="salary1">
													<c:forEach items="${salary}" var="salary">
														<form:option value="${salary.salaryId}"
															label="${salary.salary}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select path="maxSalary.salaryId"
													id="salary2">
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
											<td><form:select path="currentlocation"
													style="height:25px; width:158px;">
													<option value="null">select</option>
													<c:forEach items="${location}" var="location">
														<option value="${location.currentlocation }">${location.currentlocation}</option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Preffered Location<font
												color="red">*</font>:
											</td>
											<td width="50%"><form:select path="prefferedlocation"
													style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${preferlocation}" var="location">
														<option value="${location.prefferedlocation }">${location.prefferedlocation }</option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
								</table>
							</fieldset>
						</div></div>
					</center>
					<br>
					<center>
						<a href="javascript:toggleRow('row2')"><h3 align="center"><font color="red">Personal Details</font></h3></a>
						<div id="row2">
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
											<td style="padding: 15;">City<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="city"
													class="validate[required] input-text" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">State<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="State"
													class="validate[required] input-text" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">ZipCode<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="zip"
													class="validate[required] input-text" /><br></td>
										</tr>
								</table>
							</fieldset>
						</div>
					</center>
					<br>
					<center>
						<a href="javascript:toggleRow('row3')"><h3 align="center"><font color="red">Attachments</font></h3></a>
						<div id="row3">
							<fieldset>
								<table width="100%" class="nostyle"
									style="border-collapse: separate; border-spacing: 5px">
									<div width="41%" valign="right">
										<tr>
											<td style="padding: 15;"><label>Select Profile:
											</label></td>
											<td><input type="file" name="upload" id="imageUpload"
												onchange="previewImage(this)" accept="image/*"
												multiple="multiple" /><div style="color: red" id="demo"></div></td>
												
										</tr>
										<tr>
											<td style="padding: 15;"><label>Select Resume: </label></td>
											<td><input type="file" name="upload" id="resumeUpload" onchange="previewfile(this)"  multiple="multiple" />
											<div style="color: red" id="demo1"></div></td>
										</tr>
										<tr>
												<td align="left"><a
													href="downloadResume?registrationId=${registration.registrationId}">Download resume</a></td>
											</tr>
										<tr>
											<td style="padding: 15;"></td><td><input type="submit"
												value="submit" class="input-submit-02"
												onclick="return confirm('Are you sure you want to update this item?');jQuery('#formID').submit();" /></td>
										</tr>
								</table>
							</fieldset>
						</div>
					</center>
				</div>
			</form:form>
		</body>
	</div>
</div>
</html>