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
 echo "���û�������!�����µ�½!";
 }else{
 $info=mysql_fetch_array($result,MYSQL_ASSOC);
 if($info['userpass']!=$password){
 echo "�����������!�����µ�½!";
 }else{
  session_start();
  $_SESSION["login"]="YES";
  echo "<script language=javascript>alert('��½�ɹ�!');location.href='manage.php';</script>";
  exit;
   }
 }
 mysql_close($id);
}
?>
<HTML>
<HEAD>
<TITLE>��ӭʹ�ü�Լ����-�ҵ����Ա�</TITLE>
</HEAD>
<BODY>
<table border=1 cellspacing=0 cellspadding=0 style="border-collapse:collapse" align=center width=400 bordercolor=black height="358">
<tr><td height=100 bgcolor=#6C6C6C>
<font style="font-size:30px" color=#ffffff face="����">��Լ����-�ҵ����Ա�</font>
</td>
<tr><td height=25>
&nbsp;<a href=send.php>[��Ҫд����]</a>&nbsp;&nbsp;<a href=login.php>[��������]</a>
</td></tr>
<tr><td height=178>
  <form method="POST" action="login.php">
	<table border="1" width="95%" id="table1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" height="154">
		<tr>
			<td colspan="2" height="29">
			<p align="center">��ӭ����Ա��½</td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">�û���</td>
			<td width="67%"><input type="text" name="name" size="20"></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">��&nbsp; ��</td>
			<td width="67%"><input type="password" name="password" size="20"></td>
		</tr>
		<tr>
			<td width="99%" colspan="2">
				<p align="center"><input type="submit" value="��½" name="B1"></p>		
			</td>
		</tr>
	</table>
	</form>
	</td></tr>
<tr><td height=58 bgcolor=#6c6c6c align=center>
<font color=#FFFFFF>��Ȩ���У��ҵĹ�����<br>
</td></tr>
</table>
</body>
</html>