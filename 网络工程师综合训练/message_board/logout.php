<?php
//登出功能模块
if (!session_id()) session_start();
if(isset($_SESSION['user']))
{
    unset($_SESSION['user']);
}
header('Location: login.php');
