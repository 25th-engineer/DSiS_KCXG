////ע�� ���ڶԱ����ύ�����ݽ��д��������ݱ��浽ָ�������ݱ���//////

<?php
session_start();		//����session֧��
include_once("function.php");		//����ϵͳ�����ļ�
if(isset($_SESSION['userword'])){		//��ȡ��¼�İ�������
	echo "<script>alert('��ͬһ̨�����ϣ�������ͬʱʹ���û����͹���Ա���е�¼��'); window.location.href='index.php';</script>";		//�����û����������ͬʱ��¼����Ϣ		
	}else{
 include_once("conn/conn.php");		//�������ݿ��ļ�
 $usernc=$_POST["usernc"];			//����ע��ʱ�ύ���û�����
 $sql=mysql_query("select usernc from tb_user where usernc='".$usernc."'",$conn);		//��ѯ�û�������ע���û��������Ƿ��뵱ǰ�ύ���û�����ͬ
 $info=mysql_fetch_array($sql);		//�����ѯ������
 		if($info){
   echo "<script>alert('�Բ�������ǳ��Ѿ���ռ�ã�');history.back();</script>";		//��ͬ�ĸ�����ʾ
   exit;
 				 }
 $ip=$_SERVER["REMOTE_ADDR"];
 if(mysql_query("insert into tb_user(usernc,userpwd,truename,email,qq,tel,ip,address,face,regtime,sex,usertype) values('".$usernc."','".md5(trim($_POST["userpwd"]))."','".$_POST["truename"]."','".$_POST["email"]."','".$_POST["qq"]."','".$_POST["tel"]."','".$ip."','".$_POST["address"]."','".$_POST["face"]."','".date("Y-m-d H:i:s")."','".$_POST["sex"]."','0')",$conn))
 {
   $_SESSION["unc"]=$usernc;  
   echo "<script>alert('ע��ɹ���');window.location.href='index.php'</script>";
 }else{
   echo "<script>alert('ע��ʧ�ܣ�');history.back();</script>";
	  }
}
?>