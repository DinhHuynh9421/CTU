<!DOCTYPE HTML>
<html>

<head>

    <?php

function TinhGiaiThua($n) {
    $giaiThua = 1;
    for ($i = 1; $i <= $n; $i++) {
        $giaiThua *= $i;
    }
    return $giaiThua;
}

$soCanTinh = 10;
$ketQua = TinhGiaiThua($soCanTinh);

echo "Giai thừa của $soCanTinh! là: $ketQua";

?>

    </body>

</html>