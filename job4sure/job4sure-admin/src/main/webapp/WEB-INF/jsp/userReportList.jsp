<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/pager.js"></script>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
 function searchByName(){
	
	 <c:forEach items="${list}" var="view">
	 $("#toMailId"+${view.registrationId}).hide();
   </c:forEach>  
   
 var textValue=document.getElementById('txtValue').value;
 
 textValue=textValue.toLowerCase();
    <c:forEach items="${list}" var="view">
    var res="${view.fullName}";
    res=res.toLowerCase();
     var status=0;
     var i=0;
  while(i<textValue.length){
  if(textValue.charAt(i)!=res.charAt(i)){ 
   status=1;
   break;
  }
  i++;
 }
  i=0;
 if(status==0){
	 $("#toMailId"+${view.registrationId}).show();
 }
    </c:forEach>  
} 
</script>
</head>
<body>
	<div id="cols" class="box">
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="http://all-free-download.com/free-website-templates/"><img
						src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="http://all-free-download.com/free-website-templates/"
					method="get" id="search">
					<fieldset>
						<legend>Search</legend>
						<p>
							<input type="text" size="17" name="" class="input-text" />
							&nbsp; <input type="submit" value="OK" class="input-submit-02" />
							<br /> <a href="javascript:toggle('search-options');"
								class="ico-drop">Advanced search</a>
						</p>
						<!-- Advanced search -->
						<div id="search-options" style="display: none;">
							<p>
								<label> <input type="checkbox" name="" checked="checked" />
									By Location
								</label> <br /> <label> <input type="checkbox" name="" /> By
									keywords
								</label> <br /> <label> <input type="checkbox" name="" /> By
									name
								</label>
							</p>
						</div>
						<!-- /search-options -->
					</fieldset>
				</form>
				<!-- Create a new project -->

			</div>
			<!-- /padding -->
			<ul class="box">
				<li><a
					href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
				<li><a
					href="http://all-free-download.com/free-website-templates/">Terms
						And Conditions</a></li>

				<li><a
					href="http://all-free-download.com/free-website-templates/">Contact
						Us</a></li>

				<li><a
					href="http://all-free-download.com/free-website-templates/">Leave
						Us Feedback</a></li>
			</ul>

			<!-- Active -->
		</div>
		<div>

			<form:form modelAttribute="UserProfile"   action="forSearch" method="POST">
				<table>
					<tr>
						<td><label align=left>search by name </label> 
						<input
							name="txtNamSer" type="text" id="txtNamSer"
							placeholder="Enter Name"></input></td>
						<!-- <td><label align=left>search by location</label> 
						<input  name="txtLocSer"
								 type="text" id="txtLocSer"
								placeholder="Search By Location"></input></td> -->

					<c:if  test="${list[0].roleType!=4}">
						<td><label align=left>search by State</label> 
						<select name="stateSearch">
                          <option value="0">Select</option>
                          <c:forEach items="${stateList}" var="state">
                          <option value="${state.stateId}">${state.stateName}</option>
                          </c:forEach>
                           </select></td>
                           
						<td><label align=left>search by location</label> 
						<form:select path="cityId.id"
							name="txtLocSer">
								<form:option value="0">Select</form:option>
								<c:forEach items="${cityList}" var="city">
									<form:option value="${city.id}">${city.cityname}</form:option>
								</c:forEach>
						</form:select></td>
						</c:if>

					<c:if  test="${list[0].roleType!=2&&list[0].roleType!=4}">
						<td><label align=left>search by experince</label> <input
							name="txtNamExp" type="text" id="txtExpSer"
							placeholder="Search By Exp"></input></td>
							
							</c:if>
					</tr>
					<tr>
						<td><input id="sub" type="submit"></input></td>
					</tr>
				</table>

			</form:form>
		</div>


      <c:if  test="${list[0].roleType==1}">
		<h1 align="center">User Report</h1>
	</c:if>
	<c:if  test="${list[0].roleType==2}">
	<h1 align="center">Company Report</h1>
	</c:if>
	<c:if  test="${list[0].roleType==4}">
	<h1 align="center">Sub Admin Report</h1>
	</c:if>
	
	
		 <c:if test="${!empty list}">
			<div align="center" id="toMailId${view.registrationId}">

				<table id=results width="1009" align="center"
					padding: 10px; style="background-color: 00CCFF; color: black; float: center-right">
					<tr>
						<th width="148" height="40"><div align="left">
								S.NO.</div></th>
						<th width="189"><div align="left">NAME</div></th>
						<th width="123"><div align="left">EMAIL</div></th>
						<th width="140"><div align="left">CONTACT NO.</div></th>

					</tr>
				</table>



				<table id=results width="1009" align="center"
					style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">
			
			<c:set var="count" value="0" scope="page" />
					<c:forEach items="${list}" var="view">
				
					<c:set var="count" value="${count + 1}" scope="page"/>
						<tr>
							<td width="148" height="40"><c:out
									value="${count}">
									
								</c:out></td>
							<td width="189"><c:out value="${view.fullName}">
									
								</c:out></td>
							<td width="123"><c:out value="${view.email}">
									
								</c:out></td>
							<td width="140"><c:out value="${view.mobileNo}">
									
								</c:out></td>

						</tr>
					</c:forEach>



				</table>


			</div>

		</c:if>

		<div align="center">
			<c:if test="${list!=null}">
				<div id="pageNavPosition" align="center"></div>
			</c:if>
		</div>
	</div>
</body>
<script>
	var pager = new Pager('results', 5);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(1);
</script>
</html>