///查看留言里，回复此贴页面

<?php
include_once("top.php");
?>
<?php
include_once("function.php");		//包含系统功能文件
?>
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
    <td width="487" background="images/dh_back.gif"><div align="center">您当前的位置：明日留言本&nbsp;>>&nbsp;<a href="reply.php" class="a1">回复留言</a></div></td>
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
              <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;回复留言</td>
            </tr>
          </table>
		   <script language="javascript">
		     function chkinput(form){
			  if(form.title.value==""){
			    alert("请输入回复主题！");
			    form.title.focus();
				return(false);
			  }
			  
			  if(form.content.value==""){
			    alert("请输入回复内容！");
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
                <td width="120" height="40"><div align="center">回复主题：</div></td>
                <td width="380">&nbsp;<input type="text" name="title" size="40" class="inputcss">
                  <input type="hidden" name="t_id" value="<?php echo $_GET['t_id'];?>" /></td>
              </tr>
              <tr>
                <td height="250"><div align="center">回复内容：</div></td>
				
                <td height="250">&nbsp;<textarea name="content" rows="15" cols="55" class="inputcss">回复<?php 
				if(isset($_GET['loor'])){
					$loor=$_GET['loor'];
					echo $loor."楼：";
				}else{	
					$loor="留言：";
					echo $loor;
				
				}
				?></textarea></td>
			
              </tr>
              <tr>
                <td colspan="2"><div align="center"><input type="submit"  name="submit" value="回复" class="buttoncss"onclick="return chkinput(form1);">
                &nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重写" class="buttoncss"></div></td>
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
