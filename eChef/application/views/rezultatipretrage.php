<html>
<head>
<title>
</title>
</head>
<body>
<table>
    <tr><th>Naziv</th><th>Obrok</th><th>Kategorija</th><th>Specijalna_prilika</th></tr>
<?php
foreach ($jela as $jelo) {
    echo "<tr><td>".$jelo->naziv."</td><td>".$jelo->obrok. "</td><td>".$jelo->kategorija."</td><td>".$jelo->spec_prilika."</td></tr>";
    echo "<td><a href=".site_url("$controller/prikaziJelo/".$jelo->idR)."\">$jelo->naziv  $jelo->obrok  $jelo->kategorija  $jelo->spec_prilika</a><td></tr>";
}
?>
</table>
</body>
</html>