<?php
include_once("conn/conn.php");
if(isset($_GET["ed"])){
	$id=$_GET["ed"];
}else{
	$id="";
}
$sql=mysql_query("select * from tb_replyword where id='".$id."'",$conn);
$info=mysql_fetch_array($sql);
if(isset($_POST["submit"])){
  if(mysql_query("update tb_replyword set titles='".$_POST["title"]."',contents='".$_POST["content"]."' where id='".$_POST["id"]."'",$conn)){
  $url= $_POST["leave_id"] ." & id=".urlencode('详细信息');
	  echo "<script>alert('留言更改成功！');window.location.href='index.php?l_id=$url';</script>";    
	   
  }else{
	  echo "<script>alert('留言更改失败！');window.location.href='index.php?l_id=$url';</script>";    
  }
 exit;
}

?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑留言</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body topmargin="0" leftmargin="0" bottommargin="0">
<table>
  <tr>
    <td></td>
  </tr>
</table>
<table width="550" height="200" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FCD424">
 
 <script language="javascript">
  function chkinput(form){
    if(form.title.value==""){
	
	  alert("留言主题不能为空！");
	  form.title.focus();
	  return(false);
	
	}
	
	 if(form.content.value==""){
	
	  alert("留言内容不能为空！");
	  form.content.focus();
	  return(false);
	
	}
   return(true);
  
  }
 
 </script>
 
 <form name="form1" method="post" action="edlitreplyword.php" onSubmit="return chkinput(this)">
 
  <tr>
    <td height="25" colspan="2" background="images/dh_back_1.gif" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<img src="images/biao.gif">&nbsp;编辑留言</td>
  </tr>
  <tr>
    <td width="76" height="25" bgcolor="#FFFFFF"><div align="center">留言主题：</div></td>
    <td width="371" bgcolor="#FFFFFF">&nbsp;<input name="title" type="text" class="inputcss" size="45" value="<?php echo $info['titles'];?>"></td>
  </tr>
  <tr>
    <td height="200" bgcolor="#FFFFFF"><div align="center">留言内容：</div></td>
    <td height="200" bgcolor="#FFFFFF">&nbsp;<textarea name="content" cols="52" rows="12" class="inputcss"><?php echo $info['contents'];?></textarea></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#FFFFFF"><div align="center">
      <input type="hidden" name="leave_id" value="<?php echo $info['leave_id'];?>">
      <input type="hidden" name="id" value="<?php echo $_GET['ed'];?>"><input type="submit" value="编辑" class="buttoncss" name="submit">&nbsp;&nbsp;<input type="reset" value="取消" class="buttoncss"></div></td>
  </tr>
  </form>
  
</table>
</body>
</html>
