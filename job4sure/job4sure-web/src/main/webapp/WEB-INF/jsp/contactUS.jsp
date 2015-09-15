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
<link rel="stylesheet" type="text/css"
	href="resources/css/viewAllJobDesc.css" />
<script type="text/javascript" src="resources/js/paging.js"></script>
<style>
html, body {
	/* //height: 50%; */
	margin: auto;
	padding: 0;
	width
	="40%";
}

#map {
	position: static;
	width: 772px;
	vertical-align: middle;
	height: 281px;
	padding-top: 47px;
	margin-left: 108px;
	margin-top: 95px;
	margin-right: 199px;
}

#rcorners1 {
	border-radius: 15px;
	border: 2px solid #6699FF;
}
</style>
<script>
	function initMap() {
		var myLatLng = {
			lat :  22.7257890,
			lng : 75.8934760
		};

		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16,
			center : myLatLng
		});

		var marker = new google.maps.Marker(
				{
					position : myLatLng,
					map : map,
					title : 'A/2, 3rd Floor, Classic Moon Building, Greater Kailash Road, Saket Square, Above Reliance Fresh, Old Palasia, Indore, Madhya Pradesh 452001'
				});
	}
</script>
</head>
<body>
	<div id="main">
		<!-- Menu -->
		<div id="menu" class="box">
			<center>
				<h1>JOB4SURE</h1>
			</center>
		</div>
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo">
					<a href="#"><img src="resources/tmp/logo.gif" alt="" /></a>
				</p>
				<!-- Search -->
				<form action="#" method="get" id="search">
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
			</div>
		</div>
		<div class="box" id="content">
			<center>
				<div id="map">
					<script async defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlJl3U-5ZeqSVk2J-1-p0ueua23zeleqQ&signed_in=true&callback=initMap"></script>
				</div>
				<br /> <br />
				<table class="nostyle">
					<tr>
						<td colspan="3"><input type="text" id="rcorners1"
							placeholder="Name" /> <input type="text" id="rcorners1"
							placeholder="Email" /> <input type="text" id="rcorners1"
							placeholder="Subject" /></td>
					</tr>
					<tr>
						<td><textarea rows="5" cols="60" id="rcorners1"
								placeholder="  Message"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Save"
							style="width: 5em; height: 2em; font-size: large; color: #6699FF">
					</tr>
				</table>
			</center>
		</div>
	</div>
</body>
</html>