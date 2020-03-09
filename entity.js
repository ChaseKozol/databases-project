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

	function getPlanets(res, mysql, context, complete){
		mysql.pool.query("SELECT name, diameter, period, star_name, num_moons FROM planets INNER JOIN planet_orbit ON name = planet_orbit.planet_name", function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.end();
			}
			context.planets = results;
			complete();
		});
	}

	function getMoons(res, mysql, context, complete){
		mysql.pool.query("SELECT name, planet_orbiting, diameter FROM moons", function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.end();
			}
			context.moons = results;
			complete();
		});
	}

	function getElements(res, mysql, context, complete){
		mysql.pool.query("SELECT name, number FROM elements", function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.end();
			}
			context.elements = results;
			complete();
		});
	}
	
	function getCompositions(res, mysql, context, complete){
		mysql.pool.query("SELECT id, star_name, element_name FROM star_composition", function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.end();
			}
			context.elements = results;
			complete();
		});
	}

	/*Display stars*/

	router.get('/', function(req, res){	
		var callbackCount = 0;
		var context = {};
		context.jsscripts = ["deletestar.js"];
		var mysql = req.app.get('mysql');
		getStars(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('stars', context);
			}

		}
	});

	/*Display planets*/

	router.get('/planets', function(req, res){	
		var callbackCount = 0;
		var context = {};
		var mysql = req.app.get('mysql');
		getPlanets(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('planets', context);
			}

		}
	});

	/*Display moons*/

	router.get('/moons', function(req, res){	
		var callbackCount = 0;
		var context = {};
		var mysql = req.app.get('mysql');
		getMoons(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('moons', context);
			}

		}
	});

	/*Display elements*/

	router.get('/elements', function(req, res){	
		var callbackCount = 0;
		var context = {};
		var mysql = req.app.get('mysql');
		getElements(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('elements', context);
			}

		}
	});
	
	/*Display compositions*/
	
	router.get('/compositions', function(req, res){	
		var callbackCount = 0;
		var context = {};
		var mysql = req.app.get('mysql');
		getElements(res, mysql, context, complete);
		function complete(){
		callbackCount++;
			if(callbackCount >= 1){
				res.render('compositions', context);
			}

		}
	});
	
	//dml
	
	router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO stars (name, system, type, age) VALUES (?,?,?,?)";
        var inserts = [req.body.name, req.body.system, req.body.type, req.body.age];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/');
            }
        });
    });

	router.post('/planets', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO planets (name, diameter, period, num_moons) VALUES (?,?,?,?)";
        var inserts = [req.body.name, req.body.diameter, req.body.period, req.body.num_moons];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/planets');
            }
        });
    });

	router.post('/moons', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO moons (name, diameter, planet_orbiting) VALUES (?,?,?,?)";
        var inserts = [req.body.name, req.body.diameter, req.body.planet_orbiting];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/moons');
            }
        });
    });

	router.delete('/:name', function(req, res){
		var mysql = req.app.get('mysql');
		var sql = "DELETE FROM stars WHERE name = ?";
		var inserts = [req.params.name];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields){
			if(error){
				res.write(JSON.stringify(error));
				res.status(400);
				res.end();
			}else{
				res.status(202).end();
			}

		})
	})

	return router;
}();
