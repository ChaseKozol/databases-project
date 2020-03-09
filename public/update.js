function updateStar(id){
    $.ajax({
        url: '/' + id,
        type: 'PUT',
        data: $('#update-star').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};