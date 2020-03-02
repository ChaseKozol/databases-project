module.exports = function(){
	var express = require('express');
	var router = express.Router();

	function getStars(res, mysql, context, complete){
		mysql.pool.query("SELECT name, system, type, age FROM stars", function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.end();
			}
			context.stars = results;
			complete();
		});
	}

	/*Display stars*/

	router.get('/', function(req, res){	
		var callbackCount = 0;
		var context = {};
		var mysql = req.app.get('mysql');
		getStars(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('stars', context);
			}

		}
	});

	return router;
}();
