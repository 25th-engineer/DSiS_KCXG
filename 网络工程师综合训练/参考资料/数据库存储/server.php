<?php
	//解码
	$tmp = base64_decode($_POST['imgOne']);

	//写文件
	file_put_contents("D://img.jpg", $tmp);
	echo '{"msg":"上传成功!"}';

	// $img=file_put_contents("D://img.jpg", $tmp);
	// $servername = "localhost";
	// $username = "root";
	// $password = "root";
	// $dbname = "mypic";
	

	// //创建连接
	// $conn = new mysqli($servername,$username,$password,$dbname);
	

	// //检测连接
	// if($conn->connect_error)
	// 	{
	// 		die("Connection failed:" .$conn->connect_error);
	// 	}

	
	
	// $sql = "INSERT INTO mypic(pic) VALUES('$img')";
	
	// if ($conn->query($sql) === TRUE) 
	// {
	//  echo '{"msg":"上传成功!"}';
	// } 
	
	// $conn->close();	
?>