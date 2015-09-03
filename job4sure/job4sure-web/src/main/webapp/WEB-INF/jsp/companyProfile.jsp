<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Company Profile</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
</head>
<body>
<form:form method="POST" action="savecompanyProfile" modelAttribute="companyprofile">
<div id="main">
 
  <h2>company Profile</h2>
  <table>
  <tr>
	<td>Company name*:</td>
	<td><form:input type="text" size="40" path="companyName"/>
	</td>
	<%-- <tr>
	<td>Company Logo:</td>
	<td><form:input type="text" size="40" path="companylogo"/></td>
	</tr> --%>
	<tr>
	<td>Company size*:</td>
	<td><select name="companySize">
  <option value="5-10">5-10</option>
  <option value="10-50">10-50</option>
  <option value="50-100">50-100</option>
  <option value="100 & above">100 & above</option>
</select>
	
	<tr><td>About Us:</td>
	<td>
	<form:textarea path="aboutUs"/>
	</td>
	</tr>
	<!-- <tr><td>Domain*:</td>
	<td> <div class="multiselect">
        <div class="selectBox" onclick="showCheckboxes()">
            <select name="Domain">
                <option>Select an option</option>
            </select>
            <div class="overSelect"></div>
        </div>
        <div id="checkboxes">
            <label for="one"><input type="checkbox" value="IT"/>IT</label>
            <label for="two"><input type="checkbox" value="Finance"/>Finance </label>
            <label for="three"><input type="checkbox" value="Management"/>Management</label>
			<label for="one"><input type="checkbox" value="CA"/>CA</label>
            <label for="two"><input type="checkbox" value="Medical"/>Medical </label>
            <label for="three"><input type="checkbox"value="Agriculture"/>Agriculture</label>
			<label for="one"><input type="checkbox" value="Interior Designer"/>Interior Designer</label>
            <label for="two"><input type="checkbox" value="Architecture"/>Architecture</label>
            <label for="three"><input type="checkbox" value="Engineering"/>Engineering</label>
        </div>
        
    </div>
    
	</td>
	</tr>
	<tr> -->
	<tr>
	<td>Domain</td>
	<td><form:select path="Domain">
                  <form:option value="Select" label="Select" />
                  <form:option value="IT" label="IT" />
                  <form:option value="MANAGER" label="MANAGER" />
                </form:select></td></tr>
                <tr>
	<td>Company URL*:</td>
	<td><form:input path="companyUrl"/></td>
	</tr>
	<tr><td>Address1*:</td>
	<td><form:input path="address1"/></td>
	</tr>
	<tr><td>Address2*:</td>
	<td><form:input path="address2"/></td>
	</tr>
	<tr><td>City*:</td>
	<td><form:input path="city"/></td>
	</tr>
	<tr><td>State*:</td>
	<td><form:input path="state"/></td>
	</tr>
	<tr><td>ZipCode*:</td>
	<td><form:input path="zipcode"/></td>
	</tr>
	<tr><td><input type="submit" value="submit"/></td></tr>
	
  </table>
  
  </div>
  </form:form>
</body>
</html>