<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
	<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="resources/js/jsp/commonForFormValidation.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	 -->
</head>
<body onload='document.loginForm.username.focus();'>

<div id="main">
  <!-- Tray -->
 
  <!--  /tray -->
  <hr class="noscreen" />
  <!-- Menu -->
    <div id="menu" class="box">
 	
    <ul class="box">
      <li id="menu-active"><a href="OpenloginPage"><span>Login</span></a></li>
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
        <p id="logo"><a href="#"><img src="resources/tmp/logo.gif" alt="" /></a></p>
        <!-- Search -->
        <form action="#" method="get" id="search">
          <fieldset>
          <legend>Search</legend>
          <p>
            <input type="text" size="17" name="" class="input-text" />
            &nbsp;
            <input type="submit" value="OK" class="input-submit-02" />
            <br />
            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>
          <!-- Advanced search -->
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
              Option I.</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              Option II.</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              Option III.</label>
            </p>
          </div>
          <!-- /search-options -->
          </fieldset>
        </form>
      <ul class="box">
        <li><a href="javascript:void(0);">Privacy</a></li>
        <li><a href="javascript:void(0);">Terms And Conditions</a></li>
		 <li><a href="javascript:void(0);">Contact Us</a></li>
		  <li><a href="javascript:void(0);">Leave Us Feedback</a></li> 
		  </ul>
      </div>
      <!-- /padding -->

    </div>
    <!-- /aside -->
    <hr class="noscreen" />
    <!-- Content (Right Column) -->
    <div id="content" class="box">
    <fieldset>
   
	<%-- <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if> --%>
		 <h3 style="color: red;">${message}</h3>
		<form name='loginForm' id="formID" action="<c:url value='/login' />" onsubmit="return jQuery(this).validationEngine('validate');" method='POST'>
      <table class="nostyle" style="border-collapse: separate; border-spacing: 10px;">
       <tr>
         <td style="width:70px;" >Email Id:</td>
          <td><input type="text" size="40" name='userName' class="validate[required,custom[email]] input-text"  /></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="password" size="40" name='password' class="validate[required] input-text" /></td>
        </tr>
        <tr><td>
	        <input type="submit" class="input-submit" value="Login"  /></td>
	        <td> <input type="button" class="input-submit" value="Cancel" onclick="clearAllErrors();"/></td>
	        <td><a href="forgotPassword">Forgot Password?</a></td>
		 </table>
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
