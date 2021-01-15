////注册 用于对表单中提交的数据进行处理，将数据保存到指定的数据表中//////

<?php
session_start();		//启用session支持
include_once("function.php");		//包含系统功能文件
if(isset($_SESSION['userword'])){		//获取登录的版主名称
	echo "<script>alert('在同一台机器上，不允许同时使用用户名和管理员进行登录！'); window.location.href='index.php';</script>";		//给出用户与版主不能同时登录的信息		
	}else{
 include_once("conn/conn.php");		//包含数据库文件
 $usernc=$_POST["usernc"];			//调用注册时提交的用户名称
 $sql=mysql_query("select usernc from tb_user where usernc='".$usernc."'",$conn);		//查询用户表中已注册用户的名称是否与当前提交的用户名相同
 $info=mysql_fetch_array($sql);		//输出查询的数据
 		if($info){
   echo "<script>alert('对不起，你的昵称已经被占用！');history.back();</script>";		//相同的给出提示
   exit;
 				 }
 $ip=$_SERVER["REMOTE_ADDR"];
 if(mysql_query("insert into tb_user(usernc,userpwd,truename,email,qq,tel,ip,address,face,regtime,sex,usertype) values('".$usernc."','".md5(trim($_POST["userpwd"]))."','".$_POST["truename"]."','".$_POST["email"]."','".$_POST["qq"]."','".$_POST["tel"]."','".$ip."','".$_POST["address"]."','".$_POST["face"]."','".date("Y-m-d H:i:s")."','".$_POST["sex"]."','0')",$conn))
 {
   $_SESSION["unc"]=$usernc;  
   echo "<script>alert('注册成功！');window.location.href='index.php'</script>";
 }else{
   echo "<script>alert('注册失败！');history.back();</script>";
	  }
}
?>