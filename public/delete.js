function deleteStar(id){
	$.ajax({
		url: '/' + id,
		type: 'DELETE',
		success: function(result){
			window.location.reload(true);
		}
	})
};

function deletePlanet(id){
	$.ajax({
		url: '/planets/' + id,
		type: 'DELETE',
		success: function(result){
			window.location.reload(true);
		}
	})
};

function deleteMoon(id){
	$.ajax({
		url: '/moons/' + id,
		type: 'DELETE',
		success: function(result){
			window.location.reload(true);
		}
	})
};