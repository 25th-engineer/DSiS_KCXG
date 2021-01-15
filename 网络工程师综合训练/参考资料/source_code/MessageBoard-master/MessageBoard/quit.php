<?php
//  退出时清除session，并返回登录界面
session_start();
unset($_SESSION["username"]);
header("location:login.php");
?>