<?php
$name=$_POST["name"];
if($name!=""){
 $content=$_POST["content"];
 $addtime=date("Y-m-d h:i:s");
 $id=mysql_connect("localhost","root","1234");
 mysql_select_db("gbook",$id);
 mysql_query("SET CHARACTER SET gb2312");
 $query="insert into message(author,addtime,content,reply) values('$name','$addtime','$content','')";
 mysql_query($query,$id);
 mysql_close($id);
 echo "<script language=javascript>alert('���Գɹ�!���ȷ���鿴����.');location.href='index.php';</script>";
 exit;
}
?>
<HTML>
<HEAD>
<TITLE>��ӭʹ�ü�Լ����-�ҵ����Ա�</TITLE>
</HEAD>
<BODY>
<table border=1 cellspacing=0 cellspadding=0 style="border-collapse:collapse" align=center width=400 bordercolor=black>
<tr><td height=100 bgcolor=#6C6C6C>
<font style="font-size:30px" color=#ffffff face="����">��Լ����-�ҵ�ԭ�����Ա�</font>
</td>
<tr><td height=25>
&nbsp;<a href=send.php>[��Ҫд����]</a>&nbsp;&nbsp;<a href=login.php>[��������]</a>
</td></tr>
<tr><td height=200>
  <form method="POST" action="send.php">
	<table border="1" width="95%" id="table1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" height="265">
		<tr>
			<td colspan="2" height="29">
			<p align="center">��ӭ����д����</td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">��������</td>
			<td width="67%"><input type="text" name="name" size="20"></td>
		</tr>
		<tr>
			<td width="32%">
			<p align="right">��������</td>
			<td width="67%"><textarea rows="10" name="content" cols="31"></textarea></td>
		</tr>
		<tr>
			<td width="99%" colspan="2">
				<p align="center"><input type="submit" value="�ύ" name="B1"></p>		
			</td>
		</tr>
	</table>
	</form>
	</td></tr>
<tr><td height=80 bgcolor=#6c6c6c align=center>
<font color=#FFFFFF>��Ȩ���У��ҵĹ�����<br>
</td></tr>
</table>
</body>
</html>