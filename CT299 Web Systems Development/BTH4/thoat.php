<?php
session_start();

//Xóa các giá trị trong session
unset($_SESSION['user']);
unset($_SESSION['fullname']);
unset($_SESSION['id']);

// Xóa session
session_destroy();

//Chuyển hướng về trang đăng nhập
header('Location: login.php');
?>

