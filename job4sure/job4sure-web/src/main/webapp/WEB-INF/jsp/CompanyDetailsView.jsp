<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Job4Sure</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
}
</style>
</head>
<body>

	<div id="main">
		<hr class="noscreen" />


		<hr class="noscreen" />
		<!-- Columns -->
		<div id="cols" class="box">
			<!-- Aside (Left Column) -->
			<div id="aside" class="box">
				<div class="padding box">
					<!-- Logo (Max. width = 200px) -->
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
									<label> <input type="checkbox" name=""
										checked="checked" /> By Location
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

			</div>


			<c:if test="${companyProfile.registrationId !=null}">

				<div class="wrapper">
					<div class="column">
						<b>Address:&nbsp;&nbsp;</b> ${companyProfile.address1}<br />
						<br /> <b>City:&nbsp;&nbsp;</b> ${companyProfile.city}<br />
						<br /> <b>State:&nbsp;&nbsp;</b> ${companyProfile.state}<br />
						<br /> <b>About Us:&nbsp;&nbsp;</b> ${companyProfile.aboutUs}<br />
						<br />
					</div>
					<div class="column">
						<b>No of Employee:&nbsp;&nbsp;</b> ${companyProfile.companySize}<br />
						<br /> <b>Company URL:&nbsp;&nbsp;</b>
						${companyProfile.companyUrl}<br />
						<br /> <b>Zip:&nbsp;&nbsp;</b> ${companyProfile.zipcode}<br />
						<br /> <b>Domain:&nbsp;&nbsp;</b> ${companyProfile.domain}<br />
						<br />
					</div>
				</div>
			</c:if>
			<c:if test="${companyProfile.registrationId ==null}">
				<h3 style="color: red;">Sorry Nothing to display complete your
					details !!</h3>
			</c:if>
</body>


</html>