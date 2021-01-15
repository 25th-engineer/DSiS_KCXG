<?php
require_once "conect.php";
require_once 'DBtest.php';
$id=$_POST['uid'];
session_start();
$_SESSION["uid"]=$id;
$password=$_POST['password'];
$ma1=new DB();
$link=$ma1->connect();
$sql = "select * from PERSON where username='$id' and password='$password'"; 
$res = $ma1->CheckUser($link,$sql);
if($res){
    header("Location:addMsg.php");//登陆成功后要显示的页面
 }
if(!$res){
    echo "<script>alert('登录失败，账号或密码错误');location='login.php';</script>";
 }
?>