<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/switcher.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.tabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tabs > ul").tabs();
	});
	</script>
	
</head>
<h3 style="color: red;">${message}</h3>
<body>
<div id="main">
  
  
  <hr class="noscreen" />
 
  <div id="menu" class="box">
  
	
	
    <ul class="box">
     
      <li id="menu-active"><a href="Complete_Profile"><span>Complete Your Profile</span></a></li>
	 <li id="menu-active"><a href='updateBasicProfile?registrationId=${registration.registrationId}'
       onclick="return confirm('Are you sure you want to update this item?');"><span>update your basic Profile</span></a></li>
       <li id="menu-active"><a href='updateCompleteInfo?userId=${userProfile.userId}'
       onclick="return confirm('Are you sure you want to update this item?');"><span>update Your Complete Info</span></a></li>
	  <li id="menu-active"><a href="setNewPassword"><span>Reset password</span></a></li>
    </ul>
  </div>
 </div>
 
 

<br>

</body>
</html>