
//�����˳�

<?php
session_start();
if(isset($_SESSION['userword'])){
	unset($_SESSION['userword']);
	echo "<script>alert('�ɹ��˳���'); window.location.href='index.php';</script>";	
}else{
	echo "<script>alert('����δ��¼��'); window.location.href='index.php';</script>";	
}

?>