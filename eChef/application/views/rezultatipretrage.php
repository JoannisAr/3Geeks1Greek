
<html>
<head>
<title>
</title>
</head>
<body>
<table>
    <tr><th>Naziv</th><th>Obrok</th><th>Kategorija</th><th>Specijalna prilika</th></tr>
<?php
foreach ($jela as $jelo) {
    echo "<tr><td>".$jelo->naziv."</td><td>".$jelo->obrok. "</td><td>".$jelo->kategorija."</td><td>".$jelo->spec_prilika."</td></tr>";
   // echo "<td><a href=\"".site_url("$controller/prikazivest/".$vest->id)."\">Prikazi</a><td></tr>";
}
?>

</table>
</body>
</html>