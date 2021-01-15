<HTML>
<HEAD>
<TITLE>欢迎使用简约不简单-我的留言本</TITLE>
<style type=text/css>
TD{
font-size:12px;
line-height:150%;
}
</style>
</HEAD>
<BODY>
<table border=1 cellspacing=0 cellspadding=0 style="border-collapse:collapse" align=center width=400 bordercolor=black height="382">
<tr><td height=100 bgcolor=#6C6C6C style="font-size:30px;line-height:30px" >
<font color=#ffffff face="黑体">简约不简单-我的留言本</font>
</td><tr>
<tr><td height=25>
&nbsp;<a href=send.php>[我要写留言]</a>&nbsp;&nbsp;<a href=login.php>[管理留言]</a>
</td></tr>
<tr><td height=200>
  <?php
   $id=mysql_connect("localhost","root","1234");
   mysql_select_db("gbook",$id);
   mysql_query("SET CHARACTER SET gb2312");
   $query="select * from message ";
   $result=mysql_query($query,$id);
   if(mysql_num_rows($result)<1){
   echo "&nbsp;目前数据表中还没有任何留言！";
   }else{ //ELSE开始
     $totalnum=mysql_num_rows($result);
     $pagesize=10;
     $page=$_GET["page"];
     if($page==""){
       $page=1;
     }
     $begin=($page-1) * $pagesize;
     $totalpage=ceil($totalnum/$pagesize);

     echo "<table border=0 width=95%><tr><td>";
     $datanum=mysql_num_rows($result);
     echo "共有留言".$totalnum."条。";
     echo "每页".$pagesize."条，共".$totalpage."页<br>";
     
     for($j=1;$j<=$totalpage;$j++){
      echo "<a href=index.php?page=".$j.">[".$j."]&nbsp;</a>";
     }
     echo "<br>";
     
     $query="SELECT * FROM message  order by addtime desc limit $begin,$pagesize";
     $result=mysql_query($query,$id);  
     for($i=1;$i<=$datanum;$i++){
      $info=mysql_fetch_array($result,MYSQL_ASSOC);
      echo "->[".$info['author']."]于".$info['addtime']."说：<br>";
      echo "&nbsp;&nbsp;".$info['content']."<br>";
       if($info['reply']!=""){
       echo "<b>管理员回复：</b>".$info['reply']."<br>";
       }
      echo "<hr>";
      }
     echo "</table>";
   } //ELSE结束
   mysql_close($id);
  ?>
</td></tr>
<tr><td height=60 bgcolor=#6c6c6c align=center>
<font color=#FFFFFF>版权所有：我的工作室<br>
</td></tr>
</table>
</body>
</html>