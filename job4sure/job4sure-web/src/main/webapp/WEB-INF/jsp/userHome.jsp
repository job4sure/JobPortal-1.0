<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Adminizio Lite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/jsp/userHome.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$(".tabs > ul").tabs();
	});
</script>
</head>
<body>
	<div id="main">
		<div id="cols" class="box">
			<div id="aside" class="box">
				<div class="padding box">
					<!-- Logo (Max. width = 200px) -->
					<p id="logo">
						<a href="#"><img src="resources/design/logo.gif" alt="" /></a>
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
							<div id="search-options" style="display: none;">
								<p>
									<label> <input type="checkbox" name="" checked="checked" /> By location
									</label> <br /> <label> <input type="checkbox" name="" /> by keywords
									</label> <br /> <label> <input type="checkbox" name="" /> By name
									</label>
								</p>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div id="content" class="box">
				Profile Complete
				<div id="progress" class="graph">
					<div id="bar" style="width:${profilecompleted}%">
						<p>${profilecompleted}%complete</p>
					</div>
				</div>
			</div>
			<div>
				<br>
				<div class="wrapper">
					<div class="column">
						<b>Resume Headline:&nbsp;&nbsp;</b>${userProfile.resume}<br> <br> <b>Email:&nbsp;&nbsp;</b>${loggedInEmail}<br>
						<br> <b>Current Location:&nbsp;&nbsp;</b>${userProfile.currentlocation}<br>
						<%-- <br> <b>Preferred Location:&nbsp;&nbsp;</b>${userProfile.prefferedlocation}<br> --%>
						<br> <b>Preferred Industry:&nbsp;&nbsp;</b>${userProfile.industry}<br> <br> <b>Role:&nbsp;&nbsp;</b>${userProfile.roletype}<br>
						<br> <b>Annual Salary:&nbsp;&nbsp;</b>${userProfile.minSalary.salary}<br> <br> <b>Phone:&nbsp;&nbsp;</b>${userProfile.phone}<br>
						<br>
					</div>
					<div class="column">
						<b>Date of Birth:&nbsp;&nbsp;</b>${userProfile.dob}<br> <br> <b>Gender:&nbsp;&nbsp;</b>${userProfile.gender}<br>
						<br> <b>Marital Status:&nbsp;&nbsp;</b>${userProfile.maritalstatus}<br> <br> <b>Permanent
							Address:&nbsp;&nbsp;</b>${userProfile.address}<br> <br> <b>Hometown/City:&nbsp;&nbsp;</b><%-- ${userProfile.city}<br> --%>
						<br> <b>Zip:&nbsp;&nbsp;</b>${userProfile.zip}<br> <br>  <b>State:&nbsp;&nbsp;</b><%--${userProfile.state}<br> --%>
						<br> <b>Total Experience: &nbsp;&nbsp;</b>${userProfile.minExperience.experience}<br> <br>
					</div>
					<div width="41%" valign="middle">
						<img src="${attachment}" id="preview" height="140px" width="140px" />
					</div>
				</div>
			</div>
		</div>
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<marquee>
			<h2>Your account will be expired in ${daysLeft} days.</h2>
		</marquee>
</body>
</html>