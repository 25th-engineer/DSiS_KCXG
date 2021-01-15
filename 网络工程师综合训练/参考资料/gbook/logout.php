<?php
session_start();
$_SESSION["login"]="";
echo "已成功退出。[<a href=index.php>回首页</a>]";
exit;
?>