<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Job Desc</title>
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
	
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<body>
<div id="main">
   
  <hr class="noscreen" />
 
  <div id="menu" class="box">
  	
    <ul class="box">
     
      <li id="menu-active"><a href="createJobDescription"><span>Create Job Description</span></a></li>
	  <li id="menu-active"><a href="viewAllJobDescription"><span>View Job Description List</span></a></li>
	  <li id="menu-active"><a href="comp"><span>Company Home Page</span></a></li>
	
    </ul>
  </div>
 </div>
    <h3 style="color: red;">${message}</h3>
 <c:set var="count" value="0" scope="page" />
      <display:table name="jobList" pagesize="8"  class="basic-table" uid="job">
        <c:set var="count" value="${count+1}" scope="page" />
        <display:column title="S.NO" >
     ${count}
    </display:column>
        <display:column property="jobTitle" title="JOB TITLE" />
        <display:column property="jobDesc" title="JOB DESCRIPTION" />
        
        <display:column property="jobLocation" title="JOB LOCATION" />
        <display:column property="salary" title="SALARY" />
        <display:column property="noOfCandidates" title="REQUIRED CANDIDATES" />
        <display:column property="postedDate" title="POSTED DATE" />
        <display:column property="jobValidDate" title="LAST DATE" />
        <display:column property="experience" title="EXPERIENCE" />
        <display:column property="education" title="EDUCATION" />
        <display:column property="skills" title="SKILLS" />
        
        <display:column property="role" title="ROLE" />
 
        
        
        
        <display:column title="Edit">
         <%--  <a href="saveBatch.do?batchId=${cat.batchId}">Edit</a> --%>
        </display:column>
        <display:column title="Delete">
          <a href="deleteJob.do?jobDescriptionId=${job.jobDescriptionId}">Delete</a>
        </display:column>
      </display:table>
      
      
</body>
</html>