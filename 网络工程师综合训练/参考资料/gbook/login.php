<?php
$name=$_POST["name"];
if($name!=""){
 $password=$_POST["password"];
 $id=mysql_connect("localhost","root","1234");
 mysql_select_db("gbook",$id);
 mysql_query("SET CHARACTER SET gb2312");
 $query="select * from admin where username='$name'";
 $result=mysql_query($query,$id);
 if(mysql_num_rows($result)<1){
 echo "该用户不存在!请重新登陆!";
 }else{
 $info=mysql_fetch_array($result,MYSQL_ASSOC);
 if($info['userpass']!=$password){
 echo "密码输入错误!请重新登陆!";
 }else{
  session_start();
  $_SESSION["login"]="YES";
  echo "<script language=javascript>alert('登陆成功!');location.href='manage.php';</script>";
  exit;
   }
 }
 mysql_close($id);
}
?>
<HTML>
<HEAD>
<TITLE>欢迎使用简约不简单-我的留言本</TITLE>
</HEAD>
<BODY>
<table border=1 cellspacing=0 cellspadding=0 style="border-collapse:collapse" align=center width=400 bordercolor=black height="358">
<tr><td height=100 bgcolor=#6C6C6C>
<font style="font-size:30px" color=#ffffff face="黑体">简约不简单-我的留言本</font>
</td>
<tr><td height=25>
&nbsp;<a href=send.php>[我要写留言]</a>&nbsp;&nbsp;<a href=login.php>[管理留言]</a>
</td></tr>
<tr><td height=178>
  <form method="POST" action="login.php">
	<table border="1" width="95%" id="table1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" height="154">
		<tr>
			<td colspan="2" height="29">
			<p align="center">欢迎管理员登陆</td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">用户名</td>
			<td width="67%"><input type="text" name="name" size="20"></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">密&nbsp; 码</td>
			<td width="67%"><input type="password" name="password" size="20"></td>
		</tr>
		<tr>
			<td width="99%" colspan="2">
				<p align="center"><input type="submit" value="登陆" name="B1"></p>		
			</td>
		</tr>
	</table>
	</form>
	</td></tr>
<tr><td height=58 bgcolor=#6c6c6c align=center>
<font color=#FFFFFF>版权所有：我的工作室<br>
</td></tr>
</table>
</body>
</html>