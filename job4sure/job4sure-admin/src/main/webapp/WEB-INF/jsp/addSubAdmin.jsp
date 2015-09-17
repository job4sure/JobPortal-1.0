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
   <script type="text/javascript" src="resources/js/verfyEmailId.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('input[name=roleType]').click(function() {
		if($(this).val() == "1") {
			$('#companyname').hide();
			$('#username').show();
			$('#companyemail').hide();
			$('#useremail').show();
			$('#Companyurl').hide();
			$('#urllabel').hide();
			$('#contactNo').hide();
			$('#mobileNo').show();
		} else {
			$('#username').hide();
			$('#companyname').show();
			$('#useremail').hide();
			$('#companyemail').show();
			$('#Companyurl').show();
			$('#urllabel').show();
			$('#mobileNo').hide();
			$('#contactNo').show();
		}
		document.getElementById("cpassword").value="";
		document.getElementById("password").value="";
		document.getElementById("fullName").value="";
		document.getElementById("email").value="";
		document.getElementById("mobileNo").value="";
	});
});
</script>
<!-- <script type="text/javascript">
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
</script> -->
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
<div id="main">

 
    <hr class="noscreen" />
  <!-- Columns -->
  <div id="cols" class="box">
    <!-- Aside (Left Column) -->
      <div id="aside" class="box">
      <div class="padding box">
        <!-- Logo (Max. width = 200px) -->
        <p id="logo"><a href="http://all-free-download.com/free-website-templates/"><img src="resources/tmp/logo.gif" alt="" /></a></p>
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
     
	</ul>
       
          <!-- Active -->
         
    
    </div>
    <!-- /aside -->
    
     <div id="content" class="box"><center>
  <h2>.....WELCOME.....</h2></center>
    </div>
    <hr class="noscreen" />
  <div id="content" class="box">
  
  <h3 style="color: red;">${message}</h3>
	<form:form method="POST" action="saveSubAdmin" modelAttribute="Registration" id="formID"  onsubmit="return jQuery(this).validationEngine('validate');">
	
			<div id="DivFree">
			<table class="nostyle">
				 	
					<tr>
						<td><label id="useremail">User Email*:</label><label id="companyemail" style="display: none;">Employee Email*:</label></td>
						<td><form:input type="text" size="40" path="email" id="email"
								class="validate[required,custom[email],maxSize[50]] input-text" maxlength="80"/>&nbsp&nbsp&nbsp&nbsp<span style="color: red"><form:errors path="email"></form:errors></span></td>
					</tr>
			        
					<tr>
						<td align="left"><input type="submit" value="submit"
							class="input-submit-02" onclick="jQuery('#formID').submit();" /></td>
					</tr>

				</table>
			</div>
		</p>
	</form:form>
	</div>
 </div>
 </div>
</body>
</html>