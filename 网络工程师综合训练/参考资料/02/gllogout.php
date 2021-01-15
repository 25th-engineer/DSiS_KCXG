
//版主退出

<?php
session_start();
if(isset($_SESSION['userword'])){
	unset($_SESSION['userword']);
	echo "<script>alert('成功退出！'); window.location.href='index.php';</script>";	
}else{
	echo "<script>alert('您尚未登录！'); window.location.href='index.php';</script>";	
}

?>