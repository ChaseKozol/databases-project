function updateStar(name){
    $.ajax({
        url: '/stars/' + name,
        type: 'PUT',
        data: $('#update-person').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};