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
		<font color="red"> <c:out value="${status}" />
		</font>
	<form:form action="createJobDescription" method="POST"
		modelAttribute="jobDescription">
		<table height="500px" align="center">
			<tr>
				<td colspan="2" align="center">Job Description</td>
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
				<td><form:textarea path="JobDesc" cols="50" rows="5" />
					<div id="error">
						<form:errors path="JobDesc" />
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
</body>
</html>