///对回复的留言进行处理，储存页面

<?php
session_start();
include_once("conn/conn.php");
include_once("function.php");		//包含系统功能文件
if(isset($_POST['title'])){
	if (is_file("./filterwords.txt")){					
	    $filter_word = file("./filterwords.txt");		
		$content=$_POST['content'];
		for($i=0;$i<count($filter_word);$i++){			
		   if(preg_match("/".trim($filter_word[$i])."/i",$content)){		
			  echo "<script>alert(回复留言信息中包含敏感词！');history.back(-1);</script>";
		 	  exit;
		   }
	    }
	}
	if(isset($_SESSION["unc"])){
	$sql=mysql_query("select id from tb_user where usernc='".$_SESSION["unc"]."'");
	$info=mysql_fetch_array($sql);
	$userid=$info['id'];
}
if(isset($_SESSION['userword'])){
	$sql=mysql_query("select id from tb_adm where userword='".$_SESSION["userword"]."'");
	$info=mysql_fetch_array($sql);
	$userid=$info['id'];
}

	$createtime=date("Y-m-d H:i:s");		//获取回复留言时间
	if(mysql_query("insert into tb_replyword (userid,createtimes,titles,contents,leave_id)values('$userid','$createtime','".$_POST['title']."','$content','".$_POST['t_id']."')")){
	   echo "<script>alert('留言回复发表成功！');history.back();</script>";
	}else{
	   echo "<script>alert('留言回复发表失败！');history.back();</script>";
	}
}
?>
