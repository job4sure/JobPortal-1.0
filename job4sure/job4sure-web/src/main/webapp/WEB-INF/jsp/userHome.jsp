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
     <style>
           
            .graph {
                width: 20%; /* width and height are arbitrary, just make sure the #bar styles are changed accordingly */
                height: 19px;
                border: 1px solid #888; 
                background: rgb(168,168,168);
                background: -moz-linear-gradient(top, rgba(168,168,168,1) 0%, rgba(204,204,204,1) 23%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(168,168,168,1)), color-stop(23%,rgba(204,204,204,1)));
                background: -webkit-linear-gradient(top, rgba(168,168,168,1) 0%,rgba(204,204,204,1) 23%);
                background: -o-linear-gradient(top, rgba(168,168,168,1) 0%,rgba(204,204,204,1) 23%);
                background: -ms-linear-gradient(top, rgba(168,168,168,1) 0%,rgba(204,204,204,1) 23%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a8a8a8', endColorstr='#cccccc',GradientType=0 );
                background: linear-gradient(top, rgba(168,168,168,1) 0%,rgba(204,204,204,1) 23%);
                position: relative;
            }
            #bar {
                height: 18px; /* Not 30px because the 1px top-border brings it up to 30px to match #graph */
                background: rgb(255,197,120); 
                background: -moz-linear-gradient(top, rgba(255,197,120,1) 0%, rgba(244,128,38,1) 100%); 
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,197,120,1)), color-stop(100%,rgba(244,128,38,1))); 
                background: -webkit-linear-gradient(top, rgba(255,197,120,1) 0%,rgba(244,128,38,1) 100%); 
                background: -o-linear-gradient(top, rgba(255,197,120,1) 0%,rgba(244,128,38,1) 100%); 
                background: -ms-linear-gradient(top, rgba(255,197,120,1) 0%,rgba(244,128,38,1) 100%); 
                background: linear-gradient(top, rgba(255,197,120,1) 0%,rgba(244,128,38,1) 100%); 
                border-top: 1px solid #fceabb;
            }
            #bar p { position: absolute; text-align: center; width: 100%; margin: 0; line-height: 18px; }
            .error {
                /* These styles are arbitrary */
                background-color: #fceabb;
                padding: 1em;
                font-weight: bold;
                color: red;
                border: 1px solid red;
            }
        </style>
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
      
     
    </div>
     <div id="content" class="box">
     Profile Complete
    	 <div id="progress" class="graph"><div id="bar" style="width:${profilecompleted}%"><p>${profilecompleted}% complete</p></div></div>
    </div>
    <div><br>
   <div class="wrapper">
        <div class="column">
        <b>Resume Headline:</b>${userProfile.resume}<br><br>
         <b>Current Location:</b>${userProfile.currentlocation}<br><br>
          <b>Preferred Location:</b>${userProfile.prefferedlocation}<br><br>
           <b>Preferred Industry:</b>${userProfile.industry}<br><br>
           <b>Role:</b>${userProfile.roletype}<br><br>
           <b>Annual Salary:</b>${userProfile.salary}<br><br>
        </div>
        <div class="column">
         <b>Date of Birth:</b>${userProfile.dob}<br><br>
          <b>Gender:</b>${userProfile.gender}<br><br>
           <b>Permanent Address:</b>${userProfile.address}<br><br>
              <b>Hometown/City:</b>${userProfile.city}<br><br>
               <b>Zip:</b>${userProfile.zip}<br><br>
              <b>State:</b>${userProfile.state}<br><br>
       </div>
        <div class="colNew">hello deepak
        </div>
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