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


  <div id="tray" class="box">
  <p class="f-left box">
    <span class="f-left" id="switcher"> <a href="javascript:void(0);" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="resources/design/switcher-1col.gif" alt="1 Column" /></a> <a href="javascript:void(0)" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="resources/design/switcher-2col.gif" alt="" /></a> </span> Project: <strong>Job4Sure</strong> </p>
<p class="f-right">User: <strong><a href="#">${registration.fullName}</a></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="OpenloginPage" id="logout">Log out</a></strong></p>    
	
	<h1 class="center"> User Home</h1>
  
   <!--  <span class="f-left" id="switcher"> <a href="javascript:void(0);" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="design/switcher-1col.gif" alt="1 Column" /></a> <a href="javascript:void(0)" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="design/switcher-2col.gif" alt="" /></a> </span> Project: <strong>Job4Sure</strong> </p> -->
     <!-- <h1 class="t-center"> Company Home</h1> -->
     
  </div>
 
  <hr class="noscreen" />
 
  <div id="menu" class="box">
 
	
    <ul class="box">
     
     
	 <li id="menu-active"><a href="updateBasicProfile"
       ><span>Update Your Basic Profile</span></a></li>
      <!--  <li id="menu-active"><a href="updateCompleteInfo"
       ><span>Update Your Complete Info</span></a></li>
	  <li id="menu-active"><a href="setNewPassword"><span>Reset Password</span></a></li> -->
	   <li id="menu-active"><a href="#"><span>User Profile</span></a>
		   <ul class="sub-menu">
			   <li><a href="updateCompleteInfo">Update Your Complete Info</li>
			   <li><a href="setNewPassword">Reset Password</li>
		   </ul>
	   </li>
    </ul>
  </div>
      	  
  </div>
  
     <hr class="noscreen" />








<%--   <!-- Tray -->
  <div id="tray" class="box">
    <p class="f-left box">
      
      <span class="f-left" id="switcher"> <a href="javascript:void(0);" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="resources/design/switcher-1col.gif" alt="1 Column" /></a> <a href="javascript:void(0)" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="resources/design/switcher-2col.gif" alt="" /></a> </span> Project: <strong>JOB4SURE</strong> </p>
   
   
   <c:if test="${pageContext.request.userPrincipal.name == null}">
    <p class="f-right"> <strong><a href="OpenloginPage" id="login">Login</a></strong> &nbsp;&nbsp;&nbsp;<strong><a href="registration">SignUp</a></strong></p>
  </c:if>
  
    <c:if test="${pageContext.request.userPrincipal.name != null}">
    <p class="f-right"> <strong> <a href="javascript:formSubmit()">Logout</a></strong></p>
  </c:if>
  
 
  
  
  </div>
  <!--  /tray --> --%>
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