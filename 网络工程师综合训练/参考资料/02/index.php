<?php
include_once("top.php");
if(isset($_GET['id'])){			//�жϻ�ȡ�����Ӵ��ݵ�ֵ
			$id=$_GET['id'];	
		}else{
			$id="��ҳ";
		}
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
    <td width="487" background="images/dh_back.gif"><div align="center">����ǰ��λ�ã��������Ա�&nbsp;>>&nbsp;
	
	
	
	
	<?php 
	if(isset($_GET['id']) && $_GET['id']=="��ϸ��Ϣ"){
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
		
		switch($id){	//��ȡ�������Ӵ��ݵı���		
			case "��ҳ":		//�ж����������ֵ���ڡ���ҳ��		
        		include "main.php";			//��ִ�и����
    		break;			//��������ѭ��					
			case "�û�ע��":
        		include "reg.php";
    		break;
			case "��������":
        		include "leaveword.php";
    		break;
			case "�鿴����":
        		include "lookleaveword.php";
    		break;
			case "��ѯ����":
        		include "searchword.php";
    		break;
			case "��������":
        		include "login.php";
    		break;
			case "ע����¼":
        		include "logout.php";
    		break;
			case "�༭����":
        		include "editleaveword.php";
    		break;
			case "�ظ��༭����":
        		include "edlitreplyword.php";
    		break;
			case "��ϸ��Ϣ":
        		include "lookxx.php";
    		break;
			default:		//�жϵ���ֵ���ڿ�ʱ��ִ����������					
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
