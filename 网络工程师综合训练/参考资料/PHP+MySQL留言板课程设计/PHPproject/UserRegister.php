<?php
require_once "conect.php";
require_once 'DBtest.php';
$ma1=new DB();
$link=$ma1->connect();
$id=$_POST['id'];
$password=$_POST['password'];
$confirmPassword=$_POST['confirmPassword'];
if($password!=$confirmPassword){
    echo "<script>alert('输入的密码和确认的密码不相等');location='register.php';</script>";   
}
if($confirmPassword == $password){
$alt="select * from PERSON where username='$id'";
$res = $ma1->print1($link,$alt);
if ((($_FILES["photo"]["type"] == "image/png")|| ($_FILES["photo"]["type"] == "image/jpeg")|| ($_FILES["photo"]["type"] == "image/pjpeg")))
{
	if (file_exists("upload/" . $_FILES["photo"]["name"]))
	{
		echo $_FILES["photo"]["name"] . " already exists. ";
	}
	else
	{
		move_uploaded_file($_FILES["photo"]["tmp_name"],
		   "upload/" .$id.".jpg");
    }
}
if($id!=null&&$password!=null){
    $ma=new DB();
    $link=$ma->connect();
    $sql = "insert into PERSON (username,password) values('$id','$password')"; 

    for ($i=0; $i < count($res); $i++) {
        if($id!=$res[$i]['username']){
            $res = $ma->insert($link,$sql);
        };
        if($id==$res[$i]['username']){
            echo "<script>alert('注册失败，该账号已被注册！');location='register.php';</script>";
        }
       
    }
}
else{
    echo "<script>alert('注册失败，请输入账号和密码');location='register.php';</script>";
}
}
?>
 