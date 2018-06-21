-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2018 at 05:02 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `echef`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `idK` int(11) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alergije`
--

DROP TABLE IF EXISTS `alergije`;
CREATE TABLE IF NOT EXISTS `alergije` (
  `idS` int(11) NOT NULL,
  `idK` int(11) NOT NULL,
  PRIMARY KEY (`idS`,`idK`),
  KEY `idK` (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alergije`
--

INSERT INTO `alergije` (`idS`, `idK`) VALUES
(35, 10),
(35, 11),
(35, 13);

-- --------------------------------------------------------

--
-- Table structure for table `knjiga`
--

DROP TABLE IF EXISTS `knjiga`;
CREATE TABLE IF NOT EXISTS `knjiga` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(11) DEFAULT NULL,
  PRIMARY KEY (`idK`),
  KEY `R_15` (`idKorisnika`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knjiga`
--

INSERT INTO `knjiga` (`idK`, `idKorisnika`) VALUES
(13, 7);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
CREATE TABLE IF NOT EXISTS `komentar` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(11) DEFAULT NULL,
  `sadrzaj` text,
  `idR` int(11) DEFAULT NULL,
  `vreme` date NOT NULL,
  PRIMARY KEY (`idK`),
  KEY `R_14` (`idKorisnika`),
  KEY `R_13` (`idR`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `oznaka` char(1) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idK`, `username`, `password`, `ime`, `prezime`, `mail`, `oznaka`) VALUES
