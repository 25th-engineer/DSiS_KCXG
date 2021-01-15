<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNote.aspx.cs" Inherits="AddNote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加留言页</title>
</head>
<body background="image/b1.jpg">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 800px; height: 536px">
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: center;">
                    <table border="1" style="width: 500px; height: 161px">
                        <tr>
                            <td style="width: 100px">
                                姓名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="姓名不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                性别</td>
                            <td style="width: 100px">
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="sex" Text="男" Checked="True" />
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="女" /></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                留言内容</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox2" runat="server" Height="125px" TextMode="MultiLine" Width="220px"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="留言内容不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 29px">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="留言" />
                                <asp:Button ID="Button2" runat="server" Text="清除" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
