<?php
//检测用户是否登录，没有则重定向至登录页面
if (!session_id()) session_start();
$user = json_decode($_SESSION['user'], true);
if (!$user) {
    if (isAjax()) {
        exit(json_encode(['code' => 409, 'user' => '用户未登录']));
    }
    header('Location: login.php');
}
