

--
-- Database: `cs340_space`
--

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
CREATE TABLE `stars` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`system` varchar(255),
	`type` varchar(255) NOT NULL,
	`age` bigint(11),
	PRIMARY KEY (`id`)
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
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`diameter` int(11),
	`period` int(11) NOT NULL,
	`num_moons` int(11),
	PRIMARY KEY (`id`)
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
	`star_id` int(11) NOT NULL,
	`planet_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `planet_orbit_ibfk_1` FOREIGN KEY (`star_id`) REFERENCES `stars` (`id`),
	CONSTRAINT `planet_orbit_ibfk_2` FOREIGN KEY (`planet_id`) REFERENCES `planets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planet_orbit`
--

INSERT INTO `planet_orbit` (`star_id`, `planet_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `moons`
--

DROP TABLE IF EXISTS `moons`;
CREATE TABLE `moons` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`diameter` int(11) NOT NULL,
	`planet_orbiting` int(11),
	PRIMARY KEY (`id`),
	CONSTRAINT `moons_ibfk_1` FOREIGN KEY (`planet_orbiting`) REFERENCES `planets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moons`
--

INSERT INTO `moons` (`name`, `diameter`, `planet_orbiting`) VALUES
('Luna', 2159, 3),
('Phobos', 8, 4),
('Deimos', 14, 4),
('Io', 2159, 5),
('Europa', 1940, 5),
('Callisto', 2995, 5),
('Mimas', 246, 6),
('Enceladus', 313, 6),
('Tethys', 660, 6),
('Umbriel', 727, 7),
('Titania', 980, 7),
('Oberon', 946, 7),
('Triton', 1682, 8),
('Charon', 753, 9);

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
	`id` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `name`) VALUES
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
	`star_id` int(11) NOT NULL,
	`element_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `star_composition_ibfk_1` FOREIGN KEY (`star_id`) REFERENCES `stars` (`id`),
	CONSTRAINT `star_composition_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `planet_composition`
--

DROP TABLE IF EXISTS `planet_composition`;
CREATE TABLE `planet_composition` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`planet_id` int(11) NOT NULL,
	`element_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `planet_composition_ibfk_1` FOREIGN KEY (`planet_id`) REFERENCES `planets` (`id`),
	CONSTRAINT `planet_composition_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moon_composition`
--

DROP TABLE IF EXISTS `moon_composition`;
CREATE TABLE `moon_composition` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`moon_id` int(11) NOT NULL,
	`element_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `moon_composition_ibfk_1` FOREIGN KEY (`moon_id`) REFERENCES `moons` (`id`),
	CONSTRAINT `moon_composition_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
