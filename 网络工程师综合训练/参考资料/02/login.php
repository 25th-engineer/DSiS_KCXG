

//////版主登录页面///////////////
<script language="javascript">
function checklogin(){
	if(login.username.value!="" && login.password.value!=""){
		return true
	}else{
		alert("用户名或者密码不能为空!")
		return false
	}
}
</script>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 24px;
	color: #00CC66;
}
.STYLE3 {
	font-size: 18px;
	color: #000000;
}
.STYLE4 {font-size: 16px}
.STYLE5 {font-size: 18px}
-->
               </style>
	<form action="chklogin.php" method="post" name="login" class="STYLE1" id="login" onsubmit="return checklogin()">
<table>
  <tr>
    <td></td>
  </tr>
</table>
      <table width="550" height="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FCD424">
        <tr>
          <td bgcolor="#FFFFFF" valign="top"><table width="550" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;版主登录</td>
              </tr>
            </table>
              <p align="center"><span class="STYLE3">版主登录</span> </p>
              <p align="center"><span class="STYLE4">版主昵称:
                  <label>
                  <input name="username" type="text" id="username" />
                  </label>
              </span></p>
              <p align="center">&nbsp;</p>
              <p align="center"><span class="STYLE5">密&nbsp;&nbsp;码：</span>
                <input name="password" type="password" id="password" />
              </p>
              <p align="center">&nbsp;</p>
              <p align="center">
                <input type="submit" name="Submit" value="登录" />
&nbsp; &nbsp;
<input type="reset" name="Submit2" value="重写" />
</p>
              <p align="center">&nbsp;</p>
              <p align="center">&nbsp;</p></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <td width="5" bgcolor="#FAF3CE"></td>
  </tr>
</table>
</form>
			     