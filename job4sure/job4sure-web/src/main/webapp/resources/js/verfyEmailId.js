function emailVarification(verify) {
	    var emailId =verify.value;
	     $.ajax({
	  		url : "verifyUserEmailId.do?emailId=" + emailId,
	  		type : "GET",
	  		contentType : "application/json; charset=utf-8",
	  		
	  		success : function(t) {
	  			 if(t=="true"){
	  				alert("your emailId already existed!");
	  				 document.getElementById("email").value="";  
	  				
	  			} 
	  		
	  		},
	  		
	  		error : function() {
	  			alert("error");
	  		}
	  	})
	  }  