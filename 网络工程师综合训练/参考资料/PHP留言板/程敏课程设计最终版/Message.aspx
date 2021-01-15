<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Message" %>

<%@ Register Src="head.ascx" TagName="head" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>操作结果页</title>
</head>
<body background="image/b1.jpg">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 97%; height: 429px">
            <tr>
                <td style="width: 100px; height: 111px">
                    <uc1:head ID="Head1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 700px; height: 185px; text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server"
                        PostBackUrl="~/Default.aspx">返回首页</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 700px; height: 20px">
                    <asp:Label ID="Label2" runat="server" Text="版权所有@违者必究"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 700px; height: 20px; text-align: center">
                    <asp:Label ID="Label3" runat="server" Text="计算机科学与技术０５０１"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
