<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="head.ascx" TagName="head" TagPrefix="uc1" %>
<%@ Register Src="foot.ascx" TagName="foot" TagPrefix="uc2" %>
<%@ Register Assembly="EeekSoft.Web.PopupWin" Namespace="EeekSoft.Web" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>汶川留言</title>
</head>
<body bgcolor="#cccccc">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <cc1:PopupWin ID="PopupWin1" runat="server" Message="" Style="left: -30px; top: 47px"
            Title="系统消息" />
        <table style="width: 778px">
            <tr>
                <td style="background-image: url(image/20085196558.jpg); width: 500px; height: 203px">
                    <uc1:head ID="Head1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 600px; height: 54px">
                <marquee  behavior=scroll Scrollamount=5 style="width: 913px"><A 
      href="AddNote.aspx"><IMG src="image/20085196372.jpg" /></A> 
      &nbsp;&nbsp;&nbsp; &nbsp; <IMG style="WIDTH: 216px; HEIGHT: 73px" 
      src="image/cm1.JPG" />&nbsp;&nbsp;&nbsp; &nbsp; <IMG 
      style="WIDTH: 216px; HEIGHT: 73px" src="image/cm2.JPG" /> 
      &nbsp;&nbsp;&nbsp; &nbsp; <IMG style="WIDTH: 216px; HEIGHT: 73px" 
      src="image/cm3.JPG" /></marquee>
                 <marquee  behavior=scroll Scrollamount=5 style="width: 913px"><IMG 
      src="image/20085192292.jpg" />&nbsp;&nbsp;&nbsp; &nbsp; <IMG 
      style="WIDTH: 216px; HEIGHT: 73px" src="image/cm5.JPG" /> 
      &nbsp;&nbsp;&nbsp; &nbsp; <A 
      href="http://news.qq.com/zt/2008/dizhen/"><IMG 
      style="WIDTH: 216px; HEIGHT: 73px" src="image/20085192386.jpg" /></A> 
      &nbsp;&nbsp;&nbsp; &nbsp; <IMG style="WIDTH: 216px; HEIGHT: 73px" 
      src="image/cm4.JPG" /></marquee>
                </td>
            </tr>
            <tr>
                <td style="width: 600px; height: 45px; text-align: center">
                    &nbsp;
                    <div style="z-index: 102; left: 257px; width: 523px; position: absolute; top: 387px;
                        height: 30px">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/login.aspx">管理员登陆</asp:HyperLink>
                        &nbsp; &nbsp;
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AddNote.aspx">我要留言</asp:HyperLink>
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/money.aspx">捐款方式</asp:HyperLink></div>
                </td>
            </tr>
            <tr>
                <td style="width: 600px; height: 107px">
                    <asp:DataList ID="DataList1" runat="server" Height="1px" Width="666px" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                    <ItemTemplate>
                    <div align=left>
                    <img src="image/<%#Eval("image") %>" />
                    姓名：<%#Eval("name") %>
                    性别：<%#Eval("sex") %><hr /><br />
                    留言时间：<%#Eval("time") %>
                    留言内容：<br /><br /> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<%#Eval("content") %>
                    <div align=right>
                        <asp:LinkButton ID="LinkButton6" runat="server"   CommandArgument=<%#Eval("id") %> OnCommand="LinkButton6_Command">删 除</asp:LinkButton></div>
                        <hr /><br />
                    </div>
                    </ItemTemplate>
                    
                    </asp:DataList></td>
            </tr>
            <tr>
                <td style="width: 600px" >
                    <asp:Label ID="Label4" runat="server" Text="当前第"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="1" ForeColor="Fuchsia"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="页"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">首页</asp:LinkButton>
                    &nbsp;&nbsp; <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">上一页</asp:LinkButton>
                    &nbsp; &nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">下一页</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">尾页</asp:LinkButton>&nbsp;&nbsp;<asp:Label
                        ID="Label6" runat="server" Text="共有"></asp:Label>
                    <asp:Label ID="Label8" runat="server" ForeColor="Fuchsia"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="页"></asp:Label>
                    &nbsp; &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 600px">
                    <asp:Label ID="Label9" runat="server" Text="共有"></asp:Label>
                    <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="人访问过本网站，"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="当前在线人数为："></asp:Label>
                    <asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 600px; height: 5px; text-align: center;">
                    <asp:Label ID="Label2" runat="server" Text="版权所有@违者必究"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 600px; height: 30px; text-align: center;">
                    <asp:Label ID="Label3" runat="server" Text="计算机科学与技术０５０１"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
