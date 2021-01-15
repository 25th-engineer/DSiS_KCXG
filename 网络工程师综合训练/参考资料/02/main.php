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
			 $sql=mysql_query("select count(*) as total from tb_leaveword ",$conn);
			 $info=mysql_fetch_array($sql);
			 $total=$info['total'];
			 if($total==0){
			  echo "<div align=center>对不起，暂无留言！</div>";
			 }else{
			   if(!isset($_GET["page"]) || !is_numeric($_GET["page"])){
			      $page=1; 
			   }else{
			      $page=intval($_GET["page"]);
			   }
			   
			   $pagesize=3;
			   if($total%$pagesize==0){
			      $pagecount=intval($total/$pagesize);
			   }else{
			      $pagecount=ceil($total/$pagesize);
			   }
			   $sql=mysql_query("select * from tb_leaveword order by createtime desc limit ".($page-1)*$pagesize.",$pagesize  ",$conn);
			   while($info=mysql_fetch_array($sql)){
			  
	     ?>
	<table width="520" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="550" height="155" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="450" background="images/dh_back_1.gif">&nbsp;主&nbsp;&nbsp;题：<?php echo unhtml($info["title"]);?></td>
              <td width="100" background="images/dh_back_1.gif"><div align="center">
			  <script language="javascript">
			    function openeditwindow(x){
				
				   window.open("editleaveword.php?id="+x,"newframe","top=100,left=200,width=450,height=280,menubar=no,location=no,scrollbars=no,status=no");
				  
				}
			  
			  </script>
			  <?php 
			   $sqlu=mysql_query("select usernc from tb_user where id='".$info["userid"]."'",$conn);
			   $infou=mysql_fetch_array($sqlu);
			   if($user!=$infou["usernc"] && $user!=""){
			 ?>
			 <a href="reply.php" class="a1">回复</a>
			 <?php
			  }else if($adm!=""){
			 ?> 
			 	<a href="reply.php" class="a1">回复</a>
			
			<?php }else{?>
				回复
			
			<?php 
			}
			?>
			  </div></td>
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
					$sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);
				 $info1=mysql_fetch_array($sql1); 
				if($info1["face"]=="" && $info1["usernc"]==""){
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
                <td width="390" rowspan="2"><?php echo unhtml($info["content"]);?></td>
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
           
           <td width="199"><div align="right"><a href="<?php echo $_SERVER["PHP_SELF"]?>?page=1" class="a1">首页</a>&nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 if($page>1){ 
		  
		   echo $page-1;
		  }else{
		   echo 1; 
		   } 
		   ?>" class="a1">上一页</a>&nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 if($page<$pagecount){
		  
		   echo $page+1;
		  }else{
		   echo $pagecount;
		   }  
		   ?>" class="a1">下一页</a> &nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php echo $pagecount;?>" class="a1">尾页</a></div></td>
         </tr>
       </table>
	<?php
	  }
	?>   
	   