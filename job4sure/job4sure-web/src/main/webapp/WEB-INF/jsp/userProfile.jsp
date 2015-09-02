<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Complete_Profile">UserProfile</a>
  <center>
   <table border="1">
    <tr>
      
     <th>FirstName</th>
     <th>Email</th>
     <th>Contact No</th>
     <th>update</th>
     <!-- <th>delete</th>
    <th>edit</th> -->
    </tr>
   
     <tr>
      <%-- <td>${contact.id}</td> --%>
      <td>${registration.fullName}</td>
       <td>${registration.email}</td>
        <td>${registration.mobileNo}</td>
        <td><a href='updateBasicProfile?registrationId=${registration.registrationId}'
       onclick="return confirm('Are you sure you want to update this item?');">update</a></td>
     </tr>

   
   </table>
  </center>

</body>
</html>