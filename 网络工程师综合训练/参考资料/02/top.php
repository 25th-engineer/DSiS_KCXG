<?php
session_start();		//启用session支持
include("conn/conn.php");		//包含数据库文件
include_once("function.php");		//包含系统功能文件
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>留言本</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body topmargin="0" leftmargin="0" bottommargin="0">
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="778">
    <!-- fwtable fwsrc="未命名" fwbase="banner.jpg" fwstyle="Dreamweaver" fwdocid = "408060525" fwnested="0" -->
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
		    echo "欢迎您登录：".$_SESSION["unc"];
		 }
		?>
	<?php
		 if(isset($_SESSION["userword"]) && $_SESSION["userword"]!=""){
		    echo "管理员在线：".$_SESSION["userword"];
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
          <area shape="rect" coords="303,4,337,26" href="index.php?id=<?php echo urlencode("首页");?>"/>
          <area shape="rect" coords="346,3,403,26" href="index.php?id=<?php echo urlencode("用户注册");?>"/>
          <area shape="rect" coords="413,5,468,27" href="index.php?id=<?php echo urlencode("发表留言");?>" />
          <area shape="rect" coords="478,4,535,26" href="index.php?id=<?php echo urlencode("查看留言");?>"/>
          <area shape="rect" coords="548,8,602,28" href="index.php?id=<?php echo urlencode("查询留言");?>"/>
          <area shape="rect" coords="610,3,668,28" href="
		  <?php 
		  if(isset($_SESSION['userword'])){
		  	echo "admin_browse.php";
		  }else{
		  ?>
		   index.php?id=<?php echo urlencode("版主管理");?>
		  <?php
		  }
		  ?>
	 "/>
          <area shape="rect" coords="678,6,730,28" href="index.php?id=<?php echo urlencode("注销登录");?>"/>
      </map></td>
      <td><img src="images/spacer.gif" width="1" height="36" border="0" alt="" /></td>
    </tr>
  </table>
</div>
