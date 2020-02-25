--STARS
/*CREATE*/
INSERT INTO stars (name, system, type, age)
	VALUES (:name, :system, :type, :age);
/*READ*/
SELECT name FROM stars
/*UPDATE*/
UPDATE stars SET system = :system, type = :type, age = :age WHERE name = :name;
/*DELETE*/
DELETE FROM stars WHERE name = :name;
	
--PLANETS
/*CREATE*/
INSERT INTO planets (name, diameter, period, num_moons)
	VALUES (:name, :diameter, :period, :num_moons);
/*READ*/
SELECT name FROM planets
/*UPDATE*/
UPDATE planets SET diameter = :diameter, period = :period, num_moons = :num_moons WHERE name = :name;
/*DELETE*/
DELETE FROM planets WHERE name = :name;

--PLANET_ORBIT

--MOONS
/*CREATE*/
INSERT INTO moons (name, diameter, planet_orbiting)
	VALUES (:name, :diameter, :planet_orbiting);
/*READ*/
SELECT name FROM moons
/*UPDATE*/
UPDATE moons SET diameter = :diameter, planet_orbiting = :planet_orbiting WHERE name = :name;
/*DELETE*/
DELETE FROM moons WHERE name = :name;
	
--ELEMENTS
/*CREATE*/
INSERT INTO elements (number, name)
	VALUES (:number, :name);
/*READ*/
SELECT number FROM elements
/*UPDATE*/
UPDATE elements SET name = :name WHERE number = :number;
/*DELETE*/
DELETE FROM elements WHERE number = :number;

--STAR_COMPOSITION

--PLANET_COMPOSITION

--MOON_COMPOSOSITION