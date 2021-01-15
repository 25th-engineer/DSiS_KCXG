<?php
session_start();		//启用session支持
include_once("conn/conn.php");		//包含数据库链接文件
if(isset($_SESSION['userword']) && isset($_GET["del_id"])){			//对当前用户进行判断，是管理员则执行全主题删除
	$result=mysql_query("delete from tb_leaveword where id='".$_GET["del_id"]."'",$conn);		//通过id传递的值，删除留言表中的留言
	$res=mysql_query("select * from tb_replyword where leave_id='".$_GET["del_id"]."'",$conn);	//查询回复表中对该主题的回复
	if(mysql_num_rows($res)>0){			//当回复表中的记录数大于0时，查询回复表中对该主题的回复
		$results=mysql_query("delete from tb_replyword where leave_id='".$_GET["del_id"]."'",$conn);	
  		if($result==true and $results==true){       //当主题和回复都存在的时，执行全主题删除
			echo "<script>alert('留言删除成功！');history.back();</script>";  
  		}else{
			echo "<script>alert('留言删除失败！');history.back();</script>";
		}
	}else{
		if($result){       //删除发布留言
			echo "<script>alert('留言删除成功！');history.back();</script>";  
  		}else{
			echo "<script>alert('留言删除失败！');history.back();</script>";
		}
	}
}else{
  	echo "<script>alert('您没有删除权限！');history.back();</script>";			
}
?>