<table>
  <tr>
    <td></td>
  </tr>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
	
	 <script language="javascript">
	   function chkinput_search(form){
	     if(form.type.value==""){
		   alert('��ѡ���ѯ������');
		   form.type.focus();
		   return(false);
		 }
		  if(form.keyword.value==""){
		   alert('�������ѯ�ؼ��֣�');
		   form.keyword.focus();
		   return(false);
		 }
		 return(true);
	   
	   } 
	 </script>
       <form name="form1" method="post" action="index.php?id=<?php echo urlencode("��ѯ����");?> " onsubmit="return chkinput_search(this)">
	    <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;��������</td>
            </tr>
          </table>
            <table width="550" height="50" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="center">��ѡ����ҷ�ʽ��
                  <select name="type">
				    <option value="">��ѡ��</option>
                    <option value="1">����</option>
                    <option value="2">����</option>
                    <option value="3">������</option>
                  </select>&nbsp;<input type="text" name="keyword" size="25" class="inputcss">&nbsp;<input type="submit" value="��ѯ" class="buttoncss" name="submit">
                </div></td>
              </tr>
            </table>
		
		  </td>
        </tr>
		</form>
      </table>
	  
	  
	  <?php
	    
	   if(isset($_POST["submit"])){
	     $type=$_POST["type"];
	     $keyword=$_POST["keyword"];
		 if($type==1){
		  $sql=mysql_query("select * from tb_leaveword where title like '%".$keyword."%'",$conn);
		 }elseif($type==2){
		  $sql=mysql_query("select * from tb_leaveword where content like '%".$keyword."%'",$conn);
		 }elseif($type==3){
		  $sql0=mysql_query("select id from tb_user where usernc='".$keyword."'",$conn);
		  $info0=mysql_fetch_array($sql0);
		  $sql=mysql_query("select * from tb_leaveword where userid='".$info0["id"]."'",$conn);
		 }
		 
		 $info=mysql_fetch_array($sql);
		 if($info==false){
		  echo "<br><br><div align=center>�Բ���û�в��ҵ���Ҫ���ҵ����ݣ�</div>";
		 }else{
		   do{
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
              <td background="images/dh_back_1.gif">&nbsp;��&nbsp;&nbsp;�⣺<?php echo unhtml($info["title"]);?></td>
            </tr>
          </table>
            <table width="550" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td></td>
              </tr>
            </table>
			
			<table width="550" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="150" height="90"><div align="center"> <?php 
$sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);
$info1=mysql_fetch_array($sql1); 
if($info1["face"]=="" && $info1["usernc"]==""){
?>
<img src="images/gly.gif" /><br>����Ա
<?php 
}else{
?>				
<img src="<?php echo $info1["face"]; ?>" /><br><?php echo $info1["usernc"];?></div></td>
<?php 
}
?>	</td>
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
	     }while($info=mysql_fetch_array($sql));
		 } 
	   }
	  
	  ?>
	  
	  
      </td>
    <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
</td>
  </tr>
</table>