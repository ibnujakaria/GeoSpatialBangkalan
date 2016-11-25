DROP TABLE IF EXISTS `warung`;
CREATE TABLE `warung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_warung` varchar(250) NOT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `warung` (`id`, `nama_warung`, `latitude`, `longitude`) VALUES
(1,	'Warung Sudi Mampir',	'-6.89344',	'107.6125'),
(2,	'Warung Samara Pawon',	'-6.88321',	'107.60259'),
(3,	'Warung Sindang Rasa',	'-6.91683',	'107.61842'),
(4,	'Warung Pemadam Kelaparan',	'-6.89834',	'107.6369');

