
//����û���¼

<?php
session_start();
if(isset($_SESSION['userword'])){
	echo "<script>alert('��ͬһ̨�����ϣ�������ͬʱʹ���û����͹���Ա���е�¼��'); window.location.href='index.php';</script>";		
}else{
include_once("conn/conn.php");
if(isset($_POST["usernc"]) && isset($_POST["userpwd"])){
$sql=mysql_query("select usertype from tb_user where usernc='".$_POST["usernc"]."' and userpwd='".md5(trim($_POST["userpwd"]))."'",$conn);
$info=mysql_num_rows($sql);
if($info==1){
    $_SESSION['unc']=$_POST["usernc"];
	echo "<script>alert('��¼�ɹ���');window.location.href='index.php';</script>"; 
}else{
  echo "<script>alert('��¼ʧ�ܣ�');history.back();</script>";
}
}
}
?>