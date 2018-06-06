<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <div class="col-md-12">
                <h2><?php echo $jelo[0]->naziv; ?></h2>                          
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
                    <h3 class="progress-label"><a href="">Par excellence</a>
                        <span class="pull-right">
                            <?php
                            $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 4) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            }
                            echo(($brojt / $suma) * 100) . "%";
                            ?>
                        </span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:<?php
                        $suma = 0;
                        $brojt = 0;
                        foreach ($ocene as $ocena) {
                            if ($ocena->ocena == 4) {
                                $brojt = $ocena->broj;
                            } $suma += $ocena->broj;
                        } echo (($brojt / $suma) * 100) . "%";
                        ?>">
                        </div>
                    </div>

                    <h3 class="progress-label"><a href="">Excelent</a>
                        <span class="pull-right"><?php
                            $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 3) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            } echo (($brojt / $suma) * 100) . "%";
                            ?></span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100" style="width: <?php
                        $suma = 0;
                        $brojt = 0;
                        foreach ($ocene as $ocena) {
                            if ($ocena->ocena == 3) {
                                $brojt = $ocena->broj;
                            } $suma += $ocena->broj;
                        } echo (($brojt / $suma) * 100) . "%";
                        ?>">
                        </div>
                    </div>
                    <h3 class="progress-label"><a href="">Very good</a>
                        <span class="pull-right"><?php
                            $suma = 0;
                            $brojt = 0;
                            foreach ($ocene as $ocena) {
                                if ($ocena->ocena == 2) {
                                    $brojt = $ocena->broj;
                                } $suma += $ocena->broj;
                            } echo (($brojt / $suma) * 100) . "%";
                        ?></span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100" style="width: <?php
                        $suma = 0;
                        $brojt = 0;
                        foreach ($ocene as $ocena) {
                            if ($ocena->ocena == 2) {
                                $brojt = $ocena->broj;
                            } $suma += $ocena->broj;
                        } echo (($brojt / $suma) * 100) . "%";
                        ?>">
                        </div>
                    </div>
                    <h3 class="progress-label"><a href="">Not so tasty</a>
                        <span class="pull-right"><?php
                        $suma = 0;
                        $brojt = 0;
                        foreach ($ocene as $ocena) {
                            if ($ocena->ocena == 1) {
                                $brojt = $ocena->broj;
                            } $suma += $ocena->broj;
                        } echo (($brojt / $suma) * 100) . "%";
                        ?></span>
                    </h3>
                    <div class="progress progress-sm">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: <?php
                        $suma = 0;
                        $brojt = 0;
                        foreach ($ocene as $ocena) {
                            if ($ocena->ocena == 1) {
                                $brojt = $ocena->broj;
                            } $suma += $ocena->broj;
                        } echo (($brojt / $suma) * 100) . "%";
                        ?>">
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
}
?>



                                </ul>
                            </div>
                        </div>
                        <!-- End recent Posts -->

                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- === END CONTENT === -->
