

function selectall(){
	 var all=document.getElementById('all').checked;
	if(all){
		  $("input[type=checkbox]").each(function () {
              $(this).prop("checked", true);
          });
	}
	else {
        $("input[type=checkbox]").each(function () {
            $(this).prop("checked", false);
        });
    }
}

