//��������¼

<?php
session_start();
include("conn/conn.php");
if(isset($_SESSION['unc'])){
	echo "<script>alert('��ͬһ̨�����ϣ�������ͬʱʹ���û����͹���Ա���е�¼��'); window.location.href='index.php';</script>";		
}else{
	if(isset($_POST['Submit']) && $_POST['Submit']=="��¼")	{
		if($_POST['username']!="" && $_POST['password']!=""){					
			$check="select userword from tb_adm where userword='".$_POST['username']."'and password='".$_POST['password']."'";		
			$result=mysql_query($check,$conn);						
			$info=mysql_num_rows($result);								
   	 		if($info==1){
		 		$_SESSION["userword"]=$_POST['username'];  
      			echo "<script>alert('��¼�ɹ�'); window.location.href='admin_browse.php';</script>";
			}else{
				echo "<script>alert('��¼ʧ�ܣ����ǰ����˺�'); window.location.href='index.php';</script>";		
			}
		} 
	}else{
		echo "<script>alert('�˺Ų���Ϊ��'); window.location.href='index.php';</script>";		
	}
}
?>
 