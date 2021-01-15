<html>
<head>
<title>登录</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<style>
body{height:100%;}
</style>
</head>
<body style="background: url(./images/p1.jpg);">
<?php
	if(!isset($_SESSION)){ 
		session_start();
		session_destroy();
	}
?>
<div class="index_01"> 
<table style="width: 100%;height:100%;" >
  <tr>
    <td align="center" >
      <table align="center" width=350 height=230; class="index_table" >  
       <form method ="POST" action = "UserLogin.php" name="frmLogin"> 
     <tr align="center" style="font-size:25px;">
           <td colspan="2" style="font-size:35px;">用户登录</td>
     </tr>
       <tr>  
           <td align="center" style="font-size:25px;">用户名</td>  
           <td><input type="name" maxlength="16" name="uid" placeholder="请输入账号" style="width:180px;font-size:20px;border-radius: 8px; "></td>  
       </tr>  
       <tr>  
           <td align="center" style="font-size:25px;">密   码</td>  
           <td><input name="password" type="password" maxlength="16" placeholder="请输入密码" style="width:180px;font-size:20px;border-radius: 8px; "></td>
       </tr>
       <tr align="center"> 
           <td colspan="2">
           <input type="submit" name="denglu" value="登录" class="btn">
           <input type="reset" name="rs" value="重置" class="btn">  
           <input type="button" name="zu" value="注册" onclick="window.location.href='register.php'" class="btn"/>  
           </td>  
       </tr> 
      </form>
     </table>
    </td>
  </tr>
</table> 
</div>
</body>
</html> 
