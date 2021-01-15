<?php
include_once("conn/conn.php");
if(mysql_query("delete from tb_replyword  where id='".$_GET["t_id"]."'",$conn)){
  echo "<script>alert('ÁôÑÔÉ¾³ı³É¹¦£¡');history.back();</script>";
}else{
  echo "<script>alert('ÁôÑÔÉ¾³ıÊ§°Ü£¡');history.back();</script>";
}
?>