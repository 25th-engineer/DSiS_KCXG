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
			 $total=$infos['total'];		//��ȡ����������
			 if($total==0){					//�������������Ϊ0���������ʾ
			  echo "<div align=center>�Բ����������ԣ�</div>";
			 }else{
			   if(!isset($_GET["page"]) || !is_numeric($_GET["page"])){
			      $page=1; 					//�жϲ�ѯ�ַ���page��ֵ�Ƿ�Ϊ�գ����Ϊ����Ĭ����ʾ��1ҳ
			   }else{
			      $page=intval($_GET["page"]);
			   }
			   
			   $pagesize=3;                //�涨ÿҳ��ʾ3������
			   if($total%$pagesize==0){    //��ȡ��ҳ��
			      $pagecount=intval($total/$pagesize);       //�����ȡ����ҳ�����������򷵻�����ֵ
			   }else{
			      $pagecount=ceil($total/$pagesize);		//��ȡ����ҳ����������ʱ����������ȡ��
			   }
			   $sql=mysql_query("select * from tb_leaveword order by createtime desc limit ".($page-1)*$pagesize.",$pagesize  ",$conn);
			   while($info=mysql_fetch_array($sql)){			//ͨ��whileѭ����ʾ��������
			 
				 $sql1=mysql_query("select usernc,face,ip,email,qq from tb_user where id='".$info["userid"]."'",$conn);		//ͨ�����ݵ�idֵ��ѯ��ǰ�����ߵĸ�����Ϣ
				 $info1=mysql_fetch_array($sql1); 
	     ?>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top">
		  <table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="354" background="images/dh_back_1.gif">&nbsp;��&nbsp;&nbsp;�⣺<?php echo unhtml($info["title"]);?></td>		  
<?php 
$adms=mysql_query("select id from tb_adm where userword='".$adm."'",$conn);			//�ӹ���Ա���ݱ��в�ѯ��¼�İ���id
$re=mysql_fetch_array($adms);
if($re['id']==$info['userid'] && $adm!=""){		//�жϵ�ǰ��¼�Ĺ���Ա�ǲ��Ǹ������Եķ����ߣ����������ʾ�༭��ť
?>
  <td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("�༭����");?>">�༭</a></div></td>
<?php
	}elseif($user== $info1['usernc'] and $user!=""){       //�����ǰ�û��Ǹ����Եķ����ߣ�����ʾ�༭��ť
?>
  <td width="50" background="images/dh_back_1.gif"><div align="center"><a href="index.php?ed=<?php echo $info['id'];?> & id=<?php echo urlencode("�༭����");?>">�༭</a></div></td>
<?php
	}else{
?>
   <td width="50" background="images/dh_back_1.gif"><div align="center">�༭</div></td>    
<?php
}
?>
			 <?php
			if($adm!=""){ 			//����Ա��¼�󣬿��Զ����ӽ��лظ�
			?>
			<td width="98" background="images/dh_back_1.gif"><a href="reply.php?t_id=<?php echo $info['id'] ?>">�ظ�����</a></td>
			<?php
			}else if($user!= $info1['usernc'] and $user!=""){      //��ǰ�û����Ǹ����ӵķ�����ʱ�����Զ����ӽ��лظ�
			?>
			 <td width="98" background="images/dh_back_1.gif"><a href="reply.php?t_id=<?php echo $info['id'] ?>">�ظ�����</a></td>
			<?php 
			}else{
			?>
		<td width="98" background="images/dh_back_1.gif">�ظ�����</td>
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
				if($info1["face"]=="" && $info1["usernc"]==""){			//����¼�ߵ�ͷ����û���Ϊ��ʱ����ʾ����Աͷ�񼴵�¼��Ϊ����Ա
				?>
				<img src="images/gly.gif" /><br>����Ա
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
                <p align="right"><a href="index.php?l_id=<?php echo $info['id']; ?>&id=<?php echo urlencode('��ϸ��Ϣ'); ?>">�鿴�ظ�</a></p>
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
           <td width="351"><div align="left">��������&nbsp;<?php echo $total;?>&nbsp;��&nbsp;ÿҳ��ʾ&nbsp;<?php echo $pagesize;?>&nbsp;��&nbsp;��&nbsp;<?php echo $page;?>&nbsp;ҳ/��&nbsp;<?php echo $pagecount;?>&nbsp;ҳ</div></td>
           
           <td width="199"><div align="right">
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=1&id=<?php echo urlencode($id);?>" class="a1">��ҳ</a>&nbsp;
		   <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 		if($page>1) 				//�жϵ�ǰҳ�Ƿ���ڵ�һҳ����������û���������һҳ����������ʱ��ʹ����$page��ֵ��1���Ӷ�ʵ����ǰ��ҳ�Ĺ���
		   			echo $page-1;
		  		else
		   			echo 1;  
		   ?>&id=<?php echo urlencode($id);?>" class="a1">��һҳ</a>&nbsp;
		  <a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php 
		 		if($page<$pagecount) 		//�жϵ�ǰҳ���Ƿ�С���ܵ�ҳ������������û���������һҳ����������ʱ��ʹ����$page��ֵ��1���Ӷ�ʵ����ǰ��ҳ�Ĺ���
				   echo $page+1;
		  		else
		   			echo $pagecount;  
		   ?>&id=<?php echo urlencode($id);?>" class="a1">��һҳ</a>&nbsp;
		   <a href="<?php  echo $_SERVER["PHP_SELF"]?>?page=<?php echo $pagecount;?>&id=<?php echo urlencode($id);?>" class="a1">βҳ</a></div></td>
         </tr>
</table>
<?php
 }
?>