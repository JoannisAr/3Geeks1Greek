<html>
    <head>
      <!-- Title -->
        <title>eChef</title>
        <!-- Meta -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <!-- Favicon -->
        <link href="favicon.ico" rel="shortcut icon">
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/bootstrap.css" rel="stylesheet">
        <!-- Template CSS -->
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/animate.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/nexus.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url();?>assets/css/custom.css" rel="stylesheet">
        <!-- Google Fonts-->
        <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="body-bg">
            
            
            <!-- Top Menu -->
            <div id="hornav" class="bottom-border-shadow">
                <div class="container no-padding border-bottom">
                    <div class="row">
                        <div class="col-md-8 no-padding">
                            <div class="visible-lg">
                                <ul id="hornavmenu" class="nav navbar-nav">
                                    <li>
                                        <a href="home.html" class="fa-home active">Home</a>
                                    </li>
                                    <li>
                                        <span class="fa-gears ">Recipes</span>
                                        <ul>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Lamb"); ?>">Lamb</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Turkey"); ?>">Turkey</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Chicken"); ?>">Chicken</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Beef"); ?>">Beef</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Pork"); ?>">Pork</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Fish"); ?>">Fish</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Fruit"); ?>">Fruit</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Vegetables"); ?>">Vegetables</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Seafood"); ?>">Seafood</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Pasta"); ?>">Pasta</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Rice"); ?>">Rice, Risotto and Orzo</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPoSastojku/Chocolate"); ?>">Chocolate</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="parent">
                                                <span>Special Meals</span>
                                                <ul>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziKategoriju/Breakfast"); ?>">Breakfast</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziKategoriju/Lunch"); ?>">Lunch</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziKategoriju/Dessert"); ?>">Dessert</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziKategoriju/Dinner"); ?>">Dinner</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="parent">
                                                <span>Holiday Recipes</span>
                                                <ul>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Christmas"); ?>">Christmas</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Easter"); ?>">Easter</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Dinnerparties"); ?>">Dinner parties</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Valentinesday"); ?>">Valentines day</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Bqq"); ?>">Bqq</a>
                                                    </li>
                                                    <li>
                                                        <a href="<?php echo site_url("$controller/prikaziPrilika/Childrenparty"); ?>">Children's birthday party</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>                                                           								                              
                                    <li>
                                        <a href="contact.html" class="fa-comment ">Logout</a>
                                    </li>                              
                                    <li>
                                        <a href="<?php echo site_url("$controller/prikazipretraga"); ?>" ><img src="<?php echo base_url();?>assets/img/search.png" alt="search" width="20" height="20"/></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 no-padding">
                            <ul class="social-icons pull-right">
							
                                <li class="social-rss">
                                    <a href="#" target="_blank" title="RSS"></a>
                                </li>
                                <li class="social-twitter">
                                    <a href="#" target="_blank" title="Twitter"></a>
                                </li>
                                <li class="social-facebook">
                                    <a href="#" target="_blank" title="Facebook"></a>
                                </li>
                                <li class="social-googleplus">
                                    <a href="#" target="_blank" title="Google+"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>