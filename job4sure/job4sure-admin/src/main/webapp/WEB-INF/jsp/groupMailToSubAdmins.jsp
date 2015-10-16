<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="javascript:void(0);"><img src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="javascript:void(0);" method="get" id="search">
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
				<li><a href="javascript:void(0);">Privacy</a></li>
				<li><a href="javascript:void(0);">Terms And Conditions</a></li>
				<li><a href="javascript:void(0);">Contact Us</a></li>
				<li><a href="javascript:void(0);">Leave Us Feedback</a></li>
			</ul>
		</div>
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">
			<form:form modelAttribute="sendMail" action="sendMailToGroup" method="POST" id="formID">
				<div id="content" class="box">
					<h5>To:</h5>
					<div id="content" class="box" >
					<input type="text" id="search" placeholder="Search Sub-Admin"><br>
					<div style="width: 100%;height: 200px;overflow: scroll;">
						
						<br>
						<c:forEach items="${subadmins}" var="subadmin">
							<div id="toMailId${subadmin.registrationId}">
								<form:checkbox path="toMailId" value="${subadmin.email}" />
								<label><b>Name:</b> ${subadmin.fullName} &nbsp;&nbsp; <b>Email Id:</b> ${subadmin.email}</label> <br>
							</div>
						</c:forEach>
						</div>
					</div>
					<h5>Subject:</h5>

					<form:textarea placeholder="Subject" path="subject" style="width: 100%" />

					<h5>Body:</h5>
					<form:textarea placeholder="Body" path="body" style="width: 100%; height: 60px" />
				</div>
				<br> <br>
				<input type="submit" value="SEND">
			</form:form>

		</div>
</body>
</html>