<?php
session_start();
if($_SESSION["login"]!="YES"){
 echo "�㻹û�е�½,�޷���������!";
 exit;
}
$msgid=$_GET["id"];
$reply=$_POST["reply"];
if($reply!=""){
 $id=mysql_connect("localhost","root","1234");
 mysql_select_db("gbook",$id);
 mysql_query("SET CHARACTER SET gb2312");
 $query="update message set reply='$reply' where id=".$msgid;
 mysql_query($query,$id);
 echo "<script language=javascript>alert('�ظ��ɹ�!');location.href='manage.php';</script>";
 exit;
 mysql_close($id);
}

 $id=mysql_connect("localhost","root","1234");
 mysql_select_db("gbook",$id);
 mysql_query("SET CHARACTER SET gb2312");
 $query="select * from  message where id=$msgid";
 $result=mysql_query($query,$id);
 if(mysql_num_rows($result)<1){
 echo "û�д�����";
 exit;
 }
 $msg=mysql_fetch_array($result,MYSQL_ASSOC);
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
&nbsp;&nbsp;<a href="manage.php">[���ع���]</a>
</td></tr>
<tr><td height=178>
  <form method="POST" action="reply.php?id=<?php echo $msgid;?>">
	<table border="1" width="95%" id="table1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" height="154">
		<tr>
			<td colspan="2" height="29">
			<p align="center">����Ա�ظ�����</td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">����ID</td>
			<td width="67%"><?php echo $msg['id'];?></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">������</td>
			<td width="67%"><?php echo $msg['author'];?></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">����ʱ��</td>
			<td width="67%"><?php echo $msg['addtime'];?></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">��������</td>
			<td width="67%"><?php echo $msg['content'];?></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">������ظ�</td>
			<td width="67%"><textarea rows="7" name="reply" cols="33"></textarea></td>
		</tr>
		<tr>
			<td width="99%" colspan="2">
				<p align="center"><input type="submit" value="ȷ��" name="B1"></p>		
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
<?php mysql_close(); ?>