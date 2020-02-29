

--
-- Database: `cs340_space`
--

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
CREATE TABLE `stars` (
	`name` varchar(255) NOT NULL,
	`system` varchar(255),
	`type` varchar(255) NOT NULL,
	`age` int(11),
	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`name`, `system`, `type`, `age`) VALUES
('Sol', 'Solar', 'Yellow Dwarf', 4600000000),
('Rigil Kentaurus', 'Alpha Centauri', 'Yellow Dwarf', NULL),
('Toliman', 'Alpha Centauri', 'Orange Dwarf', 5300000000),
('Proxima Centauri', 'Alpha Centauri', 'Red Dwarf', 4900000000);

-- --------------------------------------------------------

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
CREATE TABLE `planets` (
	`name` varchar(255) NOT NULL,
	`diameter` int(11),
	`period` int(11) NOT NULL,
	`num_moons` int(11),
	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planets`
--

INSERT INTO `planets` (`name`, `diameter`, `period`, `num_moons`) VALUES
('Mercury', 3032, 88, 0),
('Venus', 7521, 225, 0),
('Earth', 7918, 365, 1),
('Mars', 4212, 687, 2),
('Jupiter', 86881, 4331, 79),
('Saturn', 72367, 10747, 82),
('Uranus', 31518, 30589, 27),
('Neptune', 30559, 59800, 14),
('Pluto', 1477, 90560, 5),
('Proxima Centauri b', NULL, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `planet_orbit`
--

DROP TABLE IF EXISTS `planet_orbit`;
CREATE TABLE `planet_orbit` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`star_name` varchar(255) NOT NULL,
	`planet_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `planet_orbit_ibfk_1` FOREIGN KEY (`star_name`) REFERENCES `stars` (`name`),
	CONSTRAINT `planet_orbit_ibfk_2` FOREIGN KEY (`planet_name`) REFERENCES `planets` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planet_orbit`
--

INSERT INTO `planet_orbit` (`star_name`, `planet_name`) VALUES
('Sol', 'Mercury'),
('Sol', 'Venus'),
('Sol', 'Earth'),
('Sol', 'Mars'),
('Sol', 'Jupiter'),
('Sol', 'Saturn'),
('Sol', 'Uranus'),
('Sol', 'Neptune'),
('Sol', 'Pluto'),
('Proxima Centauri', 'Proxima Centauri b');

-- --------------------------------------------------------

--
-- Table structure for table `moons`
--

DROP TABLE IF EXISTS `moons`;
CREATE TABLE `moons` (
	`name` varchar(255) NOT NULL,
	`diameter` int(11) NOT NULL,
	`planet_orbiting` varchar(255),
	PRIMARY KEY (`name`),
	CONSTRAINT `moons_ibfk_1` FOREIGN KEY (`planet_orbiting`) REFERENCES `planets` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moons`
--

INSERT INTO `moons` (`name`, `diameter`, `planet_orbiting`) VALUES
('Luna', 2159, 'Earth'),
('Phobos', 8, 'Mars'),
('Deimos', 14, 'Mars'),
('Io', 2159, 'Jupiter'),
('Europa', 1940, 'Jupiter'),
('Callisto', 2995, 'Jupiter'),
('Mimas', 246, 'Saturn'),
('Enceladus', 313, 'Saturn'),
('Tethys', 660, 'Saturn'),
('Umbriel', 727, 'Uranus'),
('Titania', 980, 'Uranus'),
('Oberon', 946, 'Uranus'),
('Triton', 1682, 'Neptune'),
('Charon', 753, 'Pluto');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
	`number` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`number`, `name`) VALUES
(1, 'Hydrogen'),
(2, 'Helium'),
(3, 'Lithium'),
(4, 'Beryllium'),
(5, 'Boron'),
(6, 'Carbon'),
(7, 'Nitrogen'),
(8, 'Oxygen'),
(9, 'Flourine'),
(10, 'Neon'),
(26, 'Iron');

-- --------------------------------------------------------

--
-- Table structure for table `star_composition`
--

DROP TABLE IF EXISTS `star_composition`;
CREATE TABLE `star_composition` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`star_name` varchar(255) NOT NULL,
	`element_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `star_composition_ibfk_1` FOREIGN KEY (`star_name`) REFERENCES `stars` (`name`),
	CONSTRAINT `star_composition_ibfk_2` FOREIGN KEY (`element_name`) REFERENCES `elements` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `planet_composition`
--

DROP TABLE IF EXISTS `planet_composition`;
CREATE TABLE `planet_composition` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`planet_name` varchar(255) NOT NULL,
	`element_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `planet_composition_ibfk_1` FOREIGN KEY (`planet_name`) REFERENCES `planets` (`name`),
	CONSTRAINT `planet_composition_ibfk_2` FOREIGN KEY (`element_name`) REFERENCES `elements` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moon_composition`
--

DROP TABLE IF EXISTS `moon_composition`;
CREATE TABLE `moon_composition` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`moon_name` varchar(255) NOT NULL,
	`element_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `moon_composition_ibfk_1` FOREIGN KEY (`moon_name`) REFERENCES `moons` (`name`),
	CONSTRAINT `moon_composition_ibfk_2` FOREIGN KEY (`element_name`) REFERENCES `elements` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;