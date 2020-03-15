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

function updatePlanet(id){
    $.ajax({
        url: '/' + id,
        type: 'PUT',
        data: $('#update-planet').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};

function updateMoon(id){
    $.ajax({
        url: '/' + id,
        type: 'PUT',
        data: $('#update-moon').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};