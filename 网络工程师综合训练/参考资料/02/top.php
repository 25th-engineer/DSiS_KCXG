<?php
session_start();		//����session֧��
include("conn/conn.php");		//�������ݿ��ļ�
include_once("function.php");		//����ϵͳ�����ļ�
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ա�</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body topmargin="0" leftmargin="0" bottommargin="0">
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="778">
    <!-- fwtable fwsrc="δ����" fwbase="banner.jpg" fwstyle="Dreamweaver" fwdocid = "408060525" fwnested="0" -->
    <tr>
      <td><img src="images/spacer.gif" width="778" height="1" border="0" alt="" /></td>
      <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
    </tr>
    
    <tr>
      <td width="778" height="107" valign="top" background="images/banner_r1_c1.jpg"><table width="761" border="0" cellpadding="0" cellspacing="0">
         <tr>
           <td width="203" height="29">&nbsp;</td>
           <td height="55">&nbsp;
             <marquee scrollamount="2" scrolldelay="80">
		<?php
		 if(isset($_SESSION["unc"]) && $_SESSION["unc"]!=""){
		    echo "��ӭ����¼��".$_SESSION["unc"];
		 }
		?>
	<?php
		 if(isset($_SESSION["userword"]) && $_SESSION["userword"]!=""){
		    echo "����Ա���ߣ�".$_SESSION["userword"];
		 }
		?>

          </marquee>	</tr>
     
       </table>
      <div align="center"></div></td>
      <td><img src="images/spacer.gif" width="1" height="107" border="0" alt="" /></td>
    </tr>
    <tr>
      <td><a href="index.php"><img src="images/banner_r2_c1.jpg" alt="" name="banner_r2_c1" width="778" height="36" border="0" usemap="#banner_r2_c1Map" id="banner_r2_c1" /></a>
        <map name="banner_r2_c1Map" id="banner_r2_c1Map">
          <area shape="rect" coords="303,4,337,26" href="index.php?id=<?php echo urlencode("��ҳ");?>"/>
          <area shape="rect" coords="346,3,403,26" href="index.php?id=<?php echo urlencode("�û�ע��");?>"/>
          <area shape="rect" coords="413,5,468,27" href="index.php?id=<?php echo urlencode("��������");?>" />
          <area shape="rect" coords="478,4,535,26" href="index.php?id=<?php echo urlencode("�鿴����");?>"/>
          <area shape="rect" coords="548,8,602,28" href="index.php?id=<?php echo urlencode("��ѯ����");?>"/>
          <area shape="rect" coords="610,3,668,28" href="
		  <?php 
		  if(isset($_SESSION['userword'])){
		  	echo "admin_browse.php";
		  }else{
		  ?>
		   index.php?id=<?php echo urlencode("��������");?>
		  <?php
		  }
		  ?>
	 "/>
          <area shape="rect" coords="678,6,730,28" href="index.php?id=<?php echo urlencode("ע����¼");?>"/>
      </map></td>
      <td><img src="images/spacer.gif" width="1" height="36" border="0" alt="" /></td>
    </tr>
  </table>
</div>