(1, 'janis', 'asdas', 'asfasf', 'asfas', 'asdas', 'R'),
(2, 'vuk', 'asdas', 'asdasx', 'saxs', 'xgax', 'R'),
(3, 'jelena', 'asdasf', 'fssaf', 'afs', 'dasa', 'R'),
(4, 'Ivana', 'asda', 'saf', 'xx', 'asx', 'R'),
(6, 'jeca', 'jeca', 'jelena', 'savic', 'asfjas@gasdas.com', 'K'),
(7, 'jec', '123', 'jec', 'jec', 'asdas', 'R'),
(9, '123', '1', '12', '12', '123', 'R'),
(11, '2', '2', '2', '2', '2', 'R'),
(12, '2', '2', '2', '2', '2', 'R'),
(13, 'd', 'd', 'd', 'd', 'd', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `kuvar`
--

DROP TABLE IF EXISTS `kuvar`;
CREATE TABLE IF NOT EXISTS `kuvar` (
  `idK` int(11) NOT NULL,
  `cv` blob,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

DROP TABLE IF EXISTS `meni`;
CREATE TABLE IF NOT EXISTS `meni` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `idK` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`idM`),
  KEY `R_10` (`idK`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meni`
--

INSERT INTO `meni` (`idM`, `idK`, `datum`) VALUES
(1, 1, '2018-06-21'),
(2, 7, '2018-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `ocenjuje`
--

DROP TABLE IF EXISTS `ocenjuje`;
CREATE TABLE IF NOT EXISTS `ocenjuje` (
  `idK` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  `ocena` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`idK`,`idR`),
  KEY `R_20` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ocenjuje`
--

INSERT INTO `ocenjuje` (`idK`, `idR`, `ocena`, `datum`) VALUES
(7, 13, 3, '2018-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `omiljeni`
--

DROP TABLE IF EXISTS `omiljeni`;
CREATE TABLE IF NOT EXISTS `omiljeni` (
  `idS` int(11) NOT NULL,
  `idK` int(11) NOT NULL,
  PRIMARY KEY (`idS`,`idK`),
  KEY `R_34` (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `omiljeni`
--

INSERT INTO `omiljeni` (`idS`, `idK`) VALUES
(7, 7),
(8, 8),
(8, 11),
(9, 7),
(9, 9),
(9, 13),
(10, 10),
(23, 11),
(25, 13),
(29, 7),
(29, 9),
(29, 10),
(29, 11),
(29, 13),
(30, 8);

-- --------------------------------------------------------

--
-- Table structure for table `recepti`
--

DROP TABLE IF EXISTS `recepti`;
CREATE TABLE IF NOT EXISTS `recepti` (
  `idR` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  `sadrzaj` text NOT NULL,
  `obrok` varchar(20) NOT NULL,
  `kategorija` varchar(20) NOT NULL,
  `spec_prilika` varchar(25) DEFAULT NULL,
  `slika` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idR`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recepti`
--

INSERT INTO `recepti` (`idR`, `naziv`, `sadrzaj`, `obrok`, `kategorija`, `spec_prilika`, `slika`) VALUES
(13, 'Brined Roast Chicken', 'For brine\r\n\r\n1 liter of water\r\n1/3 cup salt\r\n1/3 cup sugar\r\n1/3 cup vinegar\r\nFor herb spread\r\n\r\n6 tablespoons brown sugar\r\n4 tablespoons sweet paprika\r\n3 tablespoons chili powder\r\n2 teaspoons garlic powder\r\n1 teaspoon ground cumin\r\n½ teaspoon ground nutmeg\r\n2 tablespoons salt\r\n1 tablespoon pepper\r\nFor chicken\r\n\r\n2 whole chickens, 3 kilos total weight, cut each into 4 or 8 pieces\r\nFor sauce\r\n\r\n2 tablespoons (heaping) honey\r\n1 teaspoon apple cider vinegar\r\nMethod\r\n                                                                                                                                                  Photo credit: G. Drakopoulos - Food Styling: T. Webb\r\n\r\nTo make the brine, add all of the ingredients for the brine in a pot. Bring to a boil and allow to cool.\r\nPut the brine in a large bowl. Add the chicken pieces, making sure they are completely submerged in the brine. Refrigerate for at least 1 hour and up to 6 hours.\r\nWhile the chicken is marinating in the refrigerator, prepare the herb spread. Combine all of the ingredients for the spread in a bowl.\r\nPrepare 2 shallow baking pans, by placing rack in each.\r\nBefore removing the chicken from the brine, preheat oven to 150* C (300* F).\r\nRemove chicken from brine and pat dry with paper towels. Place both chicken in a large bowl and add the spread. It might seem like a lot but it isn’t. Toss to coat the chicken in the spread thoroughly.\r\nPrepare 2 packets made out of 2 sheets of aluminum foil. Divide the chicken evenly between them and add any remaining spread over them.\r\nClose the packets securely and place them on the racks in the baking pans.\r\nPlace them in the oven and roast for 1 hour. Switch the baking pans, placing the one that was on a higher rack on the lower one, and vice versa. Roast for another 45 minutes to 1 hour. Pierce chicken with a thermometer to check the temperature, it should reach 68* C (154* F).\r\nRemove from oven and turn on the grill to 230* C (446* F). Break open the packages so that the chicken can brown. Empty the juices into a saucepan. Cook the chicken under the grill for 10-15 minutes, until golden brown.\r\nWhile the chicken is under the grill, place the saucepan with the juices on high heat. Bring to a boil until it reduces and starts to thicken a little. Add the honey. Remove from heat and add the apple cider vinegar.\r\nPlace chicken onto a serving platter and serve with sauce.', 'Lunch', 'Chicken', 'Bbq', '/images/Brined Roast Chicken.jpg'),
(12, 'Cacao Beef Ribs', '1 ½ kilos beef ribs\r\n1/3 cup cacao powder\r\n½ cup brown sugar\r\n2 tablespoons salt\r\n2 tablespoons onion powder\r\n1 tablespoon garlic powder\r\n1 tablespoon dry oregano\r\n1 tablespoon mustard powder\r\n2 teaspoons ginger powder\r\n2 teaspoons ground cinnamon\r\n1 teaspoon ground all spice\r\nMethod\r\nPhoto credit: G. Drakopoulos - Food Styling: T. Webb\r\n\r\nCombine the cacao powder, sugar and spices in a bowl. Rub the ribs with a generous amount of the spice rub. Cover with plastic wrap and refrigerate overnight.\r\nRemove from the refrigerator about 2 hours before serving and allow them to come to room temperature.\r\nPreheat oven to 180* C (350* F) Fan.\r\nPlace the ribs on a rimmed baking sheet lined with parchment paper.\r\nRoast for 40 minutes, until they soften.\r\nTurn up oven temperature to 200* C (390* F) and transfer to a baking pan lined with a wire rack, curved side up. Roast for another 15-20 minutes, turning them over once,  until golden brown.\r\nChop into pieces and serve! ', 'Lunch', 'Beef', 'Dinner Parties', '/images/Cacao Beef Ribs.jpg'),
(10, 'Beef Tacos', 'For taco shells\r\n\r\nolive oil, for brushing\r\n80 g chickpea flour\r\n220 ml water\r\n½ teaspoon salt\r\nFor filling\r\n\r\n1 tablespoon olive oil\r\n½ onion, finely chopped\r\n1 tomato, finely chopped\r\n250 g lean ground beef\r\n½ - 1 chili pepper, seeds removed and thinly sliced\r\n200 g can chopped tomatoes\r\nsalt\r\nTo serving\r\n\r\ntomatoes, chopped in to small cubes\r\nthinly sliced onions\r\nlettuce leaves\r\n \r\n\r\nMethod\r\nFor the taco shells\r\n\r\nPreheat oven to 180* C (350* F) Fan.\r\nPlace a pan over medium heat and let it get very hot.\r\nIn a bowl, lightly whisk the flour, water and salt for 1-2 minutes, until there are no lumps.\r\nAdd 1/6 of the mixture to the pan.\r\nCook for 40-50 seconds on each side, until golden.\r\nWhen ready, remove from pan and repeat the same process for the remaining 5 tortillas and set them aside until needed.\r\nOverturn a muffin pan. Fold each tortilla in half and place between the muffin molds.\r\nBake for 20-30 minutes, until crunchy.\r\nWhen ready, carefully remove the tortillas and set them aside to cool.\r\nFor the filling\r\n\r\nPlace a pot or a deep pan over medium heat and add the olive oil.\r\nAdd the onion. Stir and sauté until it softens.\r\nTurn up the heat and add the ground meat. Break up the meat and stir every so often until it browns nicely.\r\nWhen ready, lower heat and add the tomatoes, chili pepper and canned tomatoes. Stir to combine.\r\nSeason with salt and pepper, cover pot and simmer for 20-30 minutes. Stir every so often until it is ready.\r\nTo serve\r\n\r\nFill the taco shells with the filling and add all of the toppings – tomatoes, onion and lettuce or any of your personal favorites.', 'Lunch', 'Beef', 'Children\'s birthday party', '/images/Beef Tacos.jpg'),
(9, 'Healthy Chicken Burg', '1 ½ liters water\r\n6 chicken breast fillets\r\n1 teaspoon ground cumin\r\n2 red  horned peppers (Florinis from a jar) + 2 tablespoons oil from the jar\r\n1 onion\r\n3 tablespoon olive oil\r\n150 g canned tomatoes\r\n1 tablespoon brown sugar\r\n60 g apple cider vinegar or white wine\r\n1 tablespoon Worcestershire sauce\r\nTo serve\r\n\r\n6 hamburger buns\r\n¼ purple cabbage\r\n3 spring onions\r\n1 avocado\r\nMethod\r\nPlace a pot over medium heat and add the water, chicken breasts and cumin.\r\nBoil for 30-40 minutes, until the fillets have cooked through. Add more water if necessary to keep them submerged at all times.\r\nWhen ready, remove pot from heat and drain.\r\nCut the red peppers into 1 cm slices and finely chop the onion.\r\nPlace a pan over high heat. Add the oil from the jar, 2 tablespoons of olive oil, red peppers and onion.\r\nSauté for 3-4 minutes.\r\nAdd the canned tomatoes and brown sugar. Sauté for 1-2 minutes.\r\nAdd the apple cider vinegar and let it reduce to half. Then add the Worcestershire sauce.\r\nIn the meantime, tear apart the chicken in a bowl with your hands.\r\nAdd the chicken to the pan and stir with a wooden spoon until the mixture is completely combined.\r\nDivide the chicken mixture between the hamburger buns (bottom)..\r\nFinely chop the cabbage and spring onions, thinly slice the avocado and transfer to a bowl.\r\nSeason with salt and pepper. Drizzle with 1 tablespoon of olive oil and toss.\r\nAdd over chicken mixture, cover with hamburger buns and serve.', 'Lunch', 'Chicken', 'Bbq', '/images/Healthy Chicken Burger.jpg'),
(14, 'Breaded Fish Fillet ', '5 slices of bread\r\ngrated zest of 2 lemons\r\n2 tablespoons lemon juice, and lemon wedges for serving\r\na small handful of chopped parsley leaves\r\n8 cod fillets (150 g each)\r\n1 tablespoon olive oil\r\nthyme\r\npepper\r\nsalt\r\nPotato wedges, to serve\r\nFor yogurt tartar sauce:\r\n\r\n200 g strained yogurt, preferably Greek\r\n2 tablespoons pickles, rinsed\r\n1 tablespoon salted capers, rinsed and chopped\r\n1 tablespoon chopped fresh dill\r\ngrated zest and juice from 1 lemon\r\nMethod\r\nThis recipe calls for fresh cod fillets not dried and salted cod. It is a light and tasty dish that is baked in the oven instead of fried.\r\n\r\nPreheat oven to 180* C (350* F) Fan.\r\nBeat the bread in a food processor until it breaks down into coarse breadcrumbs.\r\nAdd the lemon zest, salt, pepper, thyme and parsley. Continue beating.\r\nLine a baking pan with parchment paper.\r\nSeason the fish with salt and pepper, Drizzle with olive oil and the juice and zest from 1 lemon. Spread the marinade all over the fillets.\r\nTransfer to the baking pan and coat with the bread mixture. Drizzle with a little more olive oil.\r\nPlace the fish in the oven and bake for 6-8 minutes, until crunchy and golden brown.\r\nFor the yogurt tartar sauce:\r\n\r\nFinely chop the pickle and capers and transfer to a bowl. Add the grated zest and juice from 1 lemon and some finely chopped dill. Add the yogurt and mix with a spoon.\r\nServe the fish with potato wedges and yogurt tartar sauce.', 'Lunch', 'Fish', 'Dinner Parties', '/images/Breaded Fish Fillet with Yogurt '),
(17, 'Forest Fruit Tart', 'For dough\r\n\r\n300 g flour\r\n100 g butter, chilled\r\n75 g caster sugar\r\n1 egg\r\n1 egg yolk, for brushing\r\n1 tablespoon water (in case the dough is too firm)\r\nFor filling\r\n\r\n900 g forest fruit or wild berries, frozen thawed and strained (reserve juice)\r\n150-250 g granulated sugar\r\n70 g cornstarch\r\njuice from half a lemon\r\nFor glaze\r\n\r\n150 g caster sugar\r\n1-2 tablespoons berry juice, from thawed fruits\r\nMethod\r\n                                                                                                                    Photo credit: G. Drakopoulos - Food Styling: T. Webb\r\n\r\nBeat the flour, sugar and butter in a food processor, until the butter dissolves completely. Lower the speed and add 1 egg. The flour should change color and texture. It should become yellowish in color and resemble coarse breadcrumbs.\r\nAdd the chilled water slowly, until the dough comes together and becomes soft enough to work with.\r\nWork in plastic wrap and refrigerate for at least 1 hour so it can rest. It would be best if you flatten dough as much as possible before wrapping. It will make it much easier to roll out.\r\nGrease and flour a 28 cm tart pan, round or rectangular is fine. Set aside.\r\nLay out 2 large pieces of parchment paper. Place dough between them. Use the rolling pin to roll out the dough between the 2 sheets of parchment. If it does not roll out easily, let the dough sit at room temperature for 5 minutes so it can soften.\r\nPreheat oven to 190* C (374* F) Fan.\r\nIn a large bowl, toss the forest fruit with sugar, cornstarch, lemon juice and salt. Set aside until needed.\r\nSpread the dough in the tart pan and press onto bottom and sides. Add the filling.\r\nBake for 25-35 minutes, until golden.\r\nWhile the pie is cooking, prepare the glaze by simply mixing together the caster sugar with the juices the fruit released while thawing.\r\nDecorate the top of the pie nicely with the glaze.     ', 'Dessert', 'Fruit', 'Valentines Day', '/images/Forest Fruit Tart.jpg'),
(27, 'SS', 'asdas', 'Breakfast', 'Beef', NULL, NULL),
(26, 'KOKA', 'ASDASDAS', 'Dinner', 'Beef', 'Dinner Parties', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registrovani`
--

DROP TABLE IF EXISTS `registrovani`;
CREATE TABLE IF NOT EXISTS `registrovani` (
  `idK` int(11) NOT NULL,
  `pol` char(1) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrovani`
--

INSERT INTO `registrovani` (`idK`, `pol`) VALUES
(7, 'f'),
(8, 'f'),
(9, 'f'),
(10, 'f'),
(11, 'f'),
(13, 'f');

-- --------------------------------------------------------

--
-- Table structure for table `sastojci`
--

DROP TABLE IF EXISTS `sastojci`;
CREATE TABLE IF NOT EXISTS `sastojci` (
  `idS` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  `opis` text,
  `kategorija` varchar(20) NOT NULL,
  PRIMARY KEY (`idS`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sastojci`
--

INSERT INTO `sastojci` (`idS`, `naziv`, `opis`, `kategorija`) VALUES
(12, 'Peas', NULL, 'Vegetable'),
(11, 'GreenBeans', NULL, 'Vegetable'),
(10, 'Carrot', NULL, 'Vegetable'),
(9, 'Pepper', NULL, 'Vegetable'),
(8, 'Onion', NULL, 'Vegetable'),
(7, 'Potato', NULL, 'Vegetable'),
(13, 'Corn', NULL, 'Vegetable'),
(14, 'Broccoli', NULL, 'Vegetable'),
(15, 'Tomato', NULL, 'Vegetable'),
(16, 'Beetroot', NULL, 'Vegetable'),
(17, 'Pumpkin', NULL, 'Vegetable'),
(18, 'Pear', NULL, 'Fruit'),
(19, 'Berries', NULL, 'Fruit'),
(20, 'Apple', NULL, 'Fruit'),
(21, 'Pineapple', NULL, 'Fruit'),
(22, 'Orange', NULL, 'Fruit'),
(23, 'Lamb', NULL, 'Meat'),
(24, 'Pork', NULL, 'Meat'),
(25, 'Chicken', NULL, 'Meat'),
(26, 'Fish', NULL, 'Fish'),
(27, 'Seafood', NULL, 'Seafood'),
(29, 'Chocolate', NULL, 'Flavour'),
(30, 'Vanilla', NULL, 'Flavour'),
(31, 'Caramel', NULL, 'Flavour'),
(38, 'Nuts', NULL, 'Nuts'),
(33, 'OtherFruits', NULL, 'Fruit'),
(37, 'Other', NULL, 'Other'),
(34, 'Beef', NULL, 'Meat'),
(35, 'Milk', NULL, 'Milk');

-- --------------------------------------------------------

--
-- Table structure for table `veza_meni_recepti`
--

DROP TABLE IF EXISTS `veza_meni_recepti`;
CREATE TABLE IF NOT EXISTS `veza_meni_recepti` (
  `idM` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  PRIMARY KEY (`idM`,`idR`),
  KEY `R_26` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veza_meni_recepti`
--

INSERT INTO `veza_meni_recepti` (`idM`, `idR`) VALUES
(1, 14),
(1, 26),
(1, 27),
(2, 9),
(2, 26),
(2, 27);

-- --------------------------------------------------------

--
-- Table structure for table `veza_recepti_knjiga`
--

DROP TABLE IF EXISTS `veza_recepti_knjiga`;
CREATE TABLE IF NOT EXISTS `veza_recepti_knjiga` (
  `idK` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  PRIMARY KEY (`idK`,`idR`),
  KEY `R_30` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veza_recepti_knjiga`
--

INSERT INTO `veza_recepti_knjiga` (`idK`, `idR`) VALUES
(13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `veza_sastojci_recepti`
--

DROP TABLE IF EXISTS `veza_sastojci_recepti`;
CREATE TABLE IF NOT EXISTS `veza_sastojci_recepti` (
  `idR` int(11) NOT NULL,
  `idS` int(11) NOT NULL,
  PRIMARY KEY (`idR`,`idS`),
  KEY `R_27` (`idS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veza_sastojci_recepti`
--

INSERT INTO `veza_sastojci_recepti` (`idR`, `idS`) VALUES
(9, 8),
(9, 9),
(9, 15),
(9, 25),
(10, 8),
(10, 9),
(10, 12),
(10, 15),
(11, 8),
(11, 9),
(11, 12),
(11, 15),
(11, 34),
(12, 8),
(12, 9),
(12, 29),
(12, 34),
(13, 8),
(13, 9),
(13, 15),
(13, 25),
(13, 31),
(14, 7),
(14, 9),
(14, 10),
(14, 26),
(17, 19),
(17, 37);

-- --------------------------------------------------------

--
-- Table structure for table `zahtev`
--

DROP TABLE IF EXISTS `zahtev`;
CREATE TABLE IF NOT EXISTS `zahtev` (
  `idZ` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `cv` blob,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idZ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
