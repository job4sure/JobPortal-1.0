<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
function getCityList(data) {
alert("gg");
	var stateId = document.getElementById(data.id).value;
	// alert(stateId);
	$.ajax({
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
					$("<option value='" + 0 + "'></option>")
							.text("Select City"));
			for (i = 0; i < cityValues.length; i++) {
				$('#' + data.id + 'City').append(
						$("<option value='" + cityValues[i].id + "'></option>")
								.text(cityValues[i].cityname));
			}
		},
		error : function() {
			$('#' + data.id + 'City').append(
					$("<option value='0'></option>").text('Select City'))
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
					<a href="http://all-free-download.com/free-website-templates/"><img src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="http://all-free-download.com/free-website-templates/" method="get" id="search">
					<fieldset>
						<legend>Search</legend>
						<p>
							<input type="text" size="17" name="" class="input-text" /> &nbsp; <input type="submit" value="OK"
								class="input-submit-02" /> <br /> <a href="javascript:toggle('search-options');" class="ico-drop">Advanced
								search</a>
						</p>
						<!-- Advanced search -->
						<div id="search-options" style="display: none;">
							<p>
								<label> <input type="checkbox" name="" checked="checked" /> By Location
								</label> <br /> <label> <input type="checkbox" name="" /> By keywords
								</label> <br /> <label> <input type="checkbox" name="" /> By name
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
				<li><a href="http://all-free-download.com/free-website-templates/">Privacy</a></li>
				<li><a href="http://all-free-download.com/free-website-templates/">Terms And Conditions</a></li>

				<li><a href="http://all-free-download.com/free-website-templates/">Contact Us</a></li>

				<li><a href="http://all-free-download.com/free-website-templates/">Leave Us Feedback</a></li>
			</ul>

			<!-- Active -->
		</div>
		<div>

			<form:form modelAttribute="JobDescription" action="searchForJd" method="POST">
				<table>
					<tr>
						<td><label align=left>Search by Job Title </label> <input name="searchByTitle" type="text" id="txtNamSer"
							placeholder="Enter Name"></input></td>
						<td><label align=left>Search by State</label> <select name="stateSearch" id="currentState" onchange="getCityList(this)">
								<option value="0">Select state</option>
								<c:forEach items="${stateList}" var="state">
									<option value="${state.stateId}">${state.stateName}</option>
								</c:forEach>
						</select></td>

						<td><label align=left></label> Search by City<select  name="searchByLocation" id="currentStateCity">
								<option value="0">Select city</option>
								<c:forEach items="${cityList}" var="city">
									<option value="${city.cityname}">${city.cityname}</option>
								</c:forEach>
							</select></td>
						<td><label align=left>Search by Experince</label> <input name="searchByExp" type="text" id="txtExpSer"
							placeholder="Search By Exp"></input></td>
							
					</tr>
					<tr></tr><tr></tr>
					<tr>
					<td><input id="sub" type="submit"></input></td><td></td><td></td><td></td>
						<h3 style="color: red;">${message}</h3>
					</tr>
					
					<tr>
					<td><a href="listOfJd.do"><input id="sub" value="Show All JD's" type="button"></input></a></td><td></td><td></td><td></td>
						
					</tr>
				</table>

			</form:form>
		</div>
		<h1 align="center">${title}</h1>
		<c:if test="${!empty list}">
			<div align="center" id="toMailId${view.jobDescriptionId}">

				<table id=results width="1009" align="center"
					padding: 10px; style="background-color: 00CCFF; color: black; float: center-right">
					<tr>
						<th width="148" height="40"><div align="left">S.NO.</div></th>
						<th width="189"><div align="left">Job title</div></th>
						<th width="140"><div align="left">company</div></th>
						<th width="140"><div align="left">experience</div></th>
						<th width="140"><div align="left">location</div></th>
					</tr>
				</table>
				<table id=results width="1009" align="center"
					style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">
					<c:set var="count" value="0" scope="page" />
					<c:forEach items="${list}" var="view">

						<c:set var="count" value="${count + 1}" scope="page" />
						<tr>
							<td width="148" height="40"><c:out value="${count}">
								</c:out></td>
							<td width="189"><c:out value="${view.jobTitle}">
								</c:out></td>
							<td width="140"><c:out value="${view.registration.fullName}">
								</c:out></td>
							<td width="140"><c:out value="${view.minExperience.experience}-${view.maxExperience.experience }">
								</c:out></td>
								<td width="140"><c:out value="${view.currentCityId.cityname}">
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