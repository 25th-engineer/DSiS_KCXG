<?php
	
	$id=$_GET['id'];

	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "messageboard";
	

	//创建连接
	$conn = new mysqli($servername,$username,$password,$dbname);

	if($conn->connect_error)
		{
			die("Connection failed:" .$conn->connect_error);
		}

	mysqli_query($conn,"DELETE FROM mymessage WHERE content='$id'");

	mysqli_close($conn);

	header('location: http://localhost:8080/mess.php');


?>