<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Description</title>

	
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
        <li><a href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="http://all-free-download.com/free-website-templates/">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="http://all-free-download.com/free-website-templates/">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="http://all-free-download.com/free-website-templates/">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	
          <!-- Active -->
         
    
    </div>
 <hr class="noscreen" />
    <!-- Content (Right Column) -->
    <div id="content" class="box">
   
  
		<font color="red"> <c:out value="${status}" />
		</font>
	<form:form action="createJobDescription" method="POST"
		modelAttribute="jobDescription">
		 <form:hidden path="jobDescriptionId" />
		<table width="100%" >
			<tr>
				<td colspan="2" align="center"><h5>
				Job Description</h5></td>
			</tr>
			<tr>
				<td>Job Title</td>
				<td><form:input path="jobTitle" size="30" />
					<div id="error">
						<form:errors path="jobTitle" />
					</div></td>
			</tr>
			<tr>
				<td>Job Description</td>
				<td><form:textarea path="jobDesc" cols="50" rows="5" />
					<div id="error">
						<form:errors path="jobDesc" />
					</div></td>
			</tr>
			<tr>
				<td>Job Location</td>
				<td><form:input path="jobLocation" size="30" />
					<div id="error">
						<form:errors path="jobLocation" />
					</div></td>
			</tr>
			<tr>
				<td>Salary</td>
				<td><form:input path="salary" size="10" /></td>
			</tr>
			<tr>
				<td>Experience</td>
				<td><form:input path="experience" size="30" />
					<div id="error">
						<form:errors path="experience" />
					</div></td>
			</tr>
			<tr>
				<td>Education</td>
				<td><form:input path="education" size="50" /></td>
			</tr>
			<tr>
				<td>skills</td>
				<td><form:input path="skills" size="50" /></td>
			</tr>
			<tr>
				<td>Job Role</td>
				<td><form:input path="role" size="20" />
					<div id="error">
						<form:errors path="role" />
					</div></td>
			</tr>
			<tr>
				<td>No Of Candidates</td>
				<td><form:input path="noOfCandidates" size="5" />
					<div id="error">
						<form:errors path="noOfCandidates" />
					</div></td>
			</tr>
			<tr>
				<td>Job Valid Date</td>
				<td><form:input path="jobValidDate" />
					<div id="error">
						<form:errors path="jobValidDate" />
					</div></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Submit" /></td>
			</tr>
		</table>
	</form:form>
	</div>
	 </div>
	 
</body>
</html>