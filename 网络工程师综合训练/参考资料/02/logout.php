/////ע����¼/////////

<?php
session_start();
if(isset($_SESSION['unc'])){
	unset($_SESSION['unc']);
	echo "<script>alert('ע���ɹ���'); window.location.href='index.php';</script>";	
}else{
	echo "<script>alert('����δ��¼��'); window.location.href='index.php';</script>";	
}

?>