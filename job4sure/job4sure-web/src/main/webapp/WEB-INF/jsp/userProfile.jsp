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

<TABLE BORDER="5"    WIDTH="50%"   CELLPADDING="4" CELLSPACING="3">
   <TR>
      <TH COLSPAN="9"><BR><H3>User Basic Details</H3>
      </TH>
   </TR>
   <TR>
     <th>FirstName</th>
     <th>Email</th>
     <th>Contact No</th>
     <th>update</th>
                <!-- <TH>Delete</TH> -->
   </TR>
   <TR>
      <td>${registration.fullName}</td>
       <td>${registration.email}</td>
        <td>${registration.mobileNo}</td>
        <td><a href='updateBasicProfile?registrationId=${registration.registrationId}'
       onclick="return confirm('Are you sure you want to update this item?');">update your basic Profile</a>
      &nbsp;&nbsp;&nbsp;&nbsp; <a href="Complete_Profile">Complete Your Profile</a></td>
                <!--    <td><button ng-click="deleteCustomerDetails(info.registrationId);">Delete</button></td> -->
                  <!--  <td><a href="#" ng-click="deleteCustomerDetails(info.registrationId)">Delete</a></td> -->
   </TR>
</TABLE>
<TABLE BORDER="5"    WIDTH="50%"   CELLPADDING="4" CELLSPACING="3">
   <TR>
      <TH COLSPAN="9"><BR><H3>Usre Complete Details</H3>
      </TH>
   </TR>
   <TR>
      <TH>First Name</TH>
       <TH>Last Name</TH>
        <TH>Address</TH>
          <TH>City</TH>
            <TH>State</TH>
               <TH>Zip</TH>
              <TH>Update</TH>
   </TR>
   <TR >
       <TD>${userProfile.firstName}</TD>
      <TD>${userProfile.lastName}</TD>
        <TD>${userProfile.address}</TD>
          <TD>${userProfile.city}</TD>
            <TD>${userProfile.state}</TD>
              <TD>${userProfile.zip}</TD>
                  <td><a href='updateCompleteInfo?userId=${userProfile.userId}'
       onclick="return confirm('Are you sure you want to update this item?');">Update</a></td>
   </TR>
</TABLE>

</body>
</html>