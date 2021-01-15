<%@ Page Language="C#" AutoEventWireup="true" CodeFile="new_Fl.aspx.cs" Inherits="news_manager_new_Fl" %>

<%@ Register src="WebUserControl_news.ascx" tagname="WebUserControl_news" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻发布系统---增添新闻类别</title>
    <link href="../StyleSheet.css" type ="text/css" rel ="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <uc1:WebUserControl_news ID="WebUserControl_news1" runat="server" />
        <table style ="width:500px;height:50px" cellpadding="0" cellspacing="0" class ="STYLE6" border="1px">
             <tr style ="height :25px">
                <td style ="width:100px" align ="right">
                    <asp:Label ID="Label1" runat="server" Text="新闻类别："></asp:Label>
                 </td>
                <td style ="width:200px" align ="left">
                    <asp:TextBox ID="TextBox1" runat="server" Width="284px"></asp:TextBox>
                 </td>
                <td style ="width:100px" align ="left" valign="middle"><span class ="xhao">*</span>新闻类别</td>
            </tr>
             <tr style ="height :25px">
                <td style ="width:100px" align ="right"></td>
                <td style ="width:200px" align ="center">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" />
                 </td>
                <td style ="width:100px" align ="left"></td>
            </tr>
        </table>
     </center>
    </div>
    </form>
</body>
</html>
