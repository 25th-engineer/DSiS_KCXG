//检测版主登录

<?php
session_start();
include("conn/conn.php");
if(isset($_SESSION['unc'])){
	echo "<script>alert('在同一台机器上，不允许同时使用用户名和管理员进行登录！'); window.location.href='index.php';</script>";		
}else{
	if(isset($_POST['Submit']) && $_POST['Submit']=="登录")	{
		if($_POST['username']!="" && $_POST['password']!=""){					
			$check="select userword from tb_adm where userword='".$_POST['username']."'and password='".$_POST['password']."'";		
			$result=mysql_query($check,$conn);						
			$info=mysql_num_rows($result);								
   	 		if($info==1){
		 		$_SESSION["userword"]=$_POST['username'];  
      			echo "<script>alert('登录成功'); window.location.href='admin_browse.php';</script>";
			}else{
				echo "<script>alert('登录失败，不是版主账号'); window.location.href='index.php';</script>";		
			}
		} 
	}else{
		echo "<script>alert('账号不能为空'); window.location.href='index.php';</script>";		
	}
}
?>
 