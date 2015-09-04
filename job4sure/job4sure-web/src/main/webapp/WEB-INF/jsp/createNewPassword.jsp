<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	
	<script type="text/javascript">
	function checkPass(){
		
		var password=document.getElementById('password').value;
		var re_password=document.getElementById('re_password').value;
		if(password==re_password){
			document.getElementById('passMissMatch').innerHTML=" ";
			return true;
		}

		document.getElementById('passMissMatch').innerHTML="Password miss match!!";
		return false;
	}
	
	
	</script>
</head>
<body onload='document.loginForm.username.focus();'>


<div id="cols" class="box">

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
        <li><a href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="http://all-free-download.com/free-website-templates/">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="http://all-free-download.com/free-website-templates/">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="http://all-free-download.com/free-website-templates/">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		</ul>
	
          <!-- Active -->
         
    
    </div>

  <!-- Columns -->
 
    <!-- Aside (Left Column) -->
      
    <!-- /aside -->
    <hr class="noscreen" />
    <!-- Content (Right Column) -->
    <center><h2>Profile</h2></center>
    <div id="content" class="box">
    <fieldset>
   
	<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

      <div class="msg">${message}</div>
      <div class="msg"><label id="passMissMatch"></label></div>
      <form:form method="POST" action="updatePassword" modelAttribute="registration">
      <form:hidden path="registrationId"/>
      <table class="nostyle">
       <tr>
          <td style="width:70px;" >New Password:</td>
          <td><form:password size="40" path="password" id="password" class="input-text" required="autofocus" maxlength="80"/></td>
        </tr>
         <tr>
          <td style="width:70px;" >confirm Password:</td>
          <td><input type="password" size="40" id="re_password" class="input-text" /></td>
        </tr>
        <tr><td>
	        <input type="submit" class="input-submit" value="submit" onclick="return checkPass()" /></td>
		</tr>
        <tr><td><a href="OpenloginPage">Login</a></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><a href="registration">SignUp</a></td>
       </tr>
      </table>
	</form:form>
     
		 </fieldset>
     
    </div>
    <!-- /content -->
  </div>
  
  <!-- /cols -->
  <hr class="noscreen" />

</body>
 
</html>
