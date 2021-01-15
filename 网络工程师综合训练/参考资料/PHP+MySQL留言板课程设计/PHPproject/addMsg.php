<?php
    header('Content-type: text/html; charset=UTF8');
	session_start();
	if(empty($_SESSION['uid'])){ 
		echo "<script>alert('请登录或注册！');location='login.php'</script>";
	}
?>
<html>  
   <head>
   <link rel="stylesheet" type="text/css" href="./css/index.css">
   <title>我的讯息-与您分享</title>  
   </head>  
   <body background="./images/p3.jpg" style="background-size:cover;" >
   <font color="red">天气预报：</font>
   <span>
   <iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" color="red" src="http://i.tianqi.com/index.php?c=code&id=7&icon=12&num=5&site=12"></iframe>
   </span>
    <center>
        <?php
			$name = $_SESSION["uid"];
			echo $name."的讯息";
			echo "<img align='right' src='./upload/$name.jpg' alt='头像'/>";
        ?> 
		<br/>
		<input type = "button" value = "发布讯息" onclick="location.href='addMsg.php'" class="button"/>
	    <input type = "button" value = "查看讯息" onclick="location.href='showMsg.php'" class="button"/>
		<input type = "button" value = "退出登录" onclick="location.href='login.php'" class="button"/>
		<hr width = "50%"> 
	</center>
	<div class="k1">
		<form action = "doAddMsg.php" method = "post">  
			<h1>我的讯息
				<span>有什么新鲜事要和您分享</span>
			</h1>
			<label>
				<span>昵称 :</span>
				<input type="text" name="author" placeholder="写下你的小名吧" />
			</label>
			<label>
				<span>主题 :</span>
				<input type="text" name="title" placeholder="今天立个flag,哈哈哈" />
			</label>
			<label>
				<span>新鲜事 :</span>
				<textarea name="content" placeholder="讲讲那些年,那些事"></textarea>
			</label>
			<div style="margin-left:125px">
				<input type="submit" value="发布" class="submit">
				<input type = "reset" value = "重置" class="reset">
			</div>
			</form>
		</div>	
	</body>  
</html>  
