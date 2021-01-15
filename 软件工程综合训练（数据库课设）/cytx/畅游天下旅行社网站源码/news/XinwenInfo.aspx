<%@ Page Language="C#" MasterPageFile="~/news/MasterPage.master" AutoEventWireup="true" CodeFile="XinwenInfo.aspx.cs" Inherits="news_XinwenInfo" Title="新闻发布系统---查看新闻详细内容" %>

<%@ Register src="../floot.ascx" tagname="floot" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/css.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style ="width:970px" border ="0" cellpadding ="0" cellspacing="0" >
        <tr style ="height:10px">
            <td></td>
        </tr>
     </table>
    <table style ="width:80%" border ="0px"  cellpadding="0" cellspacing="0" class="STYLTTAB" >
        <tr>
            <td style ="width:98%">
                <table style ="width:100%" border ="0" cellpadding ="0" cellspacing="0" >
                    <tr style="height:30px">
                        <td align ="left" class="STYLEWZHI">你的位置是:新闻系统--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr style ="height:60px">
                        <td align="center" valign="middle" class ="StyleTitle">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr style ="height:20px">
                        <td align="center"><hr />
                            &nbsp;&nbsp;&nbsp;加入时间：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            来源：<asp:Label ID="Label4" runat="server" ForeColor="#0066FF" Text="Label"></asp:Label>
                        &nbsp;&nbsp; 作者：<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label> 
                        &nbsp;&nbsp;&nbsp;&nbsp; 点击次数：<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label><hr />
                        </td>
                    </tr>
                    <tr style =" width:100%">
                        <td align ="center">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
                    </tr>
                    <tr style ="height:5px">
                        <td></td>
                    </tr>
                    <tr style ="height:25px">
                        <td style="width:100%" align ="center" class ="STYLE9">
                            <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="Blue"></asp:Label></td>
                    </tr>
                    <tr style ="height:5px">
                        <td></td>
                    </tr>
                    <tr>
                        <td style ="width:100%" align ="left">
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td style ="width:30%"></td>
        </tr>
        <tr><td colspan="2">
            <uc1:floot ID="floot1" runat="server" />
            </td></tr>
    </table>
</asp:Content>

