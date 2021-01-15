<table>
  <tr>
    <td></td>
  </tr>
  </table>
<?php 
if(isset($_SESSION['unc'])){	
	$user=$_SESSION['unc'];		 
}else{
	$user="";
}
if(isset($_SESSION['userword'])){
	$adm=$_SESSION['userword'];
}else{
	$adm="";
}
?>
<?php
			 $sql=mysql_query("select count(*) as total from tb_leaveword ",$conn);
			 $infos=mysql_fetch_array($sql);
			 $total=$infos['total'];		//获取总留言条数
			 if($total==0){					//如果总留言条数为0，则给出提示
			  echo "<div align=center>对不起，暂无留言！</div>";
			 }else{
			   if(!isset($_GET["page"]) || !is_numeric($_GET["page"])){
			      $page=1; 					//判断查询字符串page的值是否为空，如果为空则默认显示第1页
			   }else{
			      $page=intval($_GET["page"]);
			   }
			   
			   $pagesize=3;                //规定每页显示3条留言
			   if($total%$pagesize==0){    //获取总页数
			      $pagecount=intval($total/$pagesize);       //如果获取的总页数是整数，则返回整数值
			   }else{
			      $pagecount=ceil($total/$pagesize);		//获取的总页数不是整数时，进行向上取整
			   }
			   $sql=mysql_query("select * from tb_leaveword order by createtime desc limit ".($page-1)*$pagesize.",$pagesize  ",$conn);
			   while($info=mysql_fetch_array($sql)){			//通过while循环显示所有留言
			 
				 $sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);		//通过传递的id值查询当前留言者的个人信息
				 $info1=mysql_fetch_array($sql1); 
	     ?>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top">
		  <table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="354" background="images/dh_back_1.gif">&nbsp;主&nbsp;&nbsp;题：<?php echo unhtml($info["title"]);?></td>		  
<?php 
$adms=mysql_query("select id from tb_adm where userword='".$adm."'",$conn);			//从管理员数据表中查询登录的版主id
$re=mysql_fetch_array($adms);
if($re['id']==$info['userid'] && $adm!=""){		//判断当前登录的管理员是不是该条留言的发表者，如果是则显示编辑按钮
?>
  <td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("编辑留言");?>">编辑</a></div></td>
<?php
	}elseif($user== $info1['usernc'] and $user!=""){       //如果当前用户是该留言的发表者，则显示编辑按钮
?>
  <td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("编辑留言");?>">编辑</a></div></td>
<?php
	}else{
?>
   <td width="50" background="images/dh_back_1.gif"><div align="center">编辑</div></td>    
<?php
}
?>
			 <?php
			if($adm!=""){ 			//管理员登录后，可以对帖子进行回复
			?>
			<td width="98" background="images/dh_back_1.gif"><a href="reply.php?t_id=<?php echo $info['id'] ?>">回复此贴</a></td>
			<?php
			}else if($user!= $info1['usernc'] and $user!=""){      //当前用户不是该帖子的发表者时，可以对帖子进行回复
			?>
			 <td width="98" background="images/dh_back_1.gif"><a href="reply.php?t_id=<?php echo $info['id'] ?>">回复此贴</a></td>
			<?php 
			}else{
			?>
		<td width="98" background="images/dh_back_1.gif">回复此贴</td>
			  <?php 
			  }
			  ?>	 
			</tr>
          </table>
          <table width="550" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td></td>
              </tr>
          </table>
			
		  <table width="550" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
			
                <td width="150" height="90"><div align="center">
				<?php 
				if($info1["face"]=="" && $info1["usernc"]==""){			//当登录者的头像和用户名为空时，显示管理员头像即登录者为管理员
				?>
				<img src="images/gly.gif" /><br>管理员
				<?php 
				}else{
				
				?>
				<img src="<?php echo $info1["face"]; ?>" /><br><?php echo $info1["usernc"];?>
				<?php 
				}
				?>
				</div></td>
                <td width="10" background="images/line_down.gif"></td>
                <td width="390" rowspan="2" valign="bottom"><?php echo unhtml($info["content"]);?>
                <p align="right"><a href="index.php?l_id=<?php echo $info['id']; ?>&id=<?php echo urlencode('详细信息'); ?>">查看回复</a></p>
                </td>
             </tr>
             <tr>
                <td height="30"><div align="center"><img src="images/email.gif" width="45" height="16" alt="<?php echo $info1['email'];?>"/><img src="images/ip.gif" width="55" height="16"  alt="<?php echo $info1['ip'];?>"/><img src="images/qq.gif" width="45" height="16"  alt="<?php echo $info1['qq'];?>"/></div></td>
                <td width="10" background="images/line_down.gif"></td>
            </tr>
            </table>
			
		  </td>
        </tr>
      </table>
	  <?php 
	  }
	  ?>
	   <table width="550" height="25" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <td width="351"><div align="left">共有留言&nbsp;<?php echo $total;?>&nbsp;条&nbsp;每页显示&nbsp;<?php echo $pagesize;?>&nbsp;条&nbsp;第&nbsp;<?php echo $page;?>&nbsp;页/共&nbsp;<?php echo $pagecount;?>&nbsp;页</div></td>
           
           <td width="199"><div align="right">
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=1&id=<?php echo urlencode($id);?>" class="a1">首页</a>&nbsp;
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 		if($page>1) 				//判断当前页是否大于第一页，如果是则当用户单击“上一页”超级链接时，使变量$page的值减1，从而实现向前翻页的功能
		   			echo $page-1;
		  		else
		   			echo 1;  
		   ?>&id=<?php echo urlencode($id);?>" class="a1">上一页</a>&nbsp;
		  <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 		if($page<$pagecount) 		//判断当前页码是否小于总的页数，如果是则当用户单击“下一页”超级链接时，使变量$page的值加1，从而实现向前翻页的功能
				   echo $page+1;
		  		else
		   			echo $pagecount;  
		   ?>&id=<?php echo urlencode($id);?>" class="a1">下一页</a>&nbsp;
		   <a href="<?php  echo $_SERVER["PHP_SELF"]?>?page=<?php echo $pagecount;?>&id=<?php echo urlencode($id);?>" class="a1">尾页</a></div></td>
         </tr>
</table>
<?php
 }
?>