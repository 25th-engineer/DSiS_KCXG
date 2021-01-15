<%@ Page Language="C#" AutoEventWireup="true" CodeFile="denglu1.aspx.cs" Inherits="user_denglu1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href= "../CSS/StyleSheet.css" type ="text/css" rel ="Stylesheet"  />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
            <table style ="width :450px; height:125px" cellpadding="0" cellspacing="0">
            <tr style ="height:50px" class="STYLE6">
                <td align ="center" class="AAC">用户登录</td>
            </tr>
            <tr style ="width:450px; height :75px">
                <td>
                    <table style ="width:450px; height :75px" cellpadding ="0" cellspacing="0" border="1px" class="STYLE6">
                        <tr style ="height :25px">
                            <td style ="width:150px" align ="right" class="STYLE6">
                                <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" Width="150px"></asp:TextBox>
                            </td>
                           <td style ="width:150px" align ="left">
                              用户名 
                            </td>
                        </tr>
                         <tr style ="height :25px" class="STYLE6">
                            <td style ="width:150px" align ="right">
                                <asp:Label ID="Label2" runat="server" Text="密码："></asp:Label>
                             </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                             </td>
                              <td style ="width:150px" align ="left">
                               密码
                            </td>
                        </tr>
                        <tr style ="height :25px">
                            <td align ="right" style ="width:150px">
                                <asp:Label ID="Label3" runat="server" Text="验证码："></asp:Label>
                            </td>
                            <td valign="middle">
                                <asp:TextBox ID="Validator" runat="server" Width="150px"></asp:TextBox>
                            </td>
                             <td style ="width:150px" align ="left" >
                                 <asp:Image ID="Image1" runat="server" ImageUrl="~/user/logainp.aspx" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table style="width:446px; height: 49px;" border="0" cellpadding="0" 
                cellspacing="0" >
           <tr>
                <td style="width: 100px; height: 50px;">&nbsp;</td>
                <td style="width:200px;" align ="center">
                    <asp:Button ID ="LoginBtn" runat ="server" Text ="提交" OnClick="LoginBtn_Click" 
                        Height="28px" Width="50px"  />
                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;   
                    <asp:Button ID ="CancelBtn" runat ="server" Text ="取消" 
                        OnClick="CancelBtn_Click" Height="30px" Width="46px" />
                </td>
            <td><a href ="denglu1.aspx" class="STYLE10">看不清换一张</a></td>
           </tr> 
        </table>
        </center>
    </div>
    </form>
</body>
</html>
