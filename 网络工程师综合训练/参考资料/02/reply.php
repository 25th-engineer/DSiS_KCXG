///�鿴������ظ�����ҳ��

<?php
include_once("top.php");
?>
<?php
include_once("function.php");		//����ϵͳ�����ļ�
?>
<table width="779" height="23" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="292" background="images/dh_back.gif"><div align="right">�����ǣ�&nbsp;<script language=JavaScript>
   today=new Date();
   function initArray(){
   this.length=initArray.arguments.length
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i]  }
   var d=new initArray(
     "������",
     "����һ",
     "���ڶ�",
     "������",
     "������",
     "������",
     "������");
document.write(
     "<font color=#000000 style='font-size:9pt;font-family: ����'> ",
     today.getYear(),"��",
     today.getMonth()+1,"��",
     today.getDate(),"��",
	  "&nbsp;&nbsp;",
     d[today.getDay()+1],
	"</font>" ); 
</script></div></td>
    <td width="487" background="images/dh_back.gif"><div align="center">����ǰ��λ�ã��������Ա�&nbsp;>>&nbsp;<a href="reply.php" class="a1">�ظ�����</a></div></td>
  </tr>
</table>
<table width="779" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="5" height="315" bgcolor="#FAF3CE"></td>
    <td width="200" valign="top"><?php include_once("left.php");?></td>
    <td width="6" bgcolor="#FAF3CE"></td>
    <td  valign="top"><table width="520" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="550" height="400" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;�ظ�����</td>
            </tr>
          </table>
		   <script language="javascript">
		     function chkinput(form){
			  if(form.title.value==""){
			    alert("������ظ����⣡");
			    form.title.focus();
				return(false);
			  }
			  
			  if(form.content.value==""){
			    alert("������ظ����ݣ�");
				form.content.focus();
				return(false);
			  }
			 
			  return(true);
			 }
		   
		   </script>
		  
            <table width="500" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
             <form name="form1" method="post" action="savereply.php">
			  <tr>
                <td height="30" colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td width="120" height="40"><div align="center">�ظ����⣺</div></td>
                <td width="380">&nbsp;<input type="text" name="title" size="40" class="inputcss">
                  <input type="hidden" name="t_id" value="<?php echo $_GET['t_id'];?>" /></td>
              </tr>
              <tr>
                <td height="250"><div align="center">�ظ����ݣ�</div></td>
				
                <td height="250">&nbsp;<textarea name="content" rows="15" cols="55" class="inputcss">�ظ�<?php 
				if(isset($_GET['loor'])){
					$loor=$_GET['loor'];
					echo $loor."¥��";
				}else{	
					$loor="���ԣ�";
					echo $loor;
				
				}
				?></textarea></td>
			
              </tr>
              <tr>
                <td colspan="2"><div align="center"><input type="submit"  name="submit" value="�ظ�" class="buttoncss"onclick="return chkinput(form1);">
                &nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="��д" class="buttoncss"></div></td>
              </tr>
			  </form>
            </table></td>
        </tr>
      </table>
	  </td>
    <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
<?php
include_once("bottom.php");
?>
