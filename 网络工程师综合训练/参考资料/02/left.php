<table width="180" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="190" height="100" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><table width="190" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" width="10" height="9">&nbsp;�û���¼</td>
            </tr>
          </table>
            <table width="180" height="80" border="0" align="center" cellpadding="0" cellspacing="0">
             <script language="javascript">
			   function chkinputlogin(form){
			     if(form.usernc.value==""){
				   alert("�������û��ǳƣ�");
				   form.usernc.focus();
				   return(false);
				 }
				 
				  if(form.userpwd.value==""){
				   alert("�������¼���룡");
				   form.userpwd.focus();
				   return(false);
				 }
				 return(true);
			    
			   }
			 </script>
			 <form name="form_login" method="post" action="chkuserlogin.php" onsubmit="return chkinputlogin(this)">
			  <tr>
                <td width="50" height="30"><div align="center">�û�����</div></td>
                <td width="130">&nbsp;<input type="text" size="16" class="inputcss" name="usernc"></td>
              </tr>
              <tr>
                <td height="30"><div align="center">��&nbsp;&nbsp;�룺</div></td>
                <td height="30">&nbsp;<input type="password" size="16" class="inputcss" name="userpwd"></td>
              </tr>
              <tr>
                <td height="30" colspan="2"><div align="center"><input type="submit" value="��¼" class="buttoncss">&nbsp;&nbsp;<input type="reset" value="��д" class="buttoncss" ></div></td>
              </tr>
			  
			  </form>
            </table></td>
        </tr>
      </table>
      <table width="180" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="190" height="180" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><table width="190" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" width="10" height="9">&nbsp;������</td>
              </tr>
            </table>
            <table width="180" height="160" border="0" align="center" cellpadding="0" cellspacing="1">
              <tr>
                <td bgcolor="#F9FCE9"><div align="center">
                  <table width="150" height="3" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td></td>
                      </tr>
                  </table>
                  <?php include_once("cale.php");?>
                </div></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="180" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="190" height="183" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><table width="190" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" width="10" height="9">&nbsp;��������</td>
              </tr>
          </table>
            <table width="180" height="44" border="0" align="center" cellpadding="0" cellspacing="0">
             <?php
			   $sql=mysql_query("select title ,id ,createtime from tb_leaveword where id order by id desc limit 0,9",$conn);
			   $info=mysql_fetch_array($sql); 
			   if($info==false){
			 ?>
			  <tr>
                <td height="22" colspan="2"><div align="center">�Բ����������ԣ�</div></td>
              </tr>
			  <?php
			  }else{
			   do{
			  ?>
              <tr>
                <td width="20"><img src="images/mark_0.gif" width="10" height="10" /></td>
             
			    <td width="160" height="22"><a href="index.php?l_id=<?php echo $info["id"];?> & id=<?php echo urlencode('��ϸ��Ϣ'); ?>" class="a1">
				<?php 
				 echo unhtml(msubstr($info["title"],0,14));
				 if(strlen(unhtml($info["title"]))>14){
			          echo ".";
			       }
				  echo "<font color=blue>[".str_replace("-","/",substr($info['createtime'],2,8))."]</font>";
				
				?></a></td>
              </tr>
			  <?php
			   }while($info=mysql_fetch_array($sql));
			  }
			  ?>
            </table></td>
        </tr>
</table>
      <table width="180" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>