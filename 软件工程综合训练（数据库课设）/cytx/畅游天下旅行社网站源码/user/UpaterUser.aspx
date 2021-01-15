<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpaterUser.aspx.cs" Inherits="user_UpaterUser" ValidateRequest="false" %>

<%@ Register src="WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户管理系统---修改用户信息</title>
    <link href= "../CSS/StyleSheet.css" ="text/css" rel ="Stylesheet"  />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <uc1:WebUserControl ID="WebUserControl1" runat="server" />
    <br />
     <table style ="width:970px; height :350px" cellpadding ="0" cellspacing="0" class ="StyleTabTd" border="1px" >
        <tr style ="height :50px">
            <td class ="STYLE7TT"><span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 修改<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>的个人基本情况:</span></td>
        </tr>   
        <tr style ="height:225px">
            <td>
                <table style ="width:100%;height:300px" cellpadding="0" cellspacing="0" border="1px" >
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label11" runat="server" Text="用户编号："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="STYLE8">.用户编号是该用户在系统里面的唯一标示</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label12" runat="server" Text="用户名称："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox2" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class="STYLE8">.该用户在系统里面注册的名称</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label13" runat="server" Text="邮箱地址："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox3" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8">.用户的邮箱地址</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label14" runat="server" Text="性别："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox4" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8">.性别</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label15" runat="server" Text="出生年月："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox5" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8" >.该用户的生日</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label16" runat="server" Text="联系电话："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox6" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class="STYLE8">.该用户的联系电话</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label17" runat="server" Text="所在地区："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox7" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8">.所在地区</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label18" runat="server" Text="注册日期："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="STYLE8">.在系统中的注册日期</td>
                    </tr>
                    <tr style ="height :60px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label19" runat="server" Text="个人简历："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <input type="hidden" id="content1" name="content1" runat="server" />
                            <iframe id="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=content1&style=coolblue" frameborder="0" scrolling="no" width="100%" height="350"></iframe></td>
                        <td class="STYLE8">.个人的简单介绍</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="33px" onclick="Button1_Click" 
            Text="提交" Width="150px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Height="30px" onclick="Button2_Click" 
        Text="返回主界面" Width="145px" />
</form>
</center>
</body>
</html>
