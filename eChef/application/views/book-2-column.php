<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <div class="col-md-12">
               
                <h2>BOOK</h2>
                 <?php 
                 if (!isset($jela))
                     echo "Your book is empty";
                     ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 portfolio-group no-padding">
                <?php
                if (isset($jela)) {
                    foreach ($jela as $jelo) {
                        echo '<div class="' . 'col-md-6 portfolio-item margin-bottom-40 filer-code"' . ">";
                        echo "<div>";
                        echo '<a href=' . site_url("$controller/prikaziJelo/" . $jelo->idR) . '>';
                        echo "<figure>";
                        echo '<img src="' . base_url() . $jelo->slika . '">';
                        echo"<figcaption>";
                        echo'<h3 class="' . 'margin-top-20">' . $jelo->naziv . "</h3>";
                        echo"<span>" . $jelo->obrok . $jelo->kategorija . "</span>";
                        echo"</figcaption>";
                        echo"</figure>";
                        echo"</a>";
                        echo"</div>";
                        echo"</div>";
                    }
                }
                ?>
            </div>
        </div>
    </div>
</div>
