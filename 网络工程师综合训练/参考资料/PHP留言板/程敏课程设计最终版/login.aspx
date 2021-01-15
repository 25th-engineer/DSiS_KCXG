<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%@ Register Src="head.ascx" TagName="head" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员登陆</title>
</head>
<body background="image/b1.jpg">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 700px">
            <tr>
                <td style="width: 100px; height: 107px">
                    <uc1:head ID="Head1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 600px; height: 233px">
                    <table border="1" style="width: 450px; height: 168px">
                        <tr>
                            <td style="width: 89px">
                                姓名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="姓名不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 89px">
                                密码</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 89px">
                                验证码</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登　陆" />
                                &nbsp;
                                <asp:Button ID="Button2" runat="server" Text="清　除" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 700px; height: 31px; text-align: center">
                    <asp:Label ID="Label2" runat="server" Text="版权所有@违者必究"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 700px; height: 31px; text-align: center">
                    <asp:Label ID="Label3" runat="server" Text="计算机科学与技术０５０１"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
