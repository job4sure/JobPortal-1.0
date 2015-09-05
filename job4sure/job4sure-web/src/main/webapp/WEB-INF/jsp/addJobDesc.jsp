<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Description</title>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
   <link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
   <script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
  <!--  <script type="text/javascript" src="resources/js/verfyEmailId.js"></script> -->
  <!--  <script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script> -->
   <script type="text/javascript">
jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine({
				onFormSuccess:formSuccess,
				onFormFailure:formFailure
			});
		});
</script>

	
<style type="text/css">
#error {
	color: red;
}
</style>
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
        left: 0; right: 0; top: 0; bottom: 0;
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
        <p id="logo"><a href="http://all-free-download.com/free-website-templates/"><img src="resources/tmp/logo.gif" alt="" /></a></p>
        <!-- Search -->
        <form action="http://all-free-download.com/free-website-templates/" method="get" id="search">
          <fieldset>
          <legend>Search</legend>
          <p>
            <input type="text" size="17" name="" class="input-text" />
            &nbsp;
            <input type="submit" value="OK" class="input-submit-02" />
            <br />
            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>
          <!-- Advanced search -->
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
              By Location</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By keywords</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By name</label>
            </p>
          </div>
          <!-- /search-options -->
          </fieldset>
        </form>
        <!-- Create a new project -->
      
      </div>
      <!-- /padding -->
      <ul class="box">
        <li><a href="#">Privacy</a></li>
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="#">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="#">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="#">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	
          <!-- Active -->
         
    
    </div>
 <hr class="noscreen" />
    <!-- Content (Right Column) -->
    <div id="content" class="box">
   
  <h5 style="color: red;">${status}</h5>
		
		
	<form:form action="createJobDescription" method="POST" id="formID" onsubmit="return jQuery(this).validationEngine('validate');"
		modelAttribute="jobDescription">
		 <form:hidden path="jobDescriptionId" />
		<table width="100%" >
			<tr>
				<td colspan="2" align="center"><h5>
				Job Description</h5></td>
			</tr>
			<tr>
				<td>Job Title</td>
				<td><form:input path="jobTitle" class="validate[required] input-text" size="30" />
					<div id="error">
						<form:errors path="jobTitle" />
					</div></td>
			</tr>
			<tr>
				<td>Job Description</td>
				<td><form:textarea path="jobDesc" class="validate[required] input-text" cols="50" rows="5" />
					<div id="error">
						<form:errors path="jobDesc" />
					</div></td>
			</tr>
			<tr>
				<td>Job Location</td>
				<td><form:input path="jobLocation" class="validate[required] input-text" size="30" />
					<div id="error">
						<form:errors path="jobLocation" />
					</div></td>
			</tr>
			<tr>
				<td>Salary</td>
				<td><form:input path="salary" size="10" class="validate[required] input-text" /></td>
			</tr>
			<tr>
				<td>Experience</td>
				<td><form:input path="experience" size="30" class="validate[required] input-text"  />
					<div id="error">
						<form:errors path="experience" />
					</div></td>
			</tr>
			<tr>
				<td>Education</td>
				<td><form:input path="education" size="50" class="validate[required] input-text"  /></td>
			</tr>
			<tr>
				<td>skills</td>
				<td><div class="multiselect">
         <div class="selectBox" onclick="showCheckboxes()">
            <select>
                <option>Select an option</option>
            </select>
            <div class="overSelect"></div>
        </div>
        <div id="checkboxes">
            <label for="Java"><input type="checkbox" name="checkbox" value="1"/>Java</label>
            <label for="Php"><input type="checkbox" name="checkbox" value="2"/>Php</label>
            <label for="C"><input type="checkbox" name="checkbox" value="3"/>C</label>
			<label for="C++"><input type="checkbox" name="checkbox" value="4"/>C++</label>
        </div>
        <form:hidden path="checkbox"/> 
        </td>
    </div> 
		</tr> 
			<tr>
				<td>Job Role</td>
				<td><form:input path="role" size="20" class="validate[required] input-text"  />
					<div id="error">
						<form:errors path="role" />
					</div></td>
			</tr>
			<tr>
				<td>No Of Candidates</td>
				<td><form:input path="noOfCandidates" size="5" class="validate[required] input-text" />
					<div id="error">
						<form:errors path="noOfCandidates" />
					</div></td>
			</tr>
			<tr>
				<td>Job Valid Date</td>
				<td><form:input path="jobValidDate" class="validate[required] input-text" />
					<div id="error">
						<form:errors path="jobValidDate" />
					</div></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Submit"  onclick="jQuery('#formID').submit();" /></td>
			</tr>
		</table>
	</form:form>
	</div>
	 </div>
	 
</body>
</html>