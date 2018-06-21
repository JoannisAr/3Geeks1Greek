<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <div class="col-md-12">
                <h2>Requirements</h2>
                <p></p>
                <hr class="margin-vert-40">
                <div class="row">
                    <div class="col-md-8">
                        <div class="tab-content">
                            <div class="tab-pane active in fade" id="faq">
                                <div class="panel-group" id="accordion">
                                    <?php
                                    foreach ($zahtevi as $zahtev) {
                                        //<!-- FAQ Item -->
                                        /* echo "<div class=\"panel panel-default panel-faq\">
                                          <div class=\"panel-heading\">
                                          <a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#faq-sub\">
                                          <h4 class=\"panel-title\">".$zahtev->ime." ".$zahtev->prezime." ".$zahtev->mail."<span class=\"pull-right\">
                                          <i class=\"glyphicon glyphicon-plus\"></i>
                                          </span>
                                          </h4>
                                          </a>
                                          </div>
                                          <div id=\"faq-sub\" class=\"panel-collapse collapse\">
                                          <div class=\"panel-body\">
                                          <a class=\"btn btn-default\" href=\"".site_url("Admin/prikaziCV/".$zahtev->idZ)."\">CV<a class=\"btn btn-default\" href=\"".site_url("Admin/sacuvajCV/".$zahtev->idZ)."\">Download CV</a>&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a class=\"btn btn-default\" href=\"".site_url("Admin/odobriZahtev/".$zahtev->idZ)."\" >Confirm</a> <a class=\"btn btn-default\" href=\"".site_url("Admin/odbijZahtev/".$zahtev->idZ)."\">Deny</a>
                                          </div>
                                          </div>
                                          </div>";
                                          // <!-- End FAQ Item --> */
                                        echo "</br>" . $zahtev->ime . " " . $zahtev->prezime . " " . $zahtev->mail . "</br><a class=\"btn btn-default\" href=\"" . site_url("Admin/sacuvajCV/" . $zahtev->idZ) . "\">Download CV</a>&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a class=\"btn btn-default\" href=\"" . site_url("Admin/odobriZahtev/" . $zahtev->idZ) . "\" >Confirm</a> <a class=\"btn btn-default\" href=\"" . site_url("Admin/odbijZahtev/" . $zahtev->idZ) . "\">Deny</a></br>";
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
