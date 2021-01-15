<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SingleNewsInfo.aspx.cs" Inherits="news_manager_SingleNewsInfo" %>

<%@ Register src="WebUserControl_news.ascx" tagname="WebUserControl_news" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻发布系统---新闻后台管理</title>
    <link href = "../CSS/StyleSheet.css" ="text/css" rel ="Stylesheet"  />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <uc1:WebUserControl_news ID="WebUserControl_news1" runat="server" />
    <div>
    <table style ="width:970px;" cellpadding ="0" cellspacing="0" class ="StyleTabTd" border="1px" >
        <tr style ="height :50px">
            <td class ="STYLE7TT"><span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                新闻页面:</span></td>
        </tr>   
        <tr style ="height:225px">
            <td>
                <table style ="width:100%;" cellpadding="0" cellspacing="0" border="1px" >
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label11" runat="server" Text="新闻编号："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="STYLE8">.新闻编号是该用户在系统里面的唯一标示</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label12" runat="server" Text="新闻标题："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="TextBox2" runat="server" Width="600px"></asp:Label>
                        </td>
                        <td class="STYLE8">.新闻的标题</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label2" runat="server" Text="新闻副标题："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="TextBox1" runat="server" Width="600px"></asp:Label>
                        </td>
                        <td class="STYLE8">.新闻副标题</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label13" runat="server" Text="作者："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="TextBox3" runat="server" Width="600px"></asp:Label>
                        </td>
                        <td class ="STYLE8">.新闻作者</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label14" runat="server" Text="通讯社："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="TextBox4" runat="server" Width="600px"></asp:Label>
                        </td>
                        <td class ="STYLE8">.通讯社</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label15" runat="server" Text="备注："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="TextBox5" runat="server" Width="600px"></asp:Label>
                        </td>
                        <td class ="STYLE8" >.备注</td>
                    </tr>
                    <tr>
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label16" runat="server" Text="相关图片："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                        <td class="STYLE8">.相关图片</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label17" runat="server" Text="加入日期："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class ="STYLE8">.加入日期</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label18" runat="server" Text="新闻分类："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="STYLE8">.新闻分类</td>
                    </tr>
                    <tr style ="height :300px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label19" runat="server" Text="新闻内容："></asp:Label>
                        </td>
                        <td style ="width:600px; height :300px" align="left" class ="StyleTabTd">
                            <input type="hidden" id="content1" name="content1" runat="server" />
                            <asp:Label ID="Label24" runat="server" Text="Label" Width="100%" Height="100%"></asp:Label>
                        </td>
                        <td class="STYLE8">.新闻内容</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
    </center>
</body>
</html>
