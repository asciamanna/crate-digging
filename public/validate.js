$(document).ready(function() {
	$("#newForm").validate({
		rules : {
			artist_name: {
				required: true
		  },
			album_name: {
				required: true
			}
		}
	});
})
