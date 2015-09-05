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

<div id="main">
  
    <hr class="noscreen" />
 
  <!-- <div id="menu" class="box">
 
	<div id="menu" class="box">
  
	
	
    <ul class="box">
     
	 <li id="menu-active"><a href="CompanyProfile"><span>Create Company Profile</span></a></li>
	  <li id="menu-active"><a href="updateCompProfile"><span>Update Company Profile</span></a></li>
    </ul>
  </div>
		  
  </div> -->
  
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
        <li><a href="#">Privacy</a></li>
		&nbsp
        &nbsp
		&nbsp
		&nbsp
        <li><a href="#">Terms And Conditions</a></li>
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		 <li><a href="#">Contact Us</a></li>
		 &nbsp
		&nbsp
		&nbsp
		&nbsp
		 
		  <li><a href="#">Leave Us Feedback</a></li> 
		&nbsp
		&nbsp
		&nbsp 
		&nbsp
		
		<li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
		<li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
		
	    <li><a href="#"></a></li>
		
		&nbsp
		&nbsp
		&nbsp
		&nbsp
       
          <!-- Active -->
        
   
    </div>
     <body>
    <%--  ${companyProfile.companyName} --%>
     <table style="width:80%">
     
   <%--  <tr>
    <td>CompanyName</td>
    <td>${companyProfile.companyName}</td>
    </tr> --%>
    
    <tr>
   <td>Address</td>
    <td>${companyProfile.address1}</td>	
    </tr>
   
    <tr>
   <td>City</td>
    <td>${companyProfile.city}</td>
    </tr>
   
    <tr>
   <td>State</td>
    <td>${companyProfile.state}</td>
    </tr>
    
     <tr>
   <td>About Us</td>
   <td>${companyProfile.aboutUs}</td>
    </tr>
    
     <tr>
    <td>No of Emp</td>
    <td>${companyProfile.companySize}</td>
    </tr>
    
     <tr>
    <td>Company URL</td>
    <td>${companyProfile.companyUrl}</td>
    </tr>
    
      <tr>
    <td>Zip</td>
    <td>${companyProfile.zipcode}</td>
    </tr>
    
     <tr>
    <td>Domain</td>
    <td>${companyProfile.domain}</td>
    </tr>
    
    </table>
     </body>
	</div>
	</div>
