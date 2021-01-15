<?php
include_once("top.php");
include_once("function.php");
if(isset($_GET['page'])){
	$page=$_GET['page'];
}else{
	$page=1;
}
?>

<style type="text/css">
<!--
.STYLE2 {font-size: 18px}
a:link {
	color: #3333FF;
}
.STYLE4 {font-size: 14px; }
-->
</style>		   
<table width="779" height="23" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="292" background="images/dh_back.gif"><div align="right">今天是：&nbsp;<script language=JavaScript>
   today=new Date();
   function initArray(){
   this.length=initArray.arguments.length
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i]  }
   
   var d=new initArray(
     "星期日",
     "星期一",
     "星期二",
     "星期三",
     "星期四",
     "星期五",
     "星期六");
document.write(
     "<font color=#000000 style='font-size:9pt;font-family: 宋体'> ",
     today.getYear(),"年",
     today.getMonth()+1,"月",
     today.getDate(),"日",
	  "&nbsp;&nbsp;",
     d[today.getDay()+1],
	"</font>" ); 
</script></div></td>
    <td width="487" background="images/dh_back.gif"><div align="center">您当前的位置：绿意留言本&nbsp;>>&nbsp;<a href="admin_browse.php" class="a1">版主管理</a></div></td>
  </tr>
</table>
<table width="779" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="5" height="315" bgcolor="#FAF3CE"></td>
    <td width="200" valign="top"><?php include_once("left.php");?></td>
    <td width="6" bgcolor="#FAF3CE"><div align="center"><span style="color: #00CC66"></span></div></td>
    <td  valign="top"><div align="center">
      <table width="520" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td style="color: #00CC66"></td>
          </tr>
      </table>
    </div>
      
       
	   <table width="550" height="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;版主浏览</td>
            </tr>
          </table>
		  
	        <p>
			<form action="" method="post" name="form1" style="font-size: 24px; color: #00CC66">
        <div align="center">
          <p class="STYLE2">版主浏览        </p>

          <table width="525" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FCD424">
            <tr>
              <td width="131" bgcolor="#FFFFFF"><div align="center" class="STYLE4" style="color: #00CC66">主题</div></td>
              <td width="76" bgcolor="#FFFFFF"><div align="center" class="STYLE4" style="color: #00CC66">用户</div></td>
              <td width="121" bgcolor="#FFFFFF"><div align="center" class="STYLE4" style="color: #00CC66">发帖时间</div></td>
              <td width="81" bgcolor="#FFFFFF"><div align="center" class="STYLE4" style="color: #00CC66">回复次数</div></td>
              <td width="104" bgcolor="#FFFFFF"><div align="center" class="STYLE4" style="color: #00CC66">全主题删除</div></td>
            </tr>
<?php
	include("conn/conn.php");                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

	$pagesize = 5 ;											//每页显示记录数
	$sqlstr = "select * from tb_leaveword";
	$total = mysql_query($sqlstr,$conn);
	$totalNum = mysql_num_rows($total);						//总记录数
	$pagecount = ceil($totalNum/$pagesize);				//总页数
	$offset=($page-1)*$pagesize;
	$sqlpase="select * from tb_leaveword where id order by id desc limit $offset,$pagesize";
	$result=mysql_query($sqlpase,$conn);
	while ($rows = mysql_fetch_array($result)){					//循环输出查询结果
?>	
          <tr>
              <td bgcolor="#FFFFFF"><div align="center"><a href="index.php?l_id=<?php echo $rows['id']; ?>&id=<?php echo urlencode('详细信息'); ?>"><?php echo $rows['title'];?></a></div></td>
              <td bgcolor="#FFFFFF">
			  
			    <div align="center">
			      <?php 
			 $sql="select *  from tb_user where id='".$rows['userid']."'";
			 $res=mysql_query($sql,$conn);
			 $rew=mysql_fetch_array($res);
			 echo unhtml($rew['usernc']);
			 ?>			  
			      </div></td>
              <td bgcolor="#FFFFFF"><div align="center"><?php echo $rows['createtime'];?></div></td>

              <td bgcolor="#FFFFFF">
			    <div align="center">
			      <?php 
			  $sqls="select *  from tb_replyword where leave_id='".$rows['id']."'";
			 $rs=mysql_query($sqls,$conn);
			 $rw=mysql_num_rows($rs);
			  echo $rw;
			  ?>			  
			      </div></td>
              <td bgcolor="#FFFFFF"><div align="center"><a href="javascript:if(window.confirm('确定删除该留言信息么？')==true){window.location.href='deleteleaveword.php?del_id=<?php echo $rows['id']; ?>';}">删除</a></div></td>
			
            </tr>
			<?php 
			}                                              
			
			?>
          </table>
          <p align="right" style="font-size: 14px; color: #000000"><a href="gllogout.php">退出</a></p>
        </div>
      </form>
			&nbsp;</p></td>
        </tr>
      </table>
	   </p>
	   <table width="550" height="25" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <td width="351"><div align="left">共有留言&nbsp;<?php echo $totalNum;?>&nbsp;条&nbsp;每页显示&nbsp;<?php echo $pagesize;?>&nbsp;条&nbsp;第&nbsp;<?php echo $page;?>&nbsp;页/共&nbsp;<?php echo $pagecount;?>&nbsp;页</div></td>
           
           <td width="199"><div align="right"><a href="<?php echo $_SERVER["PHP_SELF"]?>?page=1" class="a1">首页</a>&nbsp;
		   
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 if($page>1) 
		  
		   echo $page-1;
		  else
		   echo 1;  
		   ?>" class="a1">上一页</a>
		   
		   &nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 if($page<$pagecount) 
		  
		   echo $page+1;
		  else
		   echo $pagecount;  
		   ?>" class="a1">下一页&nbsp;</a>
		   
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php echo $pagecount;?>" class="a1">尾页</a></div></td>
         </tr>
       </table>
    </td>
    <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
      </td>
<td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
<?php




include_once("bottom.php");
?>
