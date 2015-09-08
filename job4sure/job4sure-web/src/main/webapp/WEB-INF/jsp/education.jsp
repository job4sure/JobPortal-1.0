<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="resources/css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="resources/css/style.css" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/switcher.js"></script>
<script type="text/javascript" src="resources/js/toggle.js"></script>
<script type="text/javascript" src="resources/js/ui.core.js"></script>
<script type="text/javascript" src="resources/js/ui.tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
</head>
<body>
<form:form action="edusave" method="POST" id="formID" 
		modelAttribute="ED">
<table>
<tr>
<td>
<font color="red">*</font>Basic/Graduation
</td>
<td>
<form:select path="graduation">
<form:option value="BE/BTECH">BE/BTECH</form:option>
<form:option value="BSc">BSc</form:option>
<form:option value="Bcom">Bcom</form:option></form:select>

</td>
</tr>
<br>
 <tr>
<td><form:radiobutton  path="education" value="Full Time"/>Full Time<br></td>
<td><form:radiobutton  path="education" value="Part Time"/>Part Time</td>
<td><form:radiobutton path="education" value="Correspondance/Distance learning"/>Correspondance/Distance learning</td>
</tr> 
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Specialization
</td>
<td>
<form:select path="specialization">
<form:option value="Automobile">Automobile</form:option>
<form:option value="Aviation">Aviation</form:option>
<form:option value="Agriculture">Agriculture</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>University/Institute
</td>
<td>
<form:select path="institute">
<form:option value="LPU">LPU</form:option>
<form:option value="RGPV">RGPV</form:option>
<form:option value="Punjab University">Punjab University</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Year
</td>
<td>
<form:select path="yearr">
<form:option value="2012">2012</form:option>
<form:option value="2013">2013</form:option>
<form:option value="2014">2014</form:option>
<form:option value="2015">2015</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
-------------------------------------------------------------------------------
</tr>
<tr>
<td>
<font color="red">*</font>Post Graduation
</td>
<td>
<form:select path="postgraduation">
<form:option value="ME/MTECH">ME/MTECH</form:option>
<form:option value="MSc">MSc</form:option>
<form:option value="Mcom">Mcom</form:option></form:select>

</td>
</tr>
<br>
<br>

<br>
<br>
 <tr>
<td><form:radiobutton  path="posteducation" value="Full Time"/>Full Time<br></td>
<td><form:radiobutton  path="posteducation" value="Part Time"/>Part Time</td>
<td><form:radiobutton path="posteducation" value="Correspondance/Distance learning"/>Correspondance/Distance learning</td>
</tr> 
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Specialization
</td>
<td>
<form:select path="post_specialization">
<form:option value="Automobile">Automobile</form:option>
<form:option value="Aviation">Aviation</form:option>
<form:option value="Agriculture">Agriculture</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>University/Institute
</td>
<td>
<form:select path="post_institute">
<form:option value="LPU">LPU</form:option>
<form:option value="RGPV">RGPV</form:option>
<form:option value="Punjab University">Punjab University</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Year
</td>
<td>
<form:select path="post_yearr">
<form:option value="2012">2012</form:option>
<form:option value="2013">2013</form:option>
<form:option value="2014">2014</form:option>
<form:option value="2015">2015</form:option>
</form:select>
</td>
</tr>

<br>
<br>

<br>
<br>
<tr>
-------------------------------------------------------------------------------
</tr>
<tr>
<td>
<font color="red">*</font>PhD/Doctorate
</td>
<td>
<form:select path="doctorate">
<form:option value="MPHIL">MPHIL</form:option>
<form:option value="Other">Other</form:option>
</form:select>

</td>
</tr>
<br>
<br>

<br>
<br>
 <tr>
<td><form:radiobutton  path="doc_education" value="Full Time"/>Full Time<br></td>
<td><form:radiobutton  path="doc_education" value="Part Time"/>Part Time</td>
<td><form:radiobutton path="doc_education" value="Correspondance/Distance learning"/>Correspondance/Distance learning</td>
</tr> 
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Specialization
</td>
<td>
<form:select path="doc_specialization">
<form:option value="Automobile">Automobile</form:option>
<form:option value="Aviation">Aviation</form:option>
<form:option value="Agriculture">Agriculture</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>University/Institute
</td>
<td>
<form:select path="doc_institute">
<form:option value="IIT">LPU</form:option>
<form:option value="NIT">RGPV</form:option>
<form:option value="IIM">Punjab University</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td>
<font color="red">*</font>Year
</td>
<td>
<form:select path="doc_yearr">
<form:option value="2012">2012</form:option>
<form:option value="2013">2013</form:option>
<form:option value="2014">2014</form:option>
<form:option value="2015">2015</form:option>
</form:select>
</td>
</tr>
<br>
<br>

<br>
<br>
<tr>
<td><input type="submit" value="update">

</td></tr>

</table>
</form:form>
</body>
</html>