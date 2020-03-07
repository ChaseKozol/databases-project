function deleteStar(name){
	$.ajax({
		url: '/' + name,
		type: 'DELETE',
		success: function(result){
			window.location.reload(true);
		}
	})
};
