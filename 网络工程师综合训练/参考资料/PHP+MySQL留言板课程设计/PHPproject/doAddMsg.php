<?php
    session_start();
    $id=$_SESSION["uid"];
    $title = $_POST["title"];  
    $author = $_POST["author"];
    $content = $_POST["content"];  
    $ip = $_SERVER["REMOTE_ADDR"];
    require_once "conect.php";
    require_once 'DBtest.php';
    $ma1=new DB();
    $link=$ma1->connect();
    $sql = "insert into MSG (user,title,author,ip,content,time) values('$id','$title','$author','$ip','$content',now())";
    if($title!=null){
        if($author!=null){
            $res = $ma1->insertl($link,$sql);
        }
        if($author==null){
            echo "<script>alert('请输入留言者！');location='addMsg.php';</script>";
        }
    }
    if($title==null){
       echo "<script>alert('请输入留言标题！');location='addMsg.php';</script>";
    }
?>
