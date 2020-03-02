module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function servePlanets(req, res){
        console.log("You asked me for some planets?")
        var query = 'SELECT planet_id, name, population FROM bsg_planets';
        var mysql = req.app.get('mysql');
        var context = {};

        function handleRenderingOfPlanets(error, results, fields){
          console.log(error)
          console.log(results)
          console.log(fields)
          //take the results of that query and store ti inside context
          context.planets = results;
          //pass it to handlebars to put inside a file
          res.render('planets', context)
        }
        //execute the sql query
        mysql.pool.query(query, handleRenderingOfPlanets)

    }

    router.get('/', servePlanets);
    return router;
}();