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
if(!isset($_GET["page"]) || !is_numeric($_GET["page"])){
	$page=1; 
}else{
	$page=intval($_GET["page"]);
}		
?>
<?php 
$sqls=mysql_query("select * from tb_leaveword where id='".$_GET['l_id']."'",$conn);
$infoes=mysql_fetch_array($sqls);
$sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$infoes["userid"]."'",$conn);
$info1=mysql_fetch_array($sql1);  
?>
<table width="550" height="155" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
  <tr>
  <td bgcolor="#FFFFFF" valign="top">
<table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
  		<td width="350" background="images/dh_back_1.gif">&nbsp;主&nbsp;&nbsp;题：<?php echo unhtml($infoes["title"]);?></td>
<?php 
$adms=mysql_query("select id from tb_adm where userword='".$adm."'",$conn);
$re=mysql_fetch_array($adms);
if($re['id']==$infoes['userid'] && $adm!=""){
?>
  	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $infoes['id'];?> & id=<?php echo urlencode("编辑留言");?>">编辑</a></div></td>
<?php
}elseif($user== $info1['usernc'] and $user!=""){ 
?>
  	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $infoes['id'];?> & id=<?php echo urlencode("编辑留言");?>">编辑</a></div></td>
<?php
}else{
?>
   	<td width="50" background="images/dh_back_1.gif"><div align="center">编辑</div></td>
<?php
}
?>
<?php
if($adm!=""){ 
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="reply.php?t_id=<?php echo $infoes['id'] ?>">回复</a></div></td>  
<?php
}else if($user!= $info1['usernc'] and $user!=""){ 
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="reply.php?t_id=<?php echo $infoes['id'] ?>">回复</a></div></td>
<?php 
}else{
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center">回复</div></td>
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
$sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$infoes["userid"]."'",$conn);
$info1=mysql_fetch_array($sql1); 
if($info1["face"]=="" && $info1["usernc"]==""){
?>
<img src="images/gly.gif" /><br>管理员
<?php 
}else{
?>				
<img src="<?php echo $info1["face"]; ?>" /><br><?php echo $info1["usernc"];?></div></td>
<?php 
}
?>	
<td width="10" background="images/line_down.gif"></td>
<td width="390" rowspan="2"><?php echo unhtml($infoes["content"]);?></td>
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
$sql=mysql_query("select count(*) as total from tb_replyword where leave_id='".$_GET['l_id']."'",$conn);
$infos=mysql_fetch_array($sql);
$total=$infos['total'];
if($total==0){
	echo "<div align=center>对不起，暂无回复！</div>";
}else{
	$pagesize=3;
	if($total%$pagesize==0){
		$pagecount=intval($total/$pagesize);
	}else{
		$pagecount=ceil($total/$pagesize);
	}		   
	$i= $total-($page-1)*$pagesize+1;
	$sql=mysql_query("select * from tb_replyword where leave_id='".$_GET['l_id']."' order by id desc limit ".($page-1)*$pagesize.",$pagesize  ",$conn);
	while($info=mysql_fetch_array($sql)){
		--$i;
		$sqlreply=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);
		$inforeply=mysql_fetch_array($sqlreply); 
?>

      <table width="550" height="155" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top">
		  <table width="550" height="22" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="300" height="22" background="images/dh_back_1.gif">&nbsp;
                回&nbsp;&nbsp;复：<?php echo unhtml($info["titles"]);?>
              <div align="left"></div></td>
<?php
$admes=mysql_query("select id from tb_adm where userword='".$adm."'",$conn);
$res=mysql_fetch_array($admes);
if($res['id']==$info['userid'] && $adm!=""){
?>			  
	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("回复编辑留言");?>">编辑</a></div></td>
<?php
}else if($user== $inforeply['usernc'] and $user!=""){ 
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("回复编辑留言");?>">编辑</a></div></td>
<?php
}else{ 
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center">编辑</div></td>
<?php
}
?>
<?php
if($adm!=""){ 
?>
<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="reply.php?t_id=<?php echo $_GET['l_id']; ?>&loor=<?php echo $i;?>">回复</a></div></td>		
<?php
}else if($user!= $inforeply['usernc'] and $user!=""){ 
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center"><a href="reply.php?t_id=<?php echo $_GET['l_id']; ?>&loor=<?php echo $i;?>">回复</a></div></td>
<?php 
}else{
?>
	<td width="50" background="images/dh_back_1.gif"><div align="center">回复</div></td>
<?php 
}
?>
<td width="50" background="images/dh_back_1.gif"><div align="center">	  
<?php
if($adm!=""){ 
?>
<a href="javascript:if(window.confirm('确定删除该留言信息么？')==true){window.location.href='deletereplyword.php?t_id=<?php echo $info['id']; ?>';}">删除</a>
<?php 
}elseif($user==$inforeply['usernc'] and $user!="" ){

?>	  
<a href="javascript:if(window.confirm('确定删除该留言信息么？')==true){window.location.href='deletereplyword.php?t_id=<?php echo $info['id']; ?>';}">删除</a>
<?php 
}else{
?>
删除
<?php 
}
?>
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
$sqlr=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);
$infor=mysql_fetch_array($sqlr); 
if($infor["face"]=="" && $infor["usernc"]==""){
?>
<img src="images/gly.gif" /><br>管理员（<?php echo $i;?>楼）
<?php 
}else{
?>				
<img src="<?php echo $infor["face"]; ?>" /><br><?php echo $infor["usernc"];?>（<?php echo $i;?>楼）
<?php 
}
?>
</div></td>
	<td width="10" background="images/line_down.gif"></td>
	<td width="390" rowspan="2"><?php echo unhtml($info["contents"]);?></td>
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
		   <a href="index.php?page=1&l_id=<?php echo $_GET['l_id'];?> & id=<?php echo urlencode($_GET['id']); ?>" class="a1">首页</a>&nbsp;
		   <a href="index.php?page=<?php 
		 		if($page>1) 
		   			echo $page-1;
		  		else
		   			echo 1;  
		   ?>&l_id=<?php echo $_GET['l_id'];?> & id=<?php echo urlencode($_GET['id']); ?>" class="a1">上一页</a>&nbsp;
		  <a href="index.php?page=<?php 
		 		if($page<$pagecount) 
				   echo $page+1;
		  		else
		   			echo $pagecount;  
		   ?>&l_id=<?php echo $_GET['l_id'];?> & id=<?php echo urlencode($_GET['id']); ?>" class="a1">下一页</a>&nbsp;
		   <a href="index.php?page=<?php echo $pagecount;?>&l_id=<?php echo $_GET['l_id'];?> & id=<?php echo urlencode($_GET['id']); ?>" class="a1">尾页</a></div></td>
         </tr>
</table>
<?php 
 }
?>