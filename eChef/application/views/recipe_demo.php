<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <div class="col-md-12">
                <h2><?php echo $jelo[0]->naziv; ?></h2>                     
                <a href="<?php echo site_url("$controller/dodajUKnjigu/" . $jelo[0]->idR); ?>" class="btn btn-default" >add to book</a>
                <a href="<?php echo site_url("$controller/ukloniIzKnjige/" . $jelo[0]->idR); ?>" class="btn btn-default" >remove from book</a>

                <div class="row">
                    <div class="col-md-6 animate fadeIn">
                        <img src="<?php echo base_url() . $jelo[0]->slika; ?>" alt="Strudel" class="margin-top-10">
                    </div>
                    <div class="col-md-6 margin-bottom-10 animate fadeInRight">
                        <h3 class="padding-top-10 pull-left">Method
                        </h3>
                        <div class="clearfix"></div>
                        <p>
                            <?php echo $jelo[0]->sadrzaj; ?>
                        </p>
                    </div>
                </div>
                <hr>
                <div class="row animate fadeInUp">



                    <h2 class="text-center margin-top-10">Rate this recipe. You need to <a href="#"><font color="grey">login</font></a></h2>
                    <p class="text-center margin-bottom-30"><!-- My Skills -->
                    <h3 class="margin-bottom-10">Rating</h3>
                    <h3 class="progress-label"><a href="<?php echo site_url("$controller/oceni/" . $this->session->userdata('korisnik')->idK . "/4/" . $jelo[0]->idR); ?>">Par excellence</a>
                        <span class="pull-right">
                           <?php $suma = 0;
                                    $brojt = 0;
                                    foreach ($ocene as $ocena) {
                                        if ($ocena->ocena == 4) {
                                            $brojt = $ocena->broj;
                                        } $suma += $ocena->broj;
                                    } if($suma==0)
                                        {
                                            echo $suma."%";
                                        }
                                        else
                                            echo (($brojt / $suma) * 100) . "%"; ?>
                        </span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:
                            <?php $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 4) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            }
                            if($suma==0)
                                echo $suma."%";
                            else
                                echo (($brojt / $suma) * 100) . "%";?>">
                        </div>
                    </div>

                    <h3 class="progress-label"><a href="<?php echo site_url("$controller/oceni/" . $this->session->userdata('korisnik')->idK . "/3/" . $jelo[0]->idR); ?>">Excelent</a>
                        <span class="pull-right">
                           <?php $suma = 0;
                                    $brojt = 0;
                                    foreach ($ocene as $ocena) {
                                        if ($ocena->ocena == 3) {
                                            $brojt = $ocena->broj;
                                        } $suma += $ocena->broj;
                                    } if($suma==0)
                                        {
                                            echo $suma."%";
                                        }
                                        else
                                            echo (($brojt / $suma) * 100) . "%"; ?>
                        </span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100" style="width: 
                            <?php $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 3) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            }
                            if($suma==0)
                                echo $suma."%";
                            else
                                echo (($brojt / $suma) * 100) . "%";?>">
                        </div>
                    </div>
                    <h3 class="progress-label"><a href="<?php echo site_url("$controller/oceni/" . $this->session->userdata('korisnik')->idK . "/2/" . $jelo[0]->idR); ?>">Very good</a>
                        <span class="pull-right">
                            <?php $suma = 0;
                                    $brojt = 0;
                                    foreach ($ocene as $ocena) {
                                        if ($ocena->ocena == 2) {
                                            $brojt = $ocena->broj;
                                        } $suma += $ocena->broj;
                                    } if($suma==0)
                                        {
                                            echo $suma."%";
                                        }
                                        else
                                            echo (($brojt / $suma) * 100) . "%"; ?>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100" style="width: 
                            <?php $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 2) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            }
                            if($suma==0)
                                echo $suma."%";
                            else
                                echo (($brojt / $suma) * 100) . "%";?>">
                        </div>
                    </div>
                    <h3 class="progress-label"><a href="<?php echo site_url("$controller/oceni/" . $this->session->userdata('korisnik')->idK . "/1/" . $jelo[0]->idR); ?>">Not so tasty</a>
                        <span class="pull-right">
                            <?php $suma = 0;
                                    $brojt = 0;
                                    foreach ($ocene as $ocena) {
                                        if ($ocena->ocena == 1) {
                                            $brojt = $ocena->broj;
                                        } $suma += $ocena->broj;
                                    } if($suma==0)
                                        {
                                            echo $suma."%";
                                        }
                                        else
                                            echo (($brojt / $suma) * 100) . "%"; ?>
                        </span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 
                           <?php $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 1) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            }
                            if($suma==0)
                                echo $suma."%";
                            else
                                echo (($brojt / $suma) * 100) . "%";?>">
                        </div>
                    </div>
                    <!-- End My Skills --></p>

                </div>
                <hr class="margin-bottom-40">
                <div class="row">
                    <div class="col-md-6 animate fadeIn">
                        <!-- ovde su bile skale-->
                        <!-- Recent Posts -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Recent Posts</h3>
                            </div>
                            <div class="panel-body">
                                <ul class="posts-list margin-top-10">

<?php
foreach ($komentari as $komentar) {
    echo "<li><div class='recent-post'><p class='pull-left'>" . $komentar->username . "</p><a href='#' class='pull-right' class='posts-list-title'>" . $komentar->sadrzaj . "</a><br><span class='recent-post-date'>" . $komentar->vreme . "</span></div><div class='clearfix'></div>";
    if ($komentar->username == $this->session->userdata['korisnik']->username || $this->session->userdata['korisnik']->oznaka == 'A') {

        echo "<a href=\" " . site_url($controller . '/ukloniKomentar/' . $komentar->idK . '/' . $jelo[0]->idR) . " \" style='color:red;'>delete</a></li>";
    }
}
?>



                                </ul>
                            </div>
                        </div>
                        <!-- End recent Posts -->

                    </div>
                    <div class="col-md-6">
                        <!-- Accordion -->
                        <div id="accordion" class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" href="#collapse-One" data-parent="#accordion" data-toggle="collapse">
                                            Write a comment:
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-One" class="accordion-body collapse in">
                                    <div class="panel-body">
                                        <p>You need to be registred if you want to write a comments.If you have your account <a href="pages-login.html"><font color="black">login</font></a>, if don't <a href="pages-sign-up.html"><font color="black">make your account</font></a>. For writting <font color="red">click on bottom window.</font>  </p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" href="#collapse-Two" data-parent="#accordion" data-toggle="collapse">

                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-Two" class="accordion-body collapse">
                                    <div class="panel-body">
                                        <p>
                                        <form action="<?php echo site_url("$controller/dodajKomentar") ?>" method="get">
                                            <input type="text" name="comment" style="width:90%; height:90%;"><br>
                                            <input type="text" name="idr" value="<?php echo $jelo[0]->idR; ?>" style="display:none">
                                            <input type="submit" value="Submit">
                                        </form> 
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" href="#collapse-Three" data-parent="#accordion" data-toggle="collapse">
                                            Thank you for  participating in this communication
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-Three" class="accordion-body collapse">
                                    <div class="panel-body">
                                        <p>By writting a comments you help our chefs to improve recipes and your experience. Every suggestion is consider and you can expect improvements soon.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- === END CONTENT === -->
