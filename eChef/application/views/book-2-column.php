           <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <h2>2 Column Portfolio</h2>
                            <!-- Filter Buttons -->
                            <div class="portfolio-filter-container margin-top-20">
                                <ul class="portfolio-filter">
                                    <li class="portfolio-filter-label label label-primary">
                                        filter by:
                                    </li>
                                    <li>
                                        <a href="#" class="portfolio-selected btn btn-default" data-filter="*">All</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".code">Breakfast</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".design">Lunch</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".audio">Dessert</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".video">Dinner</a>
                                    </li>
                                </ul>
                            </div>
                     <!-- End Filter Buttons -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 portfolio-group no-padding">
                            <!-- Portfolio Item -->
                            <?php
                              foreach ($jela as $jelo) {
                           echo '<div class="'.'col-md-6 portfolio-item margin-bottom-40 filer-code"'.">";
                             echo "<div>";
                                   echo '<a href="recipe1.html">';
                                  echo "<figure>";
                                  ?>
                            <?php   
					echo '<img src="'.base_url().$jelo->slika.'">';
                                           echo"<figcaption>";
                                              echo'<h3 class="'.'margin-top-20">'.$jelo->naziv."</h3>";
                                       echo"<span>".$jelo->obrok.$jelo->kategorija."</span>";
                                       echo"</figcaption>";
                                     echo"</figure>";
                                 echo"</a>";
                           echo"</div>";
                          echo"</div>";
                          }?>
                            <!-- End Portfolio Item -->
                        </div>
                    </div>
                </div>
            </div>
      