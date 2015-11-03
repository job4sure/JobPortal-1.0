<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<hr class="noscreen" />
		<!-- Columns -->
		<div id="cols" class="box">
			<div id="aside" class="box">
				<div class="padding box">
					<!-- Logo (Max. width = 200px) -->
					<p id="logo">
						<a href="javascript:void(0)"><img src="resources/tmp/logo.gif" alt="" /></a>
					</p>
					<!-- Search -->
					<form action="javascript:void(0)" method="get" id="search">
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
			<div id="content" class="box">
				<center>
					<h2>Company Profile</h2>
				</center>
			</div>
			<div id="content" class="box">
				<c:if test="${attachment!=null}">
					<div width="41%" valign="middle">
						<img src="${attachment}" id="preview" height="32px" width="38px" />
					</div>
				</c:if>
				<c:if test="${companyProfile.registrationId !=null}">
					<div class="wrapper">
						<div class="column">
							<b>Address:&nbsp;&nbsp;</b> ${companyProfile.address1}<br /> <br /> <b>City:&nbsp;&nbsp;</b>
							${companyProfile.currentCityId.cityname}<br /> <br /> <b>State:&nbsp;&nbsp;</b>
							${companyProfile.currentCityId.state.stateName}<br /> <br /> <b>About Us:&nbsp;&nbsp;</b>
							${companyProfile.aboutUs}<br /> <br />
						</div>
						<div class="column">
							<b>No of Employee:&nbsp;&nbsp;</b> ${companyProfile.companySize}<br /> <br /> <b>Company URL:&nbsp;&nbsp;</b>
							${companyProfile.companyUrl}<br /> <br /> <b>Zip:&nbsp;&nbsp;</b> ${companyProfile.zipcode}<br /> <br /> <b>Domain:&nbsp;&nbsp;</b>
							${companyProfile.domainName}<br /> <br />
						</div>
					</div>
				</c:if>
				<c:if test="${companyProfile.registrationId ==null}">
					<h3 style="color: red;">Sorry Nothing to display complete your details !!</h3>
				</c:if>
			</div>
				<div id="content" class="box">
				<c:set var="count" value="0" scope="page" />
				<table class="basic-table" style="width: 100%">
					<thead>
						<tr>
							<th width="10%">Resume no.</th>
							<th>Resume attached</th>
							<th>Note</th>
							<th>Refer by</th>
							<sec:authorize access="hasRole('ADMIN')">
								<th>Select to refer</th>
							</sec:authorize>
						</tr>
					</thead>
					<c:forEach items="${resumeList}" var="resumeList">
						<c:set var="count" value="${count + 1}" scope="page" />
						<tbody>
							<tr>
								<td width="10%">${count}</td>
								<td>${resumeList.attachment.attachmentName}</td>
								<td>${resumeList.note}</td>
								<td>${resumeList.registration.fullName}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
		</div>
			<marquee>
				<h2>Your account will be expired in ${daysLeft} days.</h2>
			</marquee>
</body>
</html>