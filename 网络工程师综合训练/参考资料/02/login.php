

//////������¼ҳ��///////////////
<script language="javascript">
function checklogin(){
	if(login.username.value!="" && login.password.value!=""){
		return true
	}else{
		alert("�û����������벻��Ϊ��!")
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
                <td background="images/dh_back_1.gif">&nbsp;&nbsp;<img src="images/biao.gif" />&nbsp;������¼</td>
              </tr>
            </table>
              <p align="center"><span class="STYLE3">������¼</span> </p>
              <p align="center"><span class="STYLE4">�����ǳ�:
                  <label>
                  <input name="username" type="text" id="username" />
                  </label>
              </span></p>
              <p align="center">&nbsp;</p>
              <p align="center"><span class="STYLE5">��&nbsp;&nbsp;�룺</span>
                <input name="password" type="password" id="password" />
              </p>
              <p align="center">&nbsp;</p>
              <p align="center">
                <input type="submit" name="Submit" value="��¼" />
&nbsp; &nbsp;
<input type="reset" name="Submit2" value="��д" />
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
			     