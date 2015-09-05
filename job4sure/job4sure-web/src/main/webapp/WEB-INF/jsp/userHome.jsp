<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/switcher.js"></script>
<script type="text/javascript" src="resources/js/toggle.js"></script>
<script type="text/javascript" src="resources/js/ui.core.js"></script>
<script type="text/javascript" src="resources/js/ui.tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
</head>
<body >

<div id="main">
  <div id="cols" class="box">
 <div id="aside" class="box">
      <div class="padding box">
        <!-- Logo (Max. width = 200px) -->
        <p id="logo"><a href="http://all-free-download.com/free-website-templates/"><img src="resources/design/logo.gif" alt="" /></a></p>
        <!-- Search -->
        <form action="http://all-free-download.com/free-website-templates/" method="get" id="search">
          <fieldset>
          <legend>Search</legend>
          <p>
            <input type="text" size="17" name="" class="input-text" />
            &nbsp;
            <input type="submit" value="OK" class="input-submit-02" />
            <br />
            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>
        
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
             By location</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              by keywords</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By name</label>
            </p>
          </div>
          
          </fieldset>
        </form>
       
       
      </div>
      
      <ul class="box">
       <li><a href="#">Privacy</a></li>
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="#">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="#">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="#">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp
		&nbsp
    </div>
  </div>
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
			<marquee><h2>Your account will be expired in ${daysLeft} days. </h2></marquee>	
  </body>
</html>