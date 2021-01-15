    <?php
    header("content-type:text/html;charset=utf-8");
    session_start();
	if(empty($_SESSION['uid'])){ 
		echo "<script>alert('请登录或注册！');location='login.php'</script>";
	}
    require_once "conect.php";
    require_once 'DBtest.php';
    $ma1=new DB();
    $link=$ma1->connect();
    $id = $_GET['id'];
    $time = $_GET['time'];
    $name = $_SESSION["uid"];
    if ($id == $name){
     if($link){
       $sql="delete from MSG where user ='$id' and time = '$time'";
       $que=mysqli_query($link,$sql);
       if($que){
				echo "<script>alert('删除成功，返回首页');location='showMsg.php';</script>";
       }else{
				echo "<script>alert('删除失败，无法删除');location='showMsg.php'</script>";
				exit;
			}
      }
    }
	else
	{
        echo "<script>alert('删除失败，不能删除别人的讯息');location='showMsg.php'</script>";
    }
    ?>

