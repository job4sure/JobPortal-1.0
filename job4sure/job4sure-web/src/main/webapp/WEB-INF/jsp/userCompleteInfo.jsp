<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<!-- <script type="text/javascript" src="resources/js/verfyEmailId.js"></script> -->
<title>Insert title here</title>
<style>
.hidden-div {
	display: none;
}
</style>
<script type="text/javascript">

		function getCityList(data){
			
	   		var stateId=document.getElementById(data.id).value;
	   alert(stateId);
	   $.ajax({
		   url : "getCityListByStateId.do?stateId="+stateId,
		   type : "GET",
		   contentType : "application/json; charset=utf-8",
	 	   success : function(response) {
		 
		 var cityValues = response.cityList;
		 $('#'+data.id+'City').html('');//Empty select box before fill data.without this line when i fill, i got old data also.
		 $('#'+data.id+'City')//Due to above line all data is clear so i add this line for "select city" label.
			.append(
					$(
							"<option value='"+0+"'></option>")
							.text(
									"Select City"));
			for (i = 0; i < cityValues.length; i++) {
				$('#'+data.id+'City')
						.append(
								$(
										"<option value='"+cityValues[i].id+"'></option>")
										.text(
												cityValues[i].cityname));
			}
   },
		   error : function() {
			 	   $('#'+data.id+'City').append($("<option value='0'></option>").text('Select City'))
		   }
		  });
}


