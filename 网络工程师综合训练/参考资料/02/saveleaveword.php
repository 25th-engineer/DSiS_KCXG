<?php
session_start();	//����session֧��
include_once("conn/conn.php");		//�������ݿ������ļ�
include_once("function.php");		//����ϵͳ�����ļ�
if(isset($_SESSION["unc"])){        //�Ե�¼�û������ж�
	$sql=mysql_query("select id from tb_user where usernc='".$_SESSION["unc"]."'");   //��ѯ��ǰ�û����ݱ��е���Ϣ
	$info=mysql_fetch_array($sql);   //�ӽ�����л�ȡ��Ϣ
	$userid=$info['id'];	//��ȡ�û���id
}
if(isset($_SESSION['userword'])){
	$sql=mysql_query("select id from tb_adm where userword='".$_SESSION["userword"]."'");
	$info=mysql_fetch_array($sql);
	$userid=$info['id'];
}
if(isset($_POST['content'])){
	if (is_file("filterwords.txt")){					//�жϸ����ļ����Ƿ�Ϊһ���������ļ�
	    $filter_word = file("filterwords.txt");		//�������ļ�����һ��������
		$content=$_POST['content'];
		$title=$_POST['title'];
		for($i=0;$i<count($filter_word);$i++){			//Ӧ��Forѭ���������дʽ����ж�		
		   if(preg_match("/".trim($filter_word[$i])."/i",$content)){		//Ӧ��������ʽ���жϴ��ݵ�������Ϣ���Ƿ������д�
			  echo "<script>alert('������Ϣ�а������дʣ�');history.back(-1);</script>";
		 	  exit;
		   }
	    }
	}
	$createtime=date("Y-m-d H:i:s");//��ȡ����ʱ��
	
	if(mysql_query("insert into tb_leaveword(userid,createtime,title,content)values('$userid','$createtime','$title','$content')")){ 
	   echo "<script>alert('���Է���ɹ���');window.location.href='index.php?id=".urlencode('�鿴����')."';</script>";	
	   //��ҳ�����ύ��������Ϣ��д�뵽���ݿ����Ա��У���ʾ���Գɹ�����ת���鿴����
	}else{
	   echo "<script>alert('���Է���ʧ�ܣ�');history.back();</script>";
	}
}
?>
