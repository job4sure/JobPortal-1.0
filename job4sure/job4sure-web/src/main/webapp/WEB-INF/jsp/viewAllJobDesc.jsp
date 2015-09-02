<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Job Desc</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<body>

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
         <%--  <a href="deleteBatch.do?batchId=${cat.batchId}"
            onclick="return confirm('Please confirm if you want to delete this batch!');">Delete</a> --%>
        </display:column>
      </display:table>
      
      
</body>
</html>