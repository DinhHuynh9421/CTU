<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "qlbanhang";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "select password from customers";

$result = $conn->query($sql);
$row = $result->fetch_array();
$password = md5($_POST['password']);


if ($password == $row['password']) 
{
    if ($_POST['new_password'] == $_POST['confirm_password'] ) {
      $sql1 = "UPDATE customers SET password = '".md5($_POST['new_password'])."'";
    $conn->query($sql1);
  }
}

$conn->close();
echo " Doi mat khau thanh cong!";
?>