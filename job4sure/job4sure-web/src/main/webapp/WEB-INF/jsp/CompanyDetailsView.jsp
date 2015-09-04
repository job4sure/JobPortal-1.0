<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Job4Sure</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/switcher.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.tabs.js"></script>
   <link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
</style>
</head>
<body>
 
  <hr class="noscreen" />
  
     <hr class="noscreen" />
  <!-- Columns -->
  <div id="cols" class="box">
    <!-- Aside (Left Column) -->
    <div id="aside" class="box">
      <div class="padding box">
        <!-- Logo (Max. width = 200px) -->
        <p id="logo"><a href="http://all-free-download.com/free-website-templates/"><img src="resources/design/logo.gif" alt="" /></a></p>
        <!-- Search -->
        <form action="http://all-free-download.com/free-website-templates/" method="get" id="search">
          <fieldset>
          
          <legend>Search</legend>
          <p>
            <input type="text" size="17" name="" class="input-text" />
            &nbsp;
            <input type="submit" value="OK" class="input-submit-02" />
            <br />
            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>
          <!-- Advanced search -->
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
              By Location</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By keywords</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              By name</label>
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
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="http://all-free-download.com/free-website-templates/">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="http://all-free-download.com/free-website-templates/">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="http://all-free-download.com/free-website-templates/">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp 
		&nbsp
		
		<li><a href="http://all-free-download.com/free-website-templates/"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="http://all-free-download.com/free-website-templates/"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
		<li><a href="http://all-free-download.com/free-website-templates/"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="http://all-free-download.com/free-website-templates/"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
       
          <!-- Active -->
        
   
    </div>
    <center><h2>Company Profile</h2></center>
    <div id="content" class="box">
   
    <%--  ${companyProfile.companyName} --%>
     <table style="width:80%">
  <tr>
    <td>CompanyName</td>
    <td>Address</td>		
    <td>City</td>
     <td>State</td>
    <td>About Us</td>
     <td>No of Emp</td>		
    <td>Company URL</td>
  </tr>
  <tr>
    <td>${companyProfile.companyName}</td>
    <td>${companyProfile.address1}</td>		
    <td>${companyProfile.city}</td>
    <td>${companyProfile.state}</td>		
    <td>${companyProfile.aboutUs}</td>
   <td>${companyProfile.companySize}</td>		
    <td>${companyProfile.companyUrl}</td>
  </tr>
  
</table>
</div>
</div>
     </body>
	

</html>
 