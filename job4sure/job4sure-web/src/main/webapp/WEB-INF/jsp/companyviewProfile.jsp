<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
	<script src="resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<!-- <script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	 -->
	<script type="text/javascript">
jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine({
				onFormSuccess:formSuccess,
				onFormFailure:formFailure
			});
		});
		
		
function clearAllErrors() {
	$('#formID').validationEngine('hideAll');
}


		</script>
</head>
<body>
<form:form  modelAttribute="CompanyProfileModel" onsubmit="return myFunction()">
${companylist}
 <center>
   <table border="1">
    <tr>
      
     <th>companyName</th>
     <th>companySize</th>
     <th>companyAddress</th>
  
     <!-- <th>delete</th>
    <th>edit</th> -->
    </tr>
   
     <tr>
      
      <td>${companylist(0)}</td>
     <%--   <td>${companylist.companySize}</td>
        <td>${companylist.companyAddress}</td> --%>
      
   
   </table>
  </center>
</form:form>
</body>
<div></div>
</html>