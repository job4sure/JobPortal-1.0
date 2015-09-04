<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/verfyEmailId.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('input[name=rollType]').click(function() {
		if($(this).val() == "1") {
			$('#companyname').hide();
			$('#username').show();
			$('#companyemail').hide();
			$('#useremail').show();
			$('#Companyurl').hide();
			$('#urllabel').hide();
		} else {
			$('#username').hide();
			$('#companyname').show();
			$('#useremail').hide();
			$('#companyemail').show();
			$('#Companyurl').show();
			$('#urllabel').show();
		
		}
		document.getElementById("cpassword").value="";
		document.getElementById("password").value="";
		document.getElementById("fullName").value="";
		document.getElementById("email").value="";
		document.getElementById("mobileNo").value="";
	});
});
</script>
<script type="text/javascript">
function myFunction() {
    var password = document.getElementById("password").value;
    var cpassword = document.getElementById("cpassword").value;
    var ok = true;
    if (password != cpassword) {
        document.getElementById('error').innerHTML = "wrong confirm password";
        ok = false;
    }
    return ok;
}
</script>
</head>
<body>
<div id="main">
  <div id="tray" class="box">
     <h1 align="center">Regisration Form</h1>
  </div>
 
  <hr class="noscreen" />
 
  <div id="menu" class="box">
 
    <ul class="box">
  
    </ul>
  </div>
	<form:form method="POST" action="saveRegistration" modelAttribute="Registration" onsubmit="return myFunction()">
	<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	<form:hidden path="registrationId"/>
		<input type="radio" name="rollType" value="1" checked />Jobseeker 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="rollType" value="2" />Employer
			<div id="DivFree">
			<table>
					<tr>
						<td style="width: 150px;"><label id="username">Full Name*:</label><label id="companyname" style="display: none;">CompanyName*:</label></td>
						<td><form:input type="text" size="30" path="fullName"
								class="input-text" required="autofocus" maxlength="80" id="fullName"/></td>
					</tr>

					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label id="useremail">User Email*:</label><label id="companyemail" style="display: none;">Company Email*:</label></td>
						<td><form:input type="text" size="40" path="email" id="email"
								class="input-text" required="autofocus" maxlength="80" onblur="emailVarification(this);"/>&nbsp&nbsp&nbsp&nbsp<span style="color: red"><form:errors path="email"></form:errors></span></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					
					<tr>
						<td>Password*:</td>
						<td><form:input type="password" size="40" path="password"
								class="input-text" required="autofocus" maxlength="12" id="password"/></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Conform Password*:</td>
						<td><form:input type="password" size="40" path="conformPassword" 
								class="input-text" id="cpassword" required="autofocus" maxlength="12"/>&nbsp&nbsp&nbsp&nbsp<span id="error" style="color:#F00;"/></td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
					</tr>
					
					<tr>
						<td>Mobile No.*:</td>
						<td><form:input type="text" size="40" path="mobileNo"
								class="input-text" required="autofocus" maxlength="10" id="mobileNo"/>&nbsp&nbsp&nbsp&nbsp<span style="color: red"><form:errors path="mobileNo"></form:errors></span><br></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					
			
					<tr>
					
						<td><div id="urllabel" style="display: none;">Company Url*:</div></td>
					
						<td><div id="Companyurl" style="display: none;"><form:input type="text" size="40" path="Companyurl"
								class="input-text" maxlength="80"/></div></td>
							
					</tr>
		
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="submit" value="submit"
							class="input-submit-02"/></td>
					</tr>

				</table>
			</div>
		</p>
	</form:form>
 </div>
</body>
</html>