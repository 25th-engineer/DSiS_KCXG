<?php
include_once("top.php");
if(isset($_GET['id'])){			//判断获取超链接传递的值
			$id=$_GET['id'];	
		}else{
			$id="首页";
		}
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
    <td width="487" background="images/dh_back.gif"><div align="center">您当前的位置：绿意留言本&nbsp;>>&nbsp;
	
	
	
	
	<?php 
	if(isset($_GET['id']) && $_GET['id']=="详细信息"){
	?>
	<a href="index.php?l_id=<?php echo $_GET["l_id"];?> &id=<?php echo urlencode($id);?>" class="a1"><?php echo $id;?></a>
	<?php
	
	}else{
	?>
		<?php echo $id;?>
	<?php 
	}
	?>
	   
	</div></td>
  </tr>
</table>
<table width="779" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="5" height="315" bgcolor="#FAF3CE"></td>
    <td width="200" valign="top"><?php include_once("left.php");?></td>
    <td width="6" bgcolor="#FAF3CE"></td>
    <td align="center"  valign="top">
	      <?php 
		
		switch($id){	//获取超级链接传递的变量		
			case "首页":		//判断如果变量的值等于“首页”		
        		include "main.php";			//则执行该语句
    		break;			//否则跳出循环					
			case "用户注册":
        		include "reg.php";
    		break;
			case "发表留言":
        		include "leaveword.php";
    		break;
			case "查看留言":
        		include "lookleaveword.php";
    		break;
			case "查询留言":
        		include "searchword.php";
    		break;
			case "版主管理":
        		include "login.php";
    		break;
			case "注销登录":
        		include "logout.php";
    		break;
			case "编辑留言":
        		include "editleaveword.php";
    		break;
			case "回复编辑留言":
        		include "edlitreplyword.php";
    		break;
			case "详细信息":
        		include "lookxx.php";
    		break;
			default:		//判断当该值等于空时，执行下面的语句					
        		include "main.php";
    		break;
		}
	?>
     </td>
    <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
<?php
include_once("bottom.php");
?>
