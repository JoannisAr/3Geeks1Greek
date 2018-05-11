<html>
    <head>
        <title>ETF Vesti</title>
    </head>
    <body>
        <a href="<?php echo site_url("Korisnik/index"); ?>">Sve vesti</a> 
        <a href="<?php echo site_url("Korisnik/mojevesti"); ?>">Moje vesti</a> 
        <a href="<?php echo site_url("Korisnik/dodajvest"); ?>">Dodaj vest</a>
        <div style="float: right">
            Autor: <?php echo $autor->ime." ".$autor->prezime." "; ?>
            <a href="<?php echo site_url("Korisnik/logout"); ?>">Izloguj se</a>
        </div>
        <br>
        <hr>