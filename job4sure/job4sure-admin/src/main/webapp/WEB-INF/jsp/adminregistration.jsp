<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
	<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
   <link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
   <script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
   
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
 <div id="content" class="box">
 <center>
  <h2>ADMIN REGISTRATION PAGE</h2></center>
    </div>
    <hr class="noscreen" />
  <div id="content" class="box">
 
	<form:form method="POST" action="saveRegistration" modelAttribute="Registration" id="formID"  onsubmit="return jQuery(this).validationEngine('validate');">
	<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
 	<p>
		</p>          
			<div id="DivFree">
			<table class="nostyle">
				 	<tr>
						<td style="width: 150px;"><label id="adminname">Full Name*:</label></td>
						<td><form:input type="text" size="40" path="fullName"
								class="validate[required] input-text" maxlength="80" id="fullName"/></td>
					</tr> <tr>
			 			<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label id="useremail">User Email*:</label></td>
						<td><form:input type="text" size="40" path="email" id="email"
								class="validate[required,custom[email],maxSize[50]] input-text" maxlength="80" onblur="emailVarification(this);"/>&nbsp&nbsp&nbsp&nbsp<span style="color: red"><form:errors path="email"></form:errors></span></td>
					</tr>
			        <tr>
			 			<td></td>
						<td></td>
					</tr>
					
					<tr>
						<td>Password*:</td>
						<td><form:input type="password" size="40" path="password"
								class="validate[required,minSize[5],maxSize[12]] input-text" maxlength="12" id="password"/></td>
					</tr>
			        <tr>
			 			<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Confirm Password*:</td>
						<td><form:input type="password" size="40" path="conformPassword" 
								class="validate[required,equals[password]] input-text" id="cpassword" maxlength="12"/>&nbsp&nbsp&nbsp&nbsp<span id="error" style="color:#F00;"/></td>
					</tr>
					<tr>
			 			<td></td>
						<td></td>
					</tr>
					<tr>
					<td><label id="mobileNo">Mobile Number.*:</label><label id="contactNo" style="display: none;">Contact Number.*:</label></td>
						<td><form:input type="text" size="40" path="mobileNo"
								class="validate[required,custom[phone],minSize[10],maxSize[10]] input-text" maxlength="10" id="mobileNo"/>&nbsp&nbsp&nbsp&nbsp<span style="color: red"><form:errors path="mobileNo"></form:errors></span><br></td>
					</tr>
			         <tr>
						<td align="left"><input type="submit" value="submit"
							class="input-submit-02" onclick="jQuery('#formID').submit();" /></td>
					</tr>

				</table>
			</div>
			</form:form>
</body>
</html>