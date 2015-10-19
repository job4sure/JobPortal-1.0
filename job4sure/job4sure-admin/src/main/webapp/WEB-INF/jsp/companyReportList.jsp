<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/viewAllJobDesc.css" />
<script type="text/javascript" src="resources/js/paging.js"></script>
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="http://all-free-download.com/free-website-templates/"><img
						src="resources/tmp/logo.gif" alt="" /></a>
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
								<label> <input type="checkbox" name="" checked="checked" />
									By Location
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
			<ul class="box">
				<li><a
					href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
				<li><a
					href="http://all-free-download.com/free-website-templates/">Terms
						And Conditions</a></li>

				<li><a
					href="http://all-free-download.com/free-website-templates/">Contact
						Us</a></li>

				<li><a
					href="http://all-free-download.com/free-website-templates/">Leave
						Us Feedback</a></li>
			</ul>

			<!-- Active -->
		</div>
		<h1 align="center">Company LIST</h1>
		<c:if test="${!empty companyList}">
			<div align="center">
				<table width="894" height="73"
					style="background-color: 00CCFF; color: black; padding: 10px; float: center-right">
					<tr>
						<th width="146">
							<div align="left">
								COMPANY ID
								</td>
							</div>
						<th width="141"><div align="left">DOMAIN</div></th>
						<th width="145"><div align="left">ABOUT US</div></th>
						<th width="142"><div align="left">ADDRESS</div></th>
						<th width="145"><div align="left">COMPANY SIZE</div></th>
						<th width="147"><div align="left">COMPANY URL</div></th>
					</tr>

				</table>

				<table id="results" width="894" height="73" align="center"
					border="1"
					style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">


					<c:forEach items="${companyList}" var="view">

						<tr>


							<td width="146"><c:out value="${view.compId}">
									<div align="center"></div>
								</c:out></td>
							<td width="138"><c:out value="${view.domainName}">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out value="${view.aboutUs}">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out value="${view.address1}">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out value="${view.companySize}">
									<div align="center"></div>
								</c:out></td>
							<td width="144"><c:out value="${view.companyUrl}">
									<div align="center"></div>
								</c:out></td>

						</tr>

					</c:forEach>
				</table>
				<tr>
					<td><c:if test="${companyList!=null}">
							<div id="pageNavPosition" align="center"></div>
						</c:if></td>
				</tr>

			</div>
		</c:if>
</body>
<script>
	var pager = new Pager('results', 5);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(1);
</script>

</html>