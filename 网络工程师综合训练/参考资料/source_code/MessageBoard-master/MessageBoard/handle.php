<?php
//  开启session
session_start();
$user = $_POST["username"];
$password = $_POST["password"];

require "DBManager.php";
$dbmanager = new CMessageBoardDBM();
$sql = "select password from pinfo where username=$user";
$result = $dbmanager->Query($sql);

if ($result->num_rows <= 0)
{
    header("location:register.php");
    exit;
}

if (empty($password) || empty($user))
    echo "登录失败";
else
{
    $_SESSION["username"]=$user;
    header("location:main.php");
}
?>