<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Job Desc</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="http://all-free-download.com/free-website-templates/"><img src="resources/tmp/logo.gif" alt="" /></a>
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
				<li><a href="http://all-free-download.com/free-website-templates/">Privacy</a></li> &nbsp &nbsp &nbsp &nbsp
				<li><a href="http://all-free-download.com/free-website-templates/">Terms And Conditions</a></li> &nbsp &nbsp &nbsp
				&nbsp
				<li><a href="http://all-free-download.com/free-website-templates/">Contact Us</a></li> &nbsp &nbsp &nbsp &nbsp

				<li><a href="http://all-free-download.com/free-website-templates/">Leave Us Feedback</a></li> &nbsp &nbsp &nbsp
				&nbsp


				<!-- Active -->
		</div>

		<h3 style="color: red;">${message}</h3>
		<center>
			<h2>List of Job Description</h2>
		</center>
		<table style="border-collapse: separate; border-spacing: 12px;">
			<c:forEach items="${approvedJobDescriptionsList}" var="job">
				<tr>
					<td width="10%"></td>
					<td><div style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">
							<h2>${job.jobTitle}</h2>
							<p>${job.jobDesc}</p>
							<a href="viewJobDescription.do?jobId=${job.jobDescriptionId}">View</a>
							<c:if test="${job.approvalStatus.statusId!=2}">
								<a href="jobDescription.do?jobId=${job.jobDescriptionId}&statusId=2">Approve</a>
							</c:if>
							<c:if test='${hideRejectLink!="reject"}'>
								<a href="jobDescription.do?jobId=${job.jobDescriptionId}&statusId=3">Reject</a>
							</c:if>
						</div></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>