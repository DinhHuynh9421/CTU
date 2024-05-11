<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <form method="post" action="">
        Tên Sinh Viên: <input type="text" name="name"><br>
        Mã số Sinh viên: <input type="text" name="masv"><br> <!-- Thêm name cho trường mã số sinh viên -->
        Ngày sinh: <input type="date" name="date"><br> <!-- Sử dụng type="date" để chọn ngày -->
        <button type="submit" name="submit">Submit</button> <!-- Thêm button để gửi form -->
    </form>
    <?php
class sinhvien {
   
    public $mssv;
    public $hoten;
    public $ngaysinh;
    
    public function __construct($mssv, $hoten, $ngaysinh) {
        $this->mssv = $mssv;
        $this->hoten = $hoten;
        $this->ngaysinh = $ngaysinh;
    }


    public function setSV($mssv, $hoten, $ngaysinh) {
        $this->mssv = $mssv;
        $this->hoten = $hoten;
        $this->ngaysinh = $ngaysinh;
    }
    function __destruct() {
     echo "Họ tên:" . $this->hoten;
        }
   
    public function getSV() {
        return array(
            'mssv' => $this->mssv,
            'hoten' => $this->hoten,
            'ngaysinh' => $this->ngaysinh
        );
    }

   
    public function tinhTuoi() {
        $now = new DateTime();
        $ngaysinh = new DateTime($this->ngaysinh);
        $tuoi = $now->diff($ngaysinh)->y;
        return $tuoi;
    }
}
?>
    <?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $sv = new sinhvien($_POST["masv"], $_POST["name"], $_POST["date"]);
    
   
    echo "MSSV: " . $sv->mssv . "<br>";
    echo "Họ tên: " . $sv->hoten . "<br>";
    echo "Ngày sinh: " . $sv->ngaysinh . "<br>";

    
    echo "Tuổi: " . $sv->tinhTuoi() . " tuổi";
}
?>

</body>

</html>