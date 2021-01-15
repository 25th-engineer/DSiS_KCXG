<?php
	
	$uname=$_POST['name'];
	$utitle=$_POST['title'];
	$ucontent=$_POST['content'];
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "messageboard";
	

	//创建连接
	$conn = new mysqli($servername,$username,$password,$dbname);
	/*mysqli_query("set names 'uft8'"); 
	mysqli_query("set character_set_client=utf8"); 
	mysqli_query("set character_set_results=utf8"); */

	//检测连接
	if($conn->connect_error)
		{
			die("Connection failed:" .$conn->connect_error);
		}

	
	
	$sql = "INSERT INTO mymessage(name,title,content) VALUES('$uname','$utitle','$ucontent')";

	

	if ($conn->query($sql) === TRUE) 
	{
	 echo "New record created successfully";
	} 
	else 
	{
	    echo "Error: " . $sql . "<br>" . $conn->error;
	}


	$conn->close();	

	header('location: http://localhost:8080/mess.php');


?>