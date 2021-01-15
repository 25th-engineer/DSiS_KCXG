<html>
<head>
<title>注册</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<style>
body{height:100%;}
</style>
</head>
<body style="background: url(./images/p1.jpg)">
<div class="index_01" > 
<table style="width: 100%;height:100%;" >
  <tr>
    <td align="center" >
      <form action="UserRegister.php " name="dl" method="post" enctype="multipart/form-data">
      <table  align="center" width=350 height=230; style="font-family:宋体;font-size:25px;">
      <tr align="center"> 
        <td colspan="2" style="font-size:35px;">注册用户</td>
      </tr>
	  <tr>
		<td align="center">用户头像</td>
        <td>
        <input type="file" maxlength="20" name="photo" style="width:180px;font-size:20px;border-radius: 8px; ">
        </td>
	  </tr>
      <tr>
        <td align="center">用户名</td>
        <td>
        <input type="name" maxlength="20" name="id" placeholder="手机号/邮箱" style="width:180px;font-size:20px;border-radius: 8px; ">
        </td>
      </tr>
      <tr>
        <td align="center">密   码</td>
        <td >
        <input name="password" type="password" maxlength="16" placeholder="请输入密码" style="width:180px;font-size:20px;border-radius: 8px; ">
      </td>
      </tr>
      <tr>
        <td align="center">确认密码</td>
        <td>
        <input name="confirmPassword" type="password" maxlength="16" placeholder="请再次输入密码" style="width:180px;font-size:20px;border-radius: 8px; ">
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        <input type="button" name='zu' value='登录' onclick="location.href='login.php'" style="font-size:17px;border-radius: 12px;" class="btn"/>
        <input type="reset" name="zu" value="重置" style="font-size:17px;border-radius: 12px;" class="btn"> 
        <input type="submit" name="zu" value="注册" style="font-size:17px;border-radius:12px;" class="btn"/>
        </td>
      </tr>
     </table>
    </form>
   </td>
  </tr>
</table>
</div>
</body>
<html>
