<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	});
});
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
	
	<form:form method="POST" action="saveRegistration" modelAttribute="Registration">
	<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
		<input type="radio" name="rollType" value="1" checked />Jobseeker 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="rollType" value="2" />Employer
			<div id="DivFree">
			<table>
					<tr>
						<td style="width: 150px;"><label id="username">Full Name*:</label><label id="companyname" style="display: none;">CompanyName*:</label></td>
						<td><form:input type="text" size="30" path="fullName"
								class="input-text" required="autofocus" maxlength="80"/></td>
					</tr>

					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<form:errors path="email"></form:errors>
					<tr>
						<td><label id="useremail">User Email*:</label><label id="companyemail" style="display: none;">Company Email*:</label></td>
						<td><form:input type="text" size="40" path="email"
								class="input-text" required="autofocus" maxlength="80"/></td>
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
						<td><form:input type="text" size="40" path="password"
								class="input-text" required="autofocus" maxlength="12"/></td>
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
						<td><form:input type="text" size="40" path="conformPassword"
								class="input-text" id="conformPassword" required="autofocus" maxlength="12"/></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<form:errors path="mobileNo"></form:errors>
					<tr>
						<td>Mobile No.*:</td>
						<td><form:input type="text" size="40" path="mobileNo"
								class="input-text" required="autofocus" maxlength="10"/><br></td>
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