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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</html>