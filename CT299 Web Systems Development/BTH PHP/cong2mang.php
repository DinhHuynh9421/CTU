<!DOCTYPE HTML>
<html>

<head>

    <?php
function congHaiMang($a, $b) {
    $n = count($a);

    if (count($b) !== $n) {
        return "Lỗi: Hai mảng không cùng độ dài!";
    }
    $ketQua = array();

    for ($i = 0; $i < $n; $i++) {
        $ketQua[] = $a[$i] + $b[$i];
    }

    return $ketQua;
}
$a = array(344, 224, 223, 7737, 9922, -828);
$b = array(-344, -324, 123, 773, -9922, 828);

$ketQuaCong = congHaiMang($a, $b);

echo "Mảng a: " . implode(', ', $a) . "\n";
echo "<br>";
echo "Mảng b: " . implode(', ', $b) . "\n";
echo "<br>";
if (is_array($ketQuaCong)) {
    echo "Kết quả cộng hai mảng: " . implode(', ', $ketQuaCong);
} else {
    echo $ketQuaCong;
}
?>
    </body>

</html>