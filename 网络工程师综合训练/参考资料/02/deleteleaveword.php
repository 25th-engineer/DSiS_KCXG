<?php
session_start();		//����session֧��
include_once("conn/conn.php");		//�������ݿ������ļ�
if(isset($_SESSION['userword']) && isset($_GET["del_id"])){			//�Ե�ǰ�û������жϣ��ǹ���Ա��ִ��ȫ����ɾ��
	$result=mysql_query("delete from tb_leaveword where id='".$_GET["del_id"]."'",$conn);		//ͨ��id���ݵ�ֵ��ɾ�����Ա��е�����
	$res=mysql_query("select * from tb_replyword where leave_id='".$_GET["del_id"]."'",$conn);	//��ѯ�ظ����жԸ�����Ļظ�
	if(mysql_num_rows($res)>0){			//���ظ����еļ�¼������0ʱ����ѯ�ظ����жԸ�����Ļظ�
		$results=mysql_query("delete from tb_replyword where leave_id='".$_GET["del_id"]."'",$conn);	
  		if($result==true and $results==true){       //������ͻظ������ڵ�ʱ��ִ��ȫ����ɾ��
			echo "<script>alert('����ɾ���ɹ���');history.back();</script>";  
  		}else{
			echo "<script>alert('����ɾ��ʧ�ܣ�');history.back();</script>";
		}
	}else{
		if($result){       //ɾ����������
			echo "<script>alert('����ɾ���ɹ���');history.back();</script>";  
  		}else{
			echo "<script>alert('����ɾ��ʧ�ܣ�');history.back();</script>";
		}
	}
}else{
  	echo "<script>alert('��û��ɾ��Ȩ�ޣ�');history.back();</script>";			
}
?>