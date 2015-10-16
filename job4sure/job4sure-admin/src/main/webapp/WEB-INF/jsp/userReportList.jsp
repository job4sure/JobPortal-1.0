<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/pager.js"></script>
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
						<input type="text" size="17" name="" class="input-text" /> &nbsp;
						<input type="submit" value="OK" class="input-submit-02" /> <br />
						<a href="javascript:toggle('search-options');" class="ico-drop">Advanced
							search</a>
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



			
	<h1 align="center">USER LIST</h1>
	
	<c:if test="${!empty userList}">
		<div align="center">

		<table id=results width="1009" align="center" padding: 10px; style="background-color: 00CCFF; color: black; float: center-right" >
				<tr>
					<th width="148" height="40"><div align="left">
							REGISTRATION_ID</div></th>
					<th width="189"><div align="left">FULL_NAME</div></th>
					<th width="123"><div align="left">EMAIL</div></th>
					<th width="140"><div align="left">MOBILE_NO</div></th>
				
				</tr>
				</table>

	

			<table  id=results width="1009"  align="center"  style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right">
				
				<c:forEach items="${userList}" var="view">
					<tr >
						<td width="148" height="40"><c:out value="${view.registrationId}">
								<div align="center"></div>
							</c:out></td>
						<td width="189"><c:out value="${view.fullName}">
								<div align="center"></div>
							</c:out></td>
						<td width="123"><c:out value="${view.email}">
								<div align="center"></div>
							</c:out></td>
						<td width="140"><c:out value="${view.mobileNo}">
								<div align="center"></div>
							</c:out></td>
						
					</tr>
				</c:forEach>



			</table>


		</div>

	</c:if>


	<div align="center">
		<c:if test="${userList!=null}">
			<div id="pageNavPosition" align="center"></div>
		</c:if>
	</div>

</body>
<script>
	var pager = new Pager('results', 5);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(1);
</script>
</html>