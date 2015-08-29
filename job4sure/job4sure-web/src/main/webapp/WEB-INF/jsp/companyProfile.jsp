<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title> Profile</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
	<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
   <link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
   <script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
 
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/switcher.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	<style>
    .multiselect {
        width: 200px;
    }
    .selectBox {
        position: relative;
    }
    .selectBox select {
        width: 100%;
        font-weight: bold;
    }
    .overSelect {
        position: absolute;
        left: 0; right: 0; top: 0; bottom: 0;
    }
    #checkboxes {
        display: none;
        border: 1px #dadada solid;
    }
    #checkboxes label {
        display: block;
    }
    #checkboxes label:hover {
        background-color: #1e90ff;
    }
</style>
<script>
    var expanded = false;
    function showCheckboxes() {
        var checkboxes = document.getElementById("checkboxes");
        if (!expanded) {
            checkboxes.style.display = "block";
            expanded = true;
        } else {
            checkboxes.style.display = "none";
            expanded = false;
        }
    }
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
<body>
<form:form method="POST" action="saveCompanyCompleteProfile" modelAttribute="companyProfile" id="formID" onsubmit="return jQuery(this).validationEngine('validate');">
<div id="main">
  <hr class="noscreen" />
 <form:hidden path="compId"/>
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
     
		</ul>
    </div><center><h2>Company Profile</h2></center>
    <h3 style="color: red;">${message}</h3>
    <div id="content" class="box">
  <table>
  <form:hidden path="registrationId"/>
  <tr>
	<%-- <td>Company name*:</td>
	<td><form:input type="text" size="40" path="companyName"/>
	</td> --%>
	<%-- <tr>
	<td>Company Logo:</td>
	<td><form:input type="text" size="40" path="companylogo"/></td>
	</tr> --%>
	<tr>
	<td>Company size*:</td>
	<td><select name="companySize"  class="validate[required]">
  <option value="5-10">5-10</option>
  <option value="10-50">10-50</option>
  <option value="50-100">50-100</option>
  <option value="100 & above">100 & above</option>
</select>
	 
	<tr><td>About Us:</td>
	<td>
	<form:textarea path="aboutUs"  class="validate[required]"/>
	</td>
	</tr>
	
	<tr>
	<td>Domain</td>
	<td><form:select path="Domain"  class="validate[required]">
                  <form:option value="Select" label="Select" />
                  <form:option value="IT" label="IT" />
                  <form:option value="MANAGER" label="MANAGER" />
                </form:select></td></tr>
                <tr>
	<td>Company URL*:</td>
	<td><form:input path="companyUrl" class="validate[required] text-input"/></td>
	</tr>
	<tr><td>Address1*:</td>
	<td><form:input path="address1" class="validate[required,minSize[5],maxSize[300]] input-text"/></td>
	</tr>
	<tr><td>Address2*:</td>
	<td><form:input path="address2" class="validate[required,minSize[5],maxSize[300]] input-text"/></td>
	</tr>
	<tr><td>City*:</td>
	<td><form:input path="city" class="validate[required] input-text"/></td>
	</tr>
	<tr><td>State*:</td>
	<td><form:input path="state" class="validate[required] input-text"/></td>
	</tr>
	<tr><td>ZipCode*:</td>
	<td><form:input path="zipcode" class="validate[required] input-text"/></td>
	</tr>
	<tr><td><input type="submit" value="submit" onclick="jQuery('#formID').submit();"/></td></tr>
	
  </table>
    </div>
    </div>
    
  </div>
  </form:form>
</body>
</html> 