<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Adminizio Lite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="resources/css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/mystyle.css" />
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css" />

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/switcher.js"></script>
<script type="text/javascript" src="resources/js/toggle.js"></script>
<script type="text/javascript" src="resources/js/ui.core.js"></script>
<script type="text/javascript" src="resources/js/ui.tabs.js"></script>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/jsp/commonForFormValidation.js"></script>
</head>
<body>
	<div id="main">
		<div id="tray" class="box">
			<p class="f-left box">
				<span class="f-left" id="switcher"> <a href="javascript:void(0);" rel="1col" class="styleswitch ico-col1"
					title="Display one column"><img src="resources/design/switcher-1col.gif" alt="1 Column" /></a> <a
					href="javascript:void(0)" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img
						src="resources/design/switcher-2col.gif" alt="" /></a>
				</span> Project: <strong>Job4Sure</strong>
			</p>
			<p class="f-right">
				User: <strong><a href="#">${registration.fullName}</a></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a
					href="javascript:formSubmit()" id="logout">Log out</a></strong>
			</p>

			<h1 class="center">Company Home</h1>
		</div>
		<hr class="noscreen" />
		<div id="menu" class="box">
			<ul class="box">
				<li id="menu-active"><a href="companyHome"><span>Home</span></a></li>
				<li id="menu-active"><a href="createJobDescription"><span>Create Job Description</span></a></li>
				<li id="menu-active"><a href="viewAllJobDescription"><span>View Job Description List</span></a></li>
				<li id="menu-active"><a href="javascript:void(0)"><span>Membership</span></a></li>
				<li id="menu-active"><a href="javascript:void(0)"><span>Company Profile</span></a>
					<ul class="sub-menu">
						<li id="menu-active"><a href="companyProfileView">View Company Profile</a></li>
						<li id="menu-active"><a href="updateCompanyBasicProfile">Update Basic Company Profile</a></li>
						<li id="menu-active"><a href="showCompleteCompanyProfilePage">Update Company Profile</a></li>
						<li id="menu-active"><a href="setNewPasswordForComp">Reset Password</a></li>
					</ul></li>
				<!-- 		<li style="padding-left: 350px;"><img width="17px" src="resources/images/mail.png" /></li>
				<li style="padding-right: 110px;"><b>support@job4sure.com</b></li>
				<li><img width="32px" src="resources/images/facebook.png" /></li>
				<li><img width="32px" src="resources/images/twitter.png" /></li>
				<li><img width="32px" src="resources/images/linkedin.png" /></li> -->
			</ul>
		</div>

	</div>
	<hr class="noscreen" />
	</div>
	<c:url value="/logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
</body>
</html>