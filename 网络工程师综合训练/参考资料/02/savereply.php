///�Իظ������Խ��д�������ҳ��

<?php
session_start();
include_once("conn/conn.php");
include_once("function.php");		//����ϵͳ�����ļ�
if(isset($_POST['title'])){
	if (is_file("./filterwords.txt")){					
	    $filter_word = file("./filterwords.txt");		
		$content=$_POST['content'];
		for($i=0;$i<count($filter_word);$i++){			
		   if(preg_match("/".trim($filter_word[$i])."/i",$content)){		
			  echo "<script>alert(�ظ�������Ϣ�а������дʣ�');history.back(-1);</script>";
		 	  exit;
		   }
	    }
	}
	if(isset($_SESSION["unc"])){
	$sql=mysql_query("select id from tb_user where usernc='".$_SESSION["unc"]."'");
	$info=mysql_fetch_array($sql);
	$userid=$info['id'];
}
if(isset($_SESSION['userword'])){
	$sql=mysql_query("select id from tb_adm where userword='".$_SESSION["userword"]."'");
	$info=mysql_fetch_array($sql);
	$userid=$info['id'];
}

	$createtime=date("Y-m-d H:i:s");		//��ȡ�ظ�����ʱ��
	if(mysql_query("insert into tb_replyword (userid,createtimes,titles,contents,leave_id)values('$userid','$createtime','".$_POST['title']."','$content','".$_POST['t_id']."')")){
	   echo "<script>alert('���Իظ�����ɹ���');history.back();</script>";
	}else{
	   echo "<script>alert('���Իظ�����ʧ�ܣ�');history.back();</script>";
	}
}
?>
