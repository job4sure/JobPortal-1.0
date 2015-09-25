<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Job Desc</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="resources/css/viewAllJobDesc.css" />
<script type="text/javascript" src="resources/js/paging.js"></script>
<script type="text/javascript" src="resources/js/jsp/userViewJobDescription.js"></script>
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="#"><img src="resources/tmp/logo.gif" alt="" /></a>
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
			</div>
		</div>
		<div class="box" id="content">
			<center>
				<h2 id="show">${message}</h2>
			</center>
		</div>
		<div class="box" id="content">
			<label>Sort By Technology</label> <select onchange="jobsBasedOnTechnology(this)">
				<option value="0" label="select">select</option>
				<option value="1" label="java">java</option>
				<option value="2" label="php">php</option>
				<option value="3" label=".Net">.Net</option>
			</select> &nbsp;&nbsp; <label>Sort By Experiance</label> <select onchange="jobsBasedOnExp(this)">
				<option value="0" label="select">select</option>
				<option value="1" label="1">1</option>
				<option value="2" label="2">2</option>
				<option value="3" label="3">3</option>
				<option value="4" label="4">4</option>
				<option value="5" label="5">5</option>
				<option value="6" label="6">6</option>
			</select>
			<div id="showDataTable">
				<table id="results" style="border-collapse: separate; border-spacing: 12px;" class="nostyle">
					<c:forEach items="${jobList}" var="joblist">
						<%--  <c:if test="${jobList.approvalStatus.statusId==2}"> --%>
						<tr>
							<td width="20%"><img src="resources/images/logo.png" width="100%" height="80" alt="My Pic"></td>
							<td width="70%"><div id="jobDiv"
									style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">
									<h2>${joblist.jobTitle}</h2>
									<p>${joblist.jobDesc}</p>
									<a href="viewSingleJobDescription.do?jobId=${joblist.jobDescriptionId}">View</a>
								</div></td>
						</tr>
						<%-- </c:if> --%>
					</c:forEach>
				</table>
			</div>
			<c:if test="${jobList!=null}">
				<div id="pageNavPosition"></div>
			</c:if>
		</div>
	</div>
</body>
<script>var pager = new Pager('results', 2);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);</script>
</html>