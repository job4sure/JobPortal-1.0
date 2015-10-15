<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<h1 align="center"> Company LIST</h1>
<c:if test="${!empty companyList}">
  <div align="center">
    <table width="894" height="73" align="center" border="1">
      <tr>
        <th width="143" height="40"><div align="left">COMPANY ID
            </td>
        </div>
        <th width="122"><div align="left">DOMAIN</div></th>
        <th width="125"><div align="left">ABOUT US</div></th>
        <th width="106"><div align="left">ADDRESS</div></th>
        <th width="184"><div align="left">COMPANY SIZE</div></th>
        <th width="186"><div align="left">COMPANY URL</div></th>
      </tr>
      <c:forEach items="${companyList}" var="view">
        <tr>
          <td><c:out value="${view.compId}"> 
            <div align="center"></div>
          </c:out></td>
          <td><c:out value="${view.domainName}"> 
            <div align="center"></div>
          </c:out></td>
          <td><c:out value="${view.aboutUs}"> 
            <div align="center"></div>
          </c:out></td>
          <td><c:out value="${view.address1}"> 
            <div align="center"></div>
          </c:out></td>
          <td><c:out value="${view.companySize}"> 
            <div align="center"></div>
          </c:out></td>
          <td><c:out value="${view.companyUrl}"> 
            <div align="center"></div>
          </c:out></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</c:if>
</body>
</html>