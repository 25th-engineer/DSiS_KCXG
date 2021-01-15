<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言板信息</title>
 <style type="text/css">
	#cap{color: #a26fab;font-size: 20px;}
	#tb{width:300px;border:1px solid #607d8b;box-shadow:10px 10px 5px rgba(244, 67, 54, 0.19);cellspaceing="10";}
	
	.class{color: red;}
	
 </style>
</head>
<body>
<center>
<table id="tb" >
<caption id="cap">留言内容</caption>
<!-- <tr><th>用户</th><th>标题</th><th>内容</th></tr> -->
<?PHP
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "messageboard";
	

	//创建连接
	$conn = new mysqli($servername,$username,$password,$dbname);

	//检测连接
	if($conn->connect_error)
		{
			die("Connection failed:" .$conn->connect_error);
		}
	
	
	
	$result = $conn->query("select * from mymessage");//执行查询
	
	while($row = mysqli_fetch_assoc($result))//将result结果集中查询结果取出一条
	{?>
 	 <!-- echo"<tr><td>".$row["name"]."</td><td>".$row["title"]."</td><td>".$row["content"]."</td><tr>"; -->
 	<tr bgcolor="white">
 	<td>
 	用户：<font color="#ff9800"><?=$row['name']?></font>
 	标题：<font color="#ff9800"><?=$row['title'] ?></font>
	</td>
 	</tr>
 	<tr bgcolor="white">
 	 	<td>
 	 	内容：<font color="#ff9800"><?=$row['content']?></font><br><br>
 	 	<div align="right"><a href="testlocal.html"><font color="#8bc34a">增加</font></a> | <a href="del.php?id=<?=$row['content'];?>"><font color="#00bcd4">删除</font></a></div>
 	 	</td>
	</tr>

	<?php } ?>
	

</table>

</center>

</body>
</html>