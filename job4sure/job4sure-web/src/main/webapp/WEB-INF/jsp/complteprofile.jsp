<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
	<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
   <link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
   <script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript" src="resources/js/verfyEmailId.js"></script>
<title>Insert title here</title>
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
<div id="main">
  
 
 
  <hr class="noscreen" />
 
  
     <hr class="noscreen" />
  <!-- Columns -->
  <div id="cols" class="box">
    <!-- Aside (Left Column) -->
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
          <!-- Advanced search -->
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
              By Location</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By keywords</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By name</label>
            </p>
          </div> 
          <!-- /search-options -->
          </fieldset>
        </form>
        <!-- Create a new project -->
      
      </div>
      <!-- /padding -->
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
		
		<li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
		<li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
       
          <!-- Active -->
        
   
    </div>
<body align="center">

 <h3 style="color: red;">${message}</h3>
 
<form:form method="POST" action="savecomplete_profile" modelAttribute="userProfile"  id="formID"  onsubmit="return jQuery(this).validationEngine('validate');">


<table>
			 <form:hidden path="userId"/>
				<%-- 	<tr>
						<td>firstName*:</td>
						<td><form:input type="text" size="40" path="firstName"
								class="validate[required] input-text" maxlength="12"/></td>
					</tr> --%>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<%-- <tr>
						<td>lastName*:</td>
						<td><form:input type="text" size="40" path="lastName"
								class="validate[required] input-text" id="lastName" maxlength="12"/></td>
					</tr> --%>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					
					<tr>
						<td>address.*:</td>
						<td><form:input type="text" size="40" path="address"
								class="validate[required] input-text" maxlength="10"/><br></td>
					</tr>
					
					
					
					<tr>
						<td>city.*:</td>
						<td><form:input type="text" size="40" path="city"
								class="validate[required] input-text" maxlength="10"/><br></td>
					</tr>
					
					
					<tr>
						<td>State.*:</td>
						<td><form:input type="text" size="40" path="State"
								class="validate[required] input-text"  maxlength="10"/><br></td>
					</tr>
					
					<tr>
						<td>zip.*:</td>
						<td><form:input type="text" size="40" path="zip"
								class="validate[required] input-text" maxlength="10"/><br></td>
					</tr>
					
					
				 
					<tr>
						<td><input type="submit" value="submit"
							class="input-submit-02" onclick="return confirm('Are you sure you want to update this item?');jQuery('#formID').submit();" /></td>
					</tr>

				</table>


</form:form>
</body>
</div></div>
</html>