<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/viewAllJobDesc.css" />
<script type="text/javascript" src="resources/js/paging.js"></script>
<script src="resources/js/jsp/companyProfile.js" type="text/javascript"
	charset="utf-8"></script>
<script src="resources/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function getCityList(data) {
		alert("gg");
		var stateId = document.getElementById(data.id).value;
		// alert(stateId);
		$
				.ajax({
					url : "getCityListByStateId.do?stateId=" + stateId,
					type : "GET",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var cityValues = response.cityList;
						$('#' + data.id + 'City').html('');// Empty select box before fill
						// data.without this line when i
						// fill, i got old data also.
						$('#' + data.id + 'City')// Due to above line all data is clear
						// so i add this line for "select city"
						// label.
						.append(
								$("<option value='" + 0 + "'></option>").text(
										"Select City"));
						for (i = 0; i < cityValues.length; i++) {
							$('#' + data.id + 'City')
									.append(
											$(
													"<option value='" + cityValues[i].id + "'></option>")
													.text(
															cityValues[i].cityname));
						}
					},
					error : function() {
						$('#' + data.id + 'City').append(
								$("<option value='0'></option>").text(
										'Select City'))
					}
				});
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

			<form:form action="userSearchList" modelAttribute="userProfile"
				method="POST">
				<table>
					<tr>
						<td><label align=left>Search by Name </label> <input
							name="searchByTitle" type="text" id="txtNamSer"
							placeholder="Enter Name"/></td>


						<td><label align=left>search by State</label> <form:select
								path="currentStateId.stateId" id="currentState"
								onchange="getCityList(this)">
								<form:option value="0">Select</form:option>
								<c:forEach items="${stateList}" var="state">
									<form:option value="${state.stateId}">${state.stateName}</form:option>
								</c:forEach>
							</form:select></td>



						<td><label align=left>search by City</label> <form:select
								path="cityId.id" id="currentStateCity">
								<form:option value="0">Select</form:option>
								<c:forEach items="${cityList}" var="city">
									<form:option value="${city.id}">${city.cityname}</form:option>
								</c:forEach>
							</form:select></td>



						<td><label align=left>search by experince</label> <form:select
								path="minExperience.experienceId" id="currentStateCity">
								<form:option value="0">Select</form:option>
								<c:forEach items="${experienceList}" var="exp">
									<form:option value="${exp.experienceId}">${exp.experience}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<td><input id="sub" type="submit"></input></td>
					</tr>
				</table>

			</form:form>
		</div>

		
			<c:if test="${!empty msg }">
				<td"><h3 align="left" style="color: red">
						<c:out value="${msg}"></c:out>
					</h3></td>
			</c:if>
		

		<h1 align="center">User LIST</h1>
		<c:if test="${!empty userList}">
			<div align="center">
				<table width="894" height="73"
					style="background-color: 00CCFF; color: black; padding: 10px; float: center-right">
					<tr>
						<th width="146"><div align="left">
								S.No.
								</td>
							</div>
						<th width="145"><div align="left">NAME</div></th>
						<th width="142"><div align="left">Email</div></th>
						<th width="142"><div align="left">Exprrince</div></th>
						<th width="145"><div align="left">Location</div></th>
						<!-- 	<th width="147"><div align="left">Skills</div></th> -->
					</tr>

				</table>

				<table id="results" width="894" height="73" align="center"
					border="1"
					style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">


					<c:forEach items="${userList}" var="view">
						<c:set var="count" value="${count + 1}" scope="page" />

						<tr>


							<td width="146"><c:out value="${count}">
									<div align="center"></div>
								</c:out></td>
							<td width="138"><c:out value="${view.registration.fullName}">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out value="${view.registration.email}">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out
									value="${view.minExperience.experience}-${view.maxExperience.experience }">
									<div align="center"></div>
								</c:out></td>
							<td width="142"><c:out value="${view.cityId.id}">
									<div align="center"></div>
								</c:out></td>


						</tr>

					</c:forEach>
				</table>
				<tr>
					<td><c:if test="${userList!=null}">
							<div id="pageNavPosition" align="center"></div>
						</c:if></td>
				</tr>

			</div>
		</c:if>
</body>
<script>
	var pager = new Pager('results', 5);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(0);
</script>

</html>