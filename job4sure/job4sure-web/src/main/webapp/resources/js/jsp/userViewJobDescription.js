
function showPagination() {
	var pager = new Pager('results', 2);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(1);
}

function jobsBasedOnTechnology(data) {
	var techId = data.value;
	$
			.ajax({
				url : "getAllJobsBySkillId.do?skillId=" + techId,
				type : "GET",
				contentType : "application/json; charset=utf-8",
				success : function(response) {
					var responce = JSON.parse(response);
					var list = responce["jobDescriptionList"];
					$('#showDataTable').empty();
					$('#showDataTable')
							.append(
									'<table id="results" style="border-collapse: separate; border-spacing: 12px;" class="nostyle"></table>');
					var table = $('#showDataTable').children();

					for (i = 0; i < list.length; i++) {
						var j = i + 1;
						if (list[i].approvalStatus.statusId == 2) {
							table
									.append('<tr><td width="20%"><img src="resources/images/logo.png" width="100%" height="80" alt="My Pic"></td><td width="70%"><div id="jobDiv" style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right"><h2>'
											+ list[i].jobTitle
											+ '</h2><p>'
											+ list[i].jobDesc
											+ '</p><a href="viewSingleJobDescription.do?jobId='
											+ list[i].jobDescriptionId
											+ '">View</a></div></td></tr>');
						}
					}
					showPagination();
				},
				error : function() {
				}
			});
}
function jobsBasedOnExp(data) {
	var experience = data.value;
	$
			.ajax({
				url : "getAllJobsByExp.do?experience=" + experience,
				type : "GET",
				contentType : "application/json; charset=utf-8",
				success : function(response) {
					var list = JSON.parse(response);
					$('#showDataTable').empty();
					$('#showDataTable')
							.append(
									'<table id="results" style="border-collapse: separate; border-spacing: 12px;" class="nostyle"></table>');
					var table = $('#showDataTable').children();
					for (i = 0; i < list.length; i++) {
						var j = i + 1;
						if (list[i].approvalStatus.statusId == 2) {
							table
									.append('<tr><td width="20%"><img src="resources/images/logo.png" width="100%" height="80" alt="My Pic"></td><td width="70%"><div id="jobDiv" style="background-color: #CCFFFF; color: black; padding: 10px; float: center-right"><h2>'
											+ list[i].jobTitle
											+ '</h2><p>'
											+ list[i].jobDesc
											+ '</p><a href="viewSingleJobDescription.do?jobId='
											+ list[i].jobDescriptionId
											+ '">View</a></div></td></tr>');
						}
					}
					showPagination();
				},
				error : function() {
				}
			});
}