</script>
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>
$(function(){

	var all_values=[];

	var initial_options=$('#sf-sal-min').get(0).options;
	for(i=0; i<initial_options.length; i++)
	{
		var val=parseInt(initial_options[i].value);
		var lbl=initial_options[i].label;		
		all_values[i]={value: val, label: lbl };

	}

	document.getElementById('sf-sal-min').options;//$('#sf-size-min').get(0).options;
	
	$('#sf-sal-min').change(function(){
		var $src=$('#sf-sal-min');
		var $target=$('#sf-sal-max');
		var prev_max_value=$target.val();
		var current_min_value=$src.val();

		//clear max drop down list
		$target.get(0).options.length=0;
		
		var j=0;
		for(i=$src.get(0).selectedIndex; i<all_values.length; i++)
		{
			$target.get(0).options[j++]=new Option(all_values[i+1].label, all_values[i+1].value);
		}
		$target.val(prev_max_value);
console.log(all_values);		
		
	});

	$('#sf-sal-max').change(function(){
		var $src=$('#sf-sal-max');
		var $target=$('#sf-sal-min');
		var prev_min_value=$target.val();
		var current_max_value=parseInt($src.val());

		//clear min drop down list
		$target.get(0).options.length=0;
		
		var j=0;
		for(i=0; i<all_values.length;  i++)
		{
			if (current_max_value > all_values[i].value)
				$target.get(0).options[j++]=new Option(all_values[i+1].label, all_values[i+1].value);
		}
		$target.val(prev_min_value);
	});


});
</script>
<script>
$(function(){

	var all_values=[];

	var initial_options=$('#sf-size-min').get(0).options;
	for(i=0; i<initial_options.length; i++)
	{
		var val=parseInt(initial_options[i].value);
		var lbl=initial_options[i].label;		
		all_values[i]={value: val, label: lbl };

	}

	document.getElementById('sf-size-min').options;//$('#sf-size-min').get(0).options;
	
	$('#sf-size-min').change(function(){
		var $src=$('#sf-size-min');
		var $target=$('#sf-size-max');
		var prev_max_value=$target.val();
		var current_min_value=$src.val();

		//clear max drop down list
		$target.get(0).options.length=0;
		
		var j=0;
		for(i=$src.get(0).selectedIndex; i<all_values.length; i++)
		{
			$target.get(0).options[j++]=new Option(all_values[i+1].label, all_values[i+1].value);
		}
		$target.val(prev_max_value);
console.log(all_values);		
		
	});

	$('#sf-size-max').change(function(){
		var $src=$('#sf-size-max');
		var $target=$('#sf-size-min');
		var prev_min_value=$target.val();
		var current_max_value=parseInt($src.val());

		//clear min drop down list
		$target.get(0).options.length=0;
		
		var j=0;
		for(i=0; i<all_values.length;  i++)
		{
			if (current_max_value > all_values[i].value)
				$target.get(0).options[j++]=new Option(all_values[i+1].label, all_values[i+1].value);
		}
		$target.val(prev_min_value);
	});


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
					<a href="http://all-free-download.com/free-website-templates/"><img src="resources/design/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="http://all-free-download.com/free-website-templates/" method="get" id="search">
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
			</ul>
		</div>
		<body align="center">
			<h3 style="color: red;">${message}</h3>
			<form:form method="POST" action="saveCompleteUserProfile" modelAttribute="userProfile" id="formID"
				enctype="multipart/form-data" onsubmit="return jQuery(this).validationEngine('validate');">
				<div id="content" class="box">
					<div class="verticalLine">
						<center>
							<h2>User Complete Information</h2>
						</center>
						<br> <a href="javascript:toggleRow('row1')"><h3 align="center">
								<font color="red">Professional Details</font>
							</h3></a>
						<div id="row1">

							<fieldset>
								<center>
									<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
										<tr><div width="41%" valign="right">
											<img src="${attachment}" id="preview" height="140px" width="140px" />
										</div></tr>
										<form:hidden path="userId" />
										<tr>
											<td>Resume HeadLine<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="27" path="resume" class="validate[required] input-text" maxlength="25" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Role<font color="red">*</font>:
											</td>
											<td><form:select path="roletype" style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${roletype12}" var="roleUser">
														<option value="${roleUser.roletype }">${roleUser.roletype }</option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Experience<font color="red">*</font>:
											</td>
											<td><form:select path="minExperience.experienceId"  id="sf-size-min">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}" label="${experience.experience}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select path="maxExperience.experienceId"  id="sf-size-max">
													<c:forEach items="${experienceList}" var="experience">
														<form:option value="${experience.experienceId}" label="${experience.experience}" />
													</c:forEach>
												</form:select> in Year</td>
										</tr>
										<tr>
											<td >Annual Salary<font color="red">*</font>:
											</td>
											<td ><form:select path="minSalary.salaryId"  id="sf-sal-min">
													<c:forEach items="${salary}" var="salary">
														<form:option value="${salary.salaryId}" label="${salary.salary}" />
													</c:forEach>
												</form:select>&nbsp;to&nbsp; <form:select path="maxSalary.salaryId" id="sf-sal-max">
													<c:forEach items="${salary}" var="salary">
														<form:option value="${salary.salaryId}" label="${salary.salary}" />
													</c:forEach>
												</form:select> (Salary in Lpa)</td>
										</tr>
										<tr>
											<td style="padding: 15;">Current Location<font color="red">*</font>:
											</td><td style="padding: 15;">State<font color="red">*</font></td>
											<td><form:select path="currentCityId.state.stateId" id="currentState" onchange="getCityList(this)" style="height:25px; width:158px;">
													
													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}"  >${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
												<td style="padding: 15;">City<font color="red">*</font></td>
												<td><form:select path="currentCityId.id" id="currentStateCity" style="height:25px; width:158px;">
													<form:option value="0" label="Select City" />
													<c:forEach items="${currentCityList}" var="city">
														<form:option value="${city.id}">${city.cityname} </form:option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
										<tr>

											<td style="padding: 15;">Preferred Location<font color="red">*</font>:
											</td>
											<td style="padding: 15;">State<font color="red">*</font></td>
											<td width="50%"><form:select path="cityId.state.stateId" onchange="getCityList(this)" style="height:25px;  width:158px;" id="preferredState">
													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}"  >${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
											<td style="padding: 15;">City<font color="red">*</font>:
											</td>

											<td width="50%"><form:select path="cityId.id" id="preferredStateCity" style="height:25px;  width:158px;">
													<form:option value="0" label="Select City" />
													<c:forEach items="${cityList}" var="city">
														<form:option value="${city.id}">${city.cityname} </form:option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
									</table>
							</fieldset>
						</div>
					</div>
					</center>
					<br>
					<center>
						<a href="javascript:toggleRow('row2')"><h3 align="center">
								<font color="red">Personal Details</font>
							</h3></a>
						<div id="row2">
							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
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
											<td><form:radiobutton path="gender" value="Male" />Male <form:radiobutton path="gender" value="Female" />Female</td>
										</tr>
										<tr>
											<td style="padding: 15;">Marital Status<font color="red">*</font></td>
											<td><form:radiobutton path="maritalstatus" value="single" />Single <form:radiobutton
													path="maritalstatus" value="married" />Married</td>
										</tr>
										<tr>
											<td style="padding: 15;">Phone<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="phone" class="validate[required] input-text" maxlength="10" /><br></td>
										</tr>
										<tr>
											<td style="padding: 15;">Address<font color="red">*</font>:
											</td>
											<td><form:textarea rows="3" path="address" class="validate[required] input-text"
													style="width: 302px; height: 80px;" /><br></td>
										</tr>
										
										<tr>
											<td style="padding: 15;">State<font color="red">*</font>:
											</td>
											<td width="50%"><form:select path="homeState.stateId" id="homeState" onchange="getCityList(this)" style="height:25px;  width:158px;" >
													<option value="null">select</option>
													<c:forEach items="${stateList}" var="state">
														<form:option value="${state.stateId}"  >${state.stateName}</form:option>
													</c:forEach>
												</form:select> <br></td>
												<td style="padding: 15;">City<font color="red">*</font>
												<td width="50%"><form:select path="homeCity.id" id="homeStateCity" style="height:25px;  width:158px;">
													<option value="null">select</option>
													<c:forEach items="${homeCityList}" var="city">
														<form:option value="${city.id}"  >${city.cityname}</form:option>
													</c:forEach>
												</form:select> <br></td>
										</tr>
										
										<tr>
											<td style="padding: 15;">ZipCode<font color="red">*</font>:
											</td>
											<td><form:input type="text" size="40" path="zip" class="validate[required] input-text" /><br></td>
										</tr>
								</table>
							</fieldset>
						</div>
					</center>
					<br>
					<center>
						<a href="javascript:toggleRow('row3')"><h3 align="center">
								<font color="red">Attachments</font>
							</h3></a>
						<div id="row3">
							<fieldset>
								<table width="100%" class="nostyle" style="border-collapse: separate; border-spacing: 5px">
									<div width="41%" valign="right">
										<tr>
											<td style="padding: 15;"><label>Select Profile: </label></td>
											<td><input type="file" name="upload" id="imageUpload" onchange="previewImage(this)" accept="image/*"
												multiple="multiple" />
												<div style="color: red" id="demo"></div></td>

										</tr>
										<tr>
											<td style="padding: 15;"><label>Select Resume: </label></td>
											<td><input type="file" name="upload" id="resumeUpload" onchange="previewfile(this)" multiple="multiple" />
												<div style="color: red" id="demo1"></div></td>
										</tr>
										<tr>
											<td align="left"><a href="downloadResume?registrationId=${registration.registrationId}">Download
													resume</a></td>
										</tr>
										<tr>
											<td style="padding: 15;"></td>
											<td><input type="submit" value="submit" class="input-submit-02"
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