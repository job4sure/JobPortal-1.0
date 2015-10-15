<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<html  lang="en">
<head>
<title>Adminizio Lite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="resources/css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="resources/css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="resources/css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection"
	type="text/css" href="resources/css/1col.css" title="1col" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="resources/css/style.css" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/switcher.js"></script>
<script type="text/javascript" src="resources/js/toggle.js"></script>
<script type="text/javascript" src="resources/js/ui.core.js"></script>
<script type="text/javascript" src="resources/js/ui.tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".tabs > ul").tabs();
	});
</script>
</head>
<body>
	<div id="main">
		<div id="tray" class="box">
			<p class="f-left box">
				<span class="f-left" id="switcher"> <a
					href="javascript:void(0);" rel="1col" class="styleswitch ico-col1"
					title="Display one column"><img
						src="resources/design/switcher-1col.gif" alt="1 Column" /></a> <a
					href="javascript:void(0)" rel="2col" class="styleswitch ico-col2"
					title="Display two columns"><img
						src="resources/design/switcher-2col.gif" alt="" /></a>
				</span> Project: <strong>ITJOBBERS</strong>
			</p>
			<p class="f-right">
				User: <strong><a href="#">${registration.fullName}</a></strong>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a
					href="OpenloginPage" id="logout">Log out</a></strong>
			</p>
			<h1 class="center">Admin Home</h1>
		</div>
		<hr class="noscreen" />

		<div id="menu" class="box">
			<ul class="box">
			<li id="menu-active"><a href="showAdminHomePage"><span>HOME</span></a>
			<sec:authorize access="hasRole('ADMIN')">
			<li id="menu-active"><a href="addSubAdmin"><span>Add Sub Admin</span></a>
			</sec:authorize>
				<li id="menu-active"><a href="#"><span>Show Job Description</span></a>
					<ul class="sub-menu">
						<li><a href="showApprovedJobDescriptions">Approved</a></li>
						<li><a href="showPendingJobDescriptions">Pending Approval</a></li>
						<li><a href="showRejectedJobDescriptions">Rejected</a></li>
					</ul></li>
				<li id="menu-active"><a href="#"><span>Report</span></a>
				<ul class="sub-menu">
				<li><a href="companyList">company list</a></li>
				<li><a href="userList">user list</a></li>
				</ul>
				</li>
					
				
			</ul>
			
		</div>
		
	</div>
	<hr class="noscreen" />
	<c:url value="/logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
</body>
</html>