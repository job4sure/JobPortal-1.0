<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css"
	type="text/css" />
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="resources/css/template.css" type="text/css" />
<script src="resources/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	<script type="text/javascript">
jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine({
				onFormSuccess:formSuccess,
				onFormFailure:formFailure
			});
		});
</script>
</head>
<body onload='document.loginForm.username.focus();'>

	<div id="main">
		<!-- Tray -->

		<!--  /tray -->
		<hr class="noscreen" />
		<!-- Menu -->
		<div id="menu" class="box">

			<ul class="box">
				<li id="menu-active"><a href="https://www.google.co.in/"><span>search</span></a></li>
				<li id="menu-active"><a href="https://www.google.co.in/"><span>top
							recruiters</span></a></li>
			</ul>
		</div>
		<!-- /header -->
		<hr class="noscreen" />
		<!-- Columns -->
		<div id="cols" class="box">
			<!-- Aside (Left Column) -->
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
									<label> <input type="checkbox" name=""
										checked="checked" /> Option I.
									</label> <br /> <label> <input type="checkbox" name="" />
										Option II.
									</label> <br /> <label> <input type="checkbox" name="" />
										Option III.
									</label>
								</p>
							</div>
							<!-- /search-options -->
						</fieldset>
					</form>

				</div>
				<!-- /padding -->

			</div>
			<!-- /aside -->
			<hr class="noscreen" />
			<!-- Content (Right Column) -->
			<div id="content" class="box">
				<fieldset>

					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>
					<h3 style="color: red;">${message}</h3>
					<form name='loginForm' action="<c:url value='/login' />"
						method='POST' id="formID"  onsubmit="return jQuery(this).validationEngine('validate');">
						<table class="nostyle">
							<tr>
								<td style="width: 70px;">Email Id:</td>
								<td><input type="text" size="40" name='userName'
									class="validate[required,custom[email],maxSize[50]] input-text" /></td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="password" size="40" name='password'
									class="validate[required,minSize[5],maxSize[12]] input-text"/></td>
							</tr>

							<!--  <tr>
          <td>User role:</td>
          <td  class="t-center"><label>
            <input type="radio" />
           Company</label>
            &nbsp;
            <label>
            <input type="radio" />
            Consultant</label>
            &nbsp;
            <label>
            <input type="radio" />
            Individual User</label>
          </td>
        </tr> -->
							<tr>
								<td></td>
								<td><input type="submit" class="input-submit" value="Login" onclick="jQuery('#formID').submit();" /></td>
							</tr>
							<!-- <tr><td><a href="forgotPassword">Forgot Password?</a></td>
       <td><a href="registration">SignUp</a></td>	
       </tr> -->




						</table>
						<h5>
							<a href="forgotPassword">Forgot Password?</a> &nbsp; &nbsp;&nbsp;<a
								href="registration">SignUp</a>
						</h5>


						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</fieldset>

			</div>
			<!-- /content -->
		</div>

		<!-- /cols -->
		<hr class="noscreen" />


	</div>
</html>
