<?php
	if(isset($_SESSION['unc']) or isset($_SESSION['userword'])){			//用户或管理员登录后才可以发表留言
?>
<table>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>
	  <table width="550" height="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;发表留言</td>
            </tr>
          </table>
		  
		   <script language="javascript">
		     function chkinput(form){
			  if(form.title.value==""){
			    alert("请输入留言主题！");
			    form.title.focus();
				return(false);
			  }
			  
			  if(form.content.value==""){
			    alert("请输入留言内容！");
				form.content.focus();
				return(false);
			  }
			 
			  return(true);
			 }
		   
		    </script>
		  
            <table width="500" height="473" border="0" align="center" cellpadding="0" cellspacing="0">
             <form name="form1" method="post" action="saveleaveword.php">
			  <tr>
                <td height="30" colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td width="120" height="40"><div align="center">留言主题：</div></td>
                <td width="380">&nbsp;<input type="text" name="title" size="40" class="inputcss">
                <input type="hidden" name="userid" /></td>
              </tr>
              <tr>
                <td height="273"><div align="center">留言内容：</div></td>
                <td height="273">&nbsp;
                <textarea name="content" rows="15" cols="55" class="inputcss"></textarea></td>
              </tr>
              <tr>
                <td colspan="2" valign="top"><div align="center"><input type="submit"  name="submit" value="发表" class="buttoncss"onclick="return chkinput(form1);">&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重写" class="buttoncss">
                </div></td>
              </tr>
			  </form>
            </table></td>
        </tr>
      </table>
	  </td>
    <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
</td>
  </tr>
</table>
<?php
}else{
	echo "<script>alert('登录后发表留言！');history.back();</script>";
}
?>