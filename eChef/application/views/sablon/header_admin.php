<html>
    <head>
        <title>ETF Vesti</title>
    </head>
    <body>
        <a href="<?php echo site_url("Admin/index"); ?>">Sve vesti</a> 
        <div style="float: right">
            Administrator: <?php echo $autor->ime." ".$autor->prezime." "; ?>
            <a href="<?php echo site_url("Admin/logout"); ?>">Izloguj se</a>
        </div>
        <br>
        <hr>