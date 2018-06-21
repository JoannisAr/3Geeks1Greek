-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2018 at 10:45 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knjiga`
--

INSERT INTO `knjiga` (`idK`, `idKorisnika`) VALUES
(14, 6);

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
(6, 'jeca', 'jeca', 'jelena', 'savic', 'asfjas@gasdas.com', 'K');

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
  `naziv` varchar(35) NOT NULL,
  `sadrzaj` text NOT NULL,
  `obrok` varchar(20) NOT NULL,
  `kategorija` varchar(20) NOT NULL,
  `spec_prilika` varchar(25) DEFAULT NULL,
  `slika` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idR`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recepti`
--

INSERT INTO `recepti` (`idR`, `naziv`, `sadrzaj`, `obrok`, `kategorija`, `spec_prilika`, `slika`) VALUES
(13, 'Brined Roast Chicken', 'For brine\r\n\r\n1 liter of water\r\n1/3 cup salt\r\n1/3 cup sugar\r\n1/3 cup vinegar\r\nFor herb spread\r\n\r\n6 tablespoons brown sugar\r\n4 tablespoons sweet paprika\r\n3 tablespoons chili powder\r\n2 teaspoons garlic powder\r\n1 teaspoon ground cumin\r\n½ teaspoon ground nutmeg\r\n2 tablespoons salt\r\n1 tablespoon pepper\r\nFor chicken\r\n\r\n2 whole chickens, 3 kilos total weight, cut each into 4 or 8 pieces\r\nFor sauce\r\n\r\n2 tablespoons (heaping) honey\r\n1 teaspoon apple cider vinegar\r\nMethod\r\n                                                                                                                                                  Photo credit: G. Drakopoulos - Food Styling: T. Webb\r\n\r\nTo make the brine, add all of the ingredients for the brine in a pot. Bring to a boil and allow to cool.\r\nPut the brine in a large bowl. Add the chicken pieces, making sure they are completely submerged in the brine. Refrigerate for at least 1 hour and up to 6 hours.\r\nWhile the chicken is marinating in the refrigerator, prepare the herb spread. Combine all of the ingredients for the spread in a bowl.\r\nPrepare 2 shallow baking pans, by placing rack in each.\r\nBefore removing the chicken from the brine, preheat oven to 150* C (300* F).\r\nRemove chicken from brine and pat dry with paper towels. Place both chicken in a large bowl and add the spread. It might seem like a lot but it isn’t. Toss to coat the chicken in the spread thoroughly.\r\nPrepare 2 packets made out of 2 sheets of aluminum foil. Divide the chicken evenly between them and add any remaining spread over them.\r\nClose the packets securely and place them on the racks in the baking pans.\r\nPlace them in the oven and roast for 1 hour. Switch the baking pans, placing the one that was on a higher rack on the lower one, and vice versa. Roast for another 45 minutes to 1 hour. Pierce chicken with a thermometer to check the temperature, it should reach 68* C (154* F).\r\nRemove from oven and turn on the grill to 230* C (446* F). Break open the packages so that the chicken can brown. Empty the juices into a saucepan. Cook the chicken under the grill for 10-15 minutes, until golden brown.\r\nWhile the chicken is under the grill, place the saucepan with the juices on high heat. Bring to a boil until it reduces and starts to thicken a little. Add the honey. Remove from heat and add the apple cider vinegar.\r\nPlace chicken onto a serving platter and serve with sauce.', 'Lunch', 'Chicken', 'Bbq', '/images/Brined Roast Chicken.jpg'),
(12, 'Cacao Beef Ribs', '1 ½ kilos beef ribs\r\n1/3 cup cacao powder\r\n½ cup brown sugar\r\n2 tablespoons salt\r\n2 tablespoons onion powder\r\n1 tablespoon garlic powder\r\n1 tablespoon dry oregano\r\n1 tablespoon mustard powder\r\n2 teaspoons ginger powder\r\n2 teaspoons ground cinnamon\r\n1 teaspoon ground all spice\r\nMethod\r\nPhoto credit: G. Drakopoulos - Food Styling: T. Webb\r\n\r\nCombine the cacao powder, sugar and spices in a bowl. Rub the ribs with a generous amount of the spice rub. Cover with plastic wrap and refrigerate overnight.\r\nRemove from the refrigerator about 2 hours before serving and allow them to come to room temperature.\r\nPreheat oven to 180* C (350* F) Fan.\r\nPlace the ribs on a rimmed baking sheet lined with parchment paper.\r\nRoast for 40 minutes, until they soften.\r\nTurn up oven temperature to 200* C (390* F) and transfer to a baking pan lined with a wire rack, curved side up. Roast for another 15-20 minutes, turning them over once,  until golden brown.\r\nChop into pieces and serve! ', 'Lunch', 'Beef', 'Dinner Parties', '/images/Cacao Beef Ribs.jpg'),
(10, 'Beef Tacos', 'For taco shells\r\n\r\nolive oil, for brushing\r\n80 g chickpea flour\r\n220 ml water\r\n½ teaspoon salt\r\nFor filling\r\n\r\n1 tablespoon olive oil\r\n½ onion, finely chopped\r\n1 tomato, finely chopped\r\n250 g lean ground beef\r\n½ - 1 chili pepper, seeds removed and thinly sliced\r\n200 g can chopped tomatoes\r\nsalt\r\nTo serving\r\n\r\ntomatoes, chopped in to small cubes\r\nthinly sliced onions\r\nlettuce leaves\r\n \r\n\r\nMethod\r\nFor the taco shells\r\n\r\nPreheat oven to 180* C (350* F) Fan.\r\nPlace a pan over medium heat and let it get very hot.\r\nIn a bowl, lightly whisk the flour, water and salt for 1-2 minutes, until there are no lumps.\r\nAdd 1/6 of the mixture to the pan.\r\nCook for 40-50 seconds on each side, until golden.\r\nWhen ready, remove from pan and repeat the same process for the remaining 5 tortillas and set them aside until needed.\r\nOverturn a muffin pan. Fold each tortilla in half and place between the muffin molds.\r\nBake for 20-30 minutes, until crunchy.\r\nWhen ready, carefully remove the tortillas and set them aside to cool.\r\nFor the filling\r\n\r\nPlace a pot or a deep pan over medium heat and add the olive oil.\r\nAdd the onion. Stir and sauté until it softens.\r\nTurn up the heat and add the ground meat. Break up the meat and stir every so often until it browns nicely.\r\nWhen ready, lower heat and add the tomatoes, chili pepper and canned tomatoes. Stir to combine.\r\nSeason with salt and pepper, cover pot and simmer for 20-30 minutes. Stir every so often until it is ready.\r\nTo serve\r\n\r\nFill the taco shells with the filling and add all of the toppings – tomatoes, onion and lettuce or any of your personal favorites.', 'Lunch', 'Beef', 'Children\'s birthday party', '/images/Beef Tacos.jpg'),
(9, 'Healthy Chicken Burg', '1 ½ liters water\r\n6 chicken breast fillets\r\n1 teaspoon ground cumin\r\n2 red  horned peppers (Florinis from a jar) + 2 tablespoons oil from the jar\r\n1 onion\r\n3 tablespoon olive oil\r\n150 g canned tomatoes\r\n1 tablespoon brown sugar\r\n60 g apple cider vinegar or white wine\r\n1 tablespoon Worcestershire sauce\r\nTo serve\r\n\r\n6 hamburger buns\r\n¼ purple cabbage\r\n3 spring onions\r\n1 avocado\r\nMethod\r\nPlace a pot over medium heat and add the water, chicken breasts and cumin.\r\nBoil for 30-40 minutes, until the fillets have cooked through. Add more water if necessary to keep them submerged at all times.\r\nWhen ready, remove pot from heat and drain.\r\nCut the red peppers into 1 cm slices and finely chop the onion.\r\nPlace a pan over high heat. Add the oil from the jar, 2 tablespoons of olive oil, red peppers and onion.\r\nSauté for 3-4 minutes.\r\nAdd the canned tomatoes and brown sugar. Sauté for 1-2 minutes.\r\nAdd the apple cider vinegar and let it reduce to half. Then add the Worcestershire sauce.\r\nIn the meantime, tear apart the chicken in a bowl with your hands.\r\nAdd the chicken to the pan and stir with a wooden spoon until the mixture is completely combined.\r\nDivide the chicken mixture between the hamburger buns (bottom)..\r\nFinely chop the cabbage and spring onions, thinly slice the avocado and transfer to a bowl.\r\nSeason with salt and pepper. Drizzle with 1 tablespoon of olive oil and toss.\r\nAdd over chicken mixture, cover with hamburger buns and serve.', 'Lunch', 'Chicken', 'Bbq', '/images/Healthy Chicken Burger.jpg'),
(14, 'Breaded Fish Fillet ', '5 slices of bread\r\ngrated zest of 2 lemons\r\n2 tablespoons lemon juice, and lemon wedges for serving\r\na small handful of chopped parsley leaves\r\n8 cod fillets (150 g each)\r\n1 tablespoon olive oil\r\nthyme\r\npepper\r\nsalt\r\nPotato wedges, to serve\r\nFor yogurt tartar sauce:\r\n\r\n200 g strained yogurt, preferably Greek\r\n2 tablespoons pickles, rinsed\r\n1 tablespoon salted capers, rinsed and chopped\r\n1 tablespoon chopped fresh dill\r\ngrated zest and juice from 1 lemon\r\nMethod\r\nThis recipe calls for fresh cod fillets not dried and salted cod. It is a light and tasty dish that is baked in the oven instead of fried.\r\n\r\nPreheat oven to 180* C (350* F) Fan.\r\nBeat the bread in a food processor until it breaks down into coarse breadcrumbs.\r\nAdd the lemon zest, salt, pepper, thyme and parsley. Continue beating.\r\nLine a baking pan with parchment paper.\r\nSeason the fish with salt and pepper, Drizzle with olive oil and the juice and zest from 1 lemon. Spread the marinade all over the fillets.\r\nTransfer to the baking pan and coat with the bread mixture. Drizzle with a little more olive oil.\r\nPlace the fish in the oven and bake for 6-8 minutes, until crunchy and golden brown.\r\nFor the yogurt tartar sauce:\r\n\r\nFinely chop the pickle and capers and transfer to a bowl. Add the grated zest and juice from 1 lemon and some finely chopped dill. Add the yogurt and mix with a spoon.\r\nServe the fish with potato wedges and yogurt tartar sauce.', 'Lunch', 'Fish', 'Dinner Parties', '/images/Breaded Fish Fillet with Yogurt.jpg'),
(29, 'Eggs and Bacon Breakfast', '1 sheet of puff pastry\r\n200 g bacon, finely chopped\r\n150 g feta cheese, crumbled\r\n6 eggs\r\n4 tablespoons grated parmesan cheese\r\n5-6 sprigs fresh thyme, only the leaves, finely chopped\r\nsalt\r\nfreshly ground pepper\r\nMethod\r\nA perfect way to start off your day!\r\n\r\nPreheat oven to 190* C (374* F) Fan.\r\nHeat a little oil in a pan, over medium heat. Add the bacon and cook for 5 minutes or until crunchy. Mix until all sides are crispy. Remove from pan and strain on paper towels.\r\nAdd the crumbled feta cheese, thyme leaves, salt, pepper and 1 tablespoon of olive oil. Stir gently with a spoon.\r\nSpread the sheet of puff pastry on a working surface. Cut into 6 equal sized squares. Use a sharp pointed knife to make a border, about 1 cm thick, around each square, like a frame. Pierce the base of each square with a fork so the puff pastry won’t puff in the middle.\r\nLine a large baking pan with parchment paper. Arrange the puff pastry squares in the baking pan.\r\nSpread filling into the center of each pasty square. Carefully break 1 egg over each square.\r\nSprinkle grated parmesan over each egg.\r\nBake for 20 minutes.\r\nServe with freshly ground pepper and some rocket leaves.\r\n', 'Breakfast', 'Pork', 'Bbq', '/images/Eggs and Bacon Breakfast Tartlet.jpg'),
(32, 'Chia and berry porridge', '2 coconuts\r\n70 g oat flakes\r\n400 g milk\r\n1 tablespoon chia seeds\r\n¼ teaspoon ground cinnamon\r\npinch of salt\r\nTo serve\r\n\r\n100 g berries, various\r\n4 edible flowers\r\n4 teaspoons maple syrup\r\nMethod\r\nUse a knife to break open the coconuts in half, lengthwise. Wash them and pat them dry with paper towels.\r\nPlace a saucepan over medium heat and add the oat flakes and milk. Mix and bring to a boil. Cook for 5 minutes once it starts boiling, until the oats soak up all of the milk and remove from heat.\r\nAdd the chia seeds, cinnamon and salt.\r\nMix with a wooden spoon and divide the porridge between the coconut shells, that will be your bowls!\r\nTop with fresh berries and an edible flower in each coconut shell.\r\nDrizzle each portion with 1 teaspoon of maple syrup and serve.', 'Breakfast', 'Fruit', 'Children\'s birthday party', '/images/Chia and berry porridge.jpg'),
(33, 'Cherry and beetroot smoothie', '100 g beetroot, boiled and skin removed\r\n100 g cherries. pitted\r\n250 g low fat milk or almond milk\r\n1 tablespoon honey or maple syrup\r\npinch of chili flakes (optional)\r\nice\r\nMethod\r\nIn a blender, beat all of the ingredients until smooth. Serve.\r\n', 'Breakfast', 'Fruit', 'Children\'s birthday party', '/images/Cherry and beetroot smoothie.jpg'),
(28, 'Healthy oatmeal breakfast', '30 g oats\r\n80 g milk, low fat\r\n70 g Greek low fat yogurt\r\n1-1 ½ teaspoons chia seeds\r\n½ teaspoon ground cinnamon\r\n1 teaspoon honey\r\n80 g apple sauce, ready made\r\nMethod\r\nIn a 250 ml glass jar with lid, add the oats, milk, yogurt, chia seeds, cinnamon and honey.\r\nCover with lid and shake well until all of the ingredients are completely combined.\r\nRemove lid and add the apple sauce. Mix to incorporate.\r\nCover well with lid and refrigerate overnight.\r\nShould be eaten cold.', 'Breakfast', 'Fruit', 'Dinner Parties', '/images/Healthy oatmeal breakfast.jpg'),
(35, 'Prawns and green beans', '1200 g green beans\r\n200 g smoked turkey\r\n1 kilo prawns No 1, shells and heads removed\r\n3-4 tablespoons olive oil\r\nsalt\r\npepper\r\n20 g ginger\r\n1 clove of garlic\r\n50 g soy sauce\r\njuice from 1 lime\r\n1 tablespoon honey\r\n1 chili pepper, dried\r\n2 tablespoons sesame oil\r\n1 tablespoon sesame seeds\r\nMethod\r\nPlace a pot full of water over heat and bring to a boil.\r\nAdd the green beans and boil for 15 minutes.\r\nPlace a deep pan over high heat and add 1 tablespoon olive oil.\r\nChop the turkey into small cubes and add to pan. Sauté for 1-2 minutes, until golden. Transfer to a bowl and set aside.\r\nPlace the same pan over heat.\r\nAdd the prawns, 1 tablespoon olive oil, salt and pepper to the pan. Sauté for 2-3 minutes, until golden. Transfer to bowl with turkey.\r\nPlace same pan over heat and add 1-2 tablespoons olive oil.\r\nUsing a slotted spoon, transfer the green beans to the pan and sauté.\r\nGrate the ginger and garlic and add them to the pan.\r\nAdd the soy sauce, lime juice, honey, prawns, turkey, some salt, pepper and chili pepper. Toss.\r\nRemove from heat and add the sesame oil and sesame seeds. Mix.\r\nSprinkle with sesame seeds and serve.', 'Lunch', 'Seafood', 'Bbq', '/images/Prawns and green beans.jpg'),
(36, 'Sea Bass Fricassee', '4 tablespoons olive oil\r\n1 onion\r\n1 leek\r\n1 clove of garlic\r\nsalt\r\npepper\r\n100 g white wine\r\ngrated zest and juice of 1 lemon\r\ngrated zest and juice of 1 orange\r\n2 tablespoons honey\r\n500 g spinach\r\n100 g water\r\n4 sea bass fillets (European sea bass)\r\nTo serve\r\n\r\n3 orange wedges\r\n1/3 bunch dill\r\n1 teaspoon olive oil\r\nMethod\r\nPlace a deep pan over high heat and add 2 tablespoons of olive oil.\r\nFinely chop the onion, leek and garlic.\r\nAdd to the pan and stir. Season with salt and pepper and sauté for 2-3 minutes, until the vegetables caramelize nicely.\r\nDeglaze the pan with the wine and allow it to evaporate for 1-2 minutes.\r\nAdd the lemon zest, lemon juice, orange zest, orange juice and honey. Mix.\r\nAdd the spinach and water. Cook for about 5 minutes, until the spinach wilts.\r\nAdd the sea bass fillets, pepper and 2 tablespoons olive oil.\r\nCover pan with lid, lower heat to medium and simmer for 4 minutes.\r\nServe with orange wedges, finely chopped dill and extra virgin olive oil.', 'Lunch', 'Fish', 'Bbq', '/images/Sea Bass Fricassee.jpg'),
(37, 'Pasta salad with homemade almond pe', 'For pesto sauce\r\n\r\n100 g fresh basil\r\n70 g olive oil\r\n80 g almonds, blanched\r\ngrated zest of ½ lemon\r\n1 tablespoon lemon juice\r\n1 clove of garlic\r\n½ teaspoon chili flakes\r\nsalt\r\n200 g Greek nivato cheese 10%\r\nTo serve\r\n\r\n500 g fusilli pasta, boiled\r\n100 g cherry tomatoes\r\n1 cucumber\r\n100 g olives, pitted\r\nbasil leaves\r\npepper\r\n1 teaspoon olive oil\r\nMethod\r\nFor the almond pesto sauce\r\n\r\nIn a blender, add the basil, olive oil, almonds, lemon zest, lemon juice, minced garlic, chili flakes and salt.\r\nBeat thoroughly to create a paste.\r\nTransfer to a bowl and add the Greek nivato cheese.\r\nToss.\r\nTo serve\r\n\r\nIn a bowl, add the boiled fusilli and drizzle with almond pesto sauce.\r\nChop the cherry tomatoes unevenly, dice the cucumber and add to the bowl.\r\nAdd the olives and mix well.\r\nServe with basil leaves, pepper and ol\r\n', 'Lunch', 'Pasta', 'Dinner Parties', '/images/Pasta salad pesto sauce.jpg'),
(39, 'Sautéed salmon with fig sauce', '800 g salmon filets, skin removed\r\n1 tablespoon olive oil\r\nsalt\r\npepper\r\n10 g ginger\r\n1 clove of garlic\r\n200 g white wine\r\n200 g water\r\n150 g dried figs\r\n100 g fig balsamic vinegar\r\n1 tablespoon honey\r\nTo serve\r\n\r\nbasmati rice\r\nrosemary\r\nMethod\r\nPlace a non-stick pan over high heat.\r\nAdd the salmon fillets to the pan. Spread over them the olive oil, salt and pepper.\r\nTurn over the fillets. Sauté for 1-2 minutes on each side until golden.\r\nRemove the salmon from heat and set it aside.\r\nGrate the ginger and garlic.\r\nRemove the oil released by the salmon. Clean the pan and place it again over high heat.\r\nAdd the wine, ginger, garlic, salt, pepper and water. Mix until it comes to a boil.\r\nCut the figs into small pieces and add them to the pan with the rest of the ingredients.\r\nAdd the balsamic vinegar and cook for 2-3 minutes until the sauce thickens.\r\nAdd the honey, the salmon and cook for 2-3 minutes until the salmon is done.\r\nServe with basmati rice and rosemary.', 'Lunch', 'Fish', 'Valentines Day', '/images/Sautéed salmon with fig sauce.jpg'),
(44, 'Vegetarian burger', 'For burger\r\n1 onion\r\n2 cloves of garlic\r\n2 Portobello mushrooms\r\n2 tablespoons olive oil\r\n300 g potatoes, boiled\r\n150 g quinoa, boiled\r\n2 tablespoons fresh coriander, finely chopped\r\ngrated zest of 2 limes\r\n70 g all-purpose flour\r\nsalt\r\npepper\r\nTo server\r\n serve\r\n\r\n4 hamburger buns\r\n30 g ketchup\r\n1 tomato, cut into slices\r\n1 onion, cut into rounds\r\n4 lettuce leaves\r\npickled celery\r\nMethod\r\nFor the burger\r\nFinely chop the onion, garlic and mushrooms.\r\nHeat the olive oil in a pan over medium heat. Add the chopped vegetables and sauté for 3-4 minutes, until they turn golden and soften.\r\nIn a bowl, mash the boiled potatoes with a fork until almost pureed.\r\nAdd the sautéed vegetables and mix.\r\nAdd the quinoa, finely chopped coriander, lime zest, flour, salt and pepper.  \r\nMix and shape the mixture into 4 burger patties.\r\nTransfer to a baking pan and refrigerate for 30 minutes, until they become more firm.\r\nPreheat oven to 180* C (350* F) Fan.\r\nBake for 25-30 minutes.', 'Dinner', 'Vegetables', 'Children\'s birthday party', '/images/Vegetarian burger.jpg'),
(41, 'Smoked salmon wraps', 'For sauce\r\n\r\n200 g Greek nivato 10% (fresh cheese spread)\r\ngrated zest of ½ lemon\r\n1 tablespoon lemon juice\r\nfreshly ground pepper\r\n1 teaspoon chili flakes\r\n100 g fresh cucumber pickles\r\n1 teaspoon olive oil\r\nTo serve\r\n\r\n2 Arabic pita bread\r\n½ bunch mint, only the leaves\r\n200 g red cabbage\r\n200 g smoked salmon\r\n100 g rocket leaves\r\nMethod\r\nFor the sauce\r\n\r\nIn a bowl, combine the nivato cheese, lemon zest, lemon juice, pepper, chili flakes, finely chopped cucumber pickle and olive oil with a spoon.\r\nTo serve\r\n\r\nPlace the pita breads on a clean working surface.\r\nSpread the sauce over both pita breads.\r\nAdd the mint leaves, thinly sliced red cabbage and smoked salmon. Roll into a wrap.\r\nServe with rocket leaves.\r\n', 'Dinner', 'Seafood', 'Dinner Parties', '/images/Smoked salmon wraps.jpg'),
(43, 'Almond prune energy bars', '100 g walnuts\r\n250 g prunes, pitted\r\n400 g blanched almonds, finely ground\r\n85 g oat flakes\r\n85 g whole wheat flour\r\n1 teaspoon baking powder\r\n10 g flax seeds\r\ngrated zest of ½ lemon\r\n¼ teaspoons ground cinnamon\r\n¼ teaspoon ginger powder\r\n1 tablespoon honey + extra for serving\r\nMethod\r\nPreheat oven to 170* C (338* F) Fan.\r\nFinely chop the walnuts and prunes\r\nTransfer to a bowl and add the remaining ingredients: ground almonds, oats, flour, baking powder, flax seeds, lemon zest, cinnamon, ginger and honey.\r\nMix thoroughly with a wooden spoon, until all of the ingredients are completely combined.\r\nLine the bottom and sides of a 20x30 cm baking pan with parchment paper.\r\nAdd the mixture, spread it in the pan and press on it lightly to make even.\r\nBake for 30 minutes.\r\nWhen ready, remove from oven and allow to cool for 10 minutes.\r\nCut into pieces and serve with honey.', 'Dinner', 'Fruit', 'Children\'s birthday party', '/images/Almond prune energy bars.jpg'),
(45, 'Mini Pizzas', '500 g hard flour\r\n½ teaspoons salt\r\n7 g active dry yeast\r\n2 teaspoons brown sugar\r\n320 g water\r\na very small amount of olive oil to brush bowl\r\nextra flour to roll out dough\r\nFor salad:\r\n3 tablespoons tomato paste\r\n6 tomatoes, medium\r\n300 g cheddar cheese or your choice of cheese, grated\r\nsalt\r\npepper\r\noregano\r\n20 cherry tomatoes\r\n2 green peppers\r\nMethod\r\nIn a bowl, combine the flour, salt, sugar and yeast.\r\nCreate a small well in the center and add the water.\r\nMix with a spoon and then continue mixing by hand so you can create a nice dough.\r\nKnead for 10 minutes to make the dough smooth and elastic and transfer to a bowl brushed with olive oil.\r\nDust the top side with some flour, cover with plastic wrap and allow to rest for 15 minutes.\r\nRoll out dough until it is 1 cm thick. Dust with extra flour to help you roll it out easier.\r\nUse a 10 cm round cookie cutter or the bottom of a water glass.\r\nCover with a kitchen towel for 15 minutes so that they can rest and rise.\r\nPreheat oven to 180* C (350* F) Fan.\r\nRemove the seeds from the tomatoes and grate them into a bowl. Add the tomato paste and mix to create your sauce.\r\nSpread tomato sauce over the mini pizzas and sprinkle the grated cheddar over them.\r\nCut the cherry tomatoes into 3 parts, dice the green peppers into 0.5 cm cubes and add over the cheese.\r\nSprinkle with salt, pepper and oregano.\r\nBake for 12-15 minutes, until the cheese melts.', 'Dinner', 'Pasta', 'Dinner Parties', '/images/Mini Pizzas.jpg'),
(46, 'Unicorn cake', 'For buttermilk cake: \r\n\r\n150 g soft flour\r\n110 g all-purpose flour\r\n1 ½ teaspoons baking powder\r\n1 teaspoon salt\r\n90 g butter\r\n400 g granulated sugar\r\n½ cup sunflower oil\r\n1 tablespoon vanilla extract\r\n3 eggs and 4 egg yolks\r\n120 g buttermilk\r\n130 g heavy cream\r\nFor cream cheese frosting:\r\n\r\n250 g butter, at room temperature\r\n500 g icing sugar\r\n400 g cream cheese\r\n1 teaspoon vanilla extract\r\nFor decorative frosting:\r\n\r\n400 g butter, at room temperature\r\n200 g icing sugar\r\n1 teaspoon vanilla extract\r\npink food coloring\r\nTo decorate\r\n\r\ncolorful meringues\r\ncandies\r\ncolorful sprinkle shapes\r\nsugar paste unicorn horn\r\nsugar paste flowers\r\nMethod\r\nIn a bowl, sift both of the flours, baking powder and salt. Mix with a spoon.\r\nIn a mixer, beat the butter and sugar for 5 minutes using the paddle attachment, until light and fluffy.\r\nAdd the sunflower oil and beat on low speed. Add the eggs and egg yolks, one at a time, waiting for each addition to be completely incorporated before adding the next. Beat thoroughly and scrape down the sides of the bowl with a spatula to pull down all of the mixture.\r\nAdd the vanilla extract and mix thoroughly.\r\nAdd the flour mixture in 3 batches and the buttermilk in 2 batches. Mix after every addition\r\nBefore adding the final batch of flour, remove mixer’s bowl from stand. Add the flour and gently fold with a spatula. Do not overmix so that your cake turns out nice and fluffy.\r\nPreheat oven to 180* C (350* F) Fan.\r\nIn the meantime, in a bowl, beat the heavy cream into a light whipped cream. Add to the cake batter and gently fold with a silicon spatula.\r\nBrush two 20 cm cake pans with oil and line with parchment paper. Divide the mixture between them.\r\nBake for 35-40 minutes.\r\nWhen ready, remove from oven and allow to cool on a wire rack. Turn out onto the wire rack but do not remove the parchment. Allow them to cool completely so they can be ready for you to assemble.', 'Dessert', 'Chocolate', 'Valentines Day', '/images/Unicorn cake.jpg'),
(47, 'Moca Mousse', '300 g chocolate 65%, in chips\r\n160 g vegetable cream\r\n3 medium eggs\r\n1 tablespoon coconut sugar\r\n2 tablespoons strong coffee in liquid form or coffee extract\r\n1 tablespoon dark rum (optional)\r\n100 g fresh raspberries, for serving\r\n100 g fresh strawberries, for serving\r\n50 g fresh blueberries, for serving\r\nicing sugar, for serving\r\nMethod\r\nIn a bowl, add the chocolate and set aside for later.\r\nHeat the vegetable cream in a pot over medium heat until it comes to a boil.\r\nWhen the cream comes to a boil, remove pot from heat and pour the cream in the bowl with the chocolate.\r\nSet side for a few seconds until the chocolate heats. Whisk until homogenized and you have a smooth ganache.\r\nSeparate the egg whites and the yolks.\r\nIn a bowl, whisk 2 yolks and the coconut sugar for 2-3 minutes until fluffy.\r\nAdd the chocolate ganache to the bowl with the yolks, and then add the coffee or the vanilla extract and the rum. Whisk until homogenized.\r\nIn the mixer’s bowl, beat the 3 egg whites for 3 minutes on high speed until they become fluffy and you have a thick meringue.\r\nRemove mixer’s bowl from stand and add the meringue to the bowl in batches with the ganache.\r\nGently stir with a silicone spatula, until the mixture homogenizes.\r\nPour in bowls and refrigerate for 2-3 hours until thickened.\r\nDecorate with fresh fruits.\r\nSprinkle with icing sugar and serve.', 'Dessert', 'Chocolate', 'Valentines Day', '/images/Moca Mousse.jpg');

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
(17, 37),
(28, 18),
(28, 19),
(28, 30),
(28, 31),
(28, 37),
(29, 7),
(29, 9),
(29, 24),
(32, 19),
(32, 30),
(33, 16),
(33, 19),
(33, 38),
(35, 8),
(35, 9),
(35, 11),
(35, 22),
(35, 27),
(36, 8),
(36, 9),
(36, 26),
(37, 8),
(37, 9),
(37, 15),
(37, 38),
(39, 9),
(39, 26),
(41, 9),
(41, 26),
(41, 27),
(43, 18),
(43, 19),
(43, 37),
(43, 38),
(44, 7),
(44, 8),
(44, 9),
(44, 37),
(45, 9),
(45, 15),
(45, 24),
(46, 19),
(46, 29),
(46, 30),
(46, 31),
(46, 38),
(47, 19),
(47, 29),
(47, 30),
(47, 38);

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
