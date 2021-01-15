<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateNew.aspx.cs" Inherits="news_manager_UpdateNew" ValidateRequest="false" %>

<%@ Register src="WebUserControl_news.ascx" tagname="WebUserControl_news" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻发布系统---后台管理---修改页面</title>
    <link href = "../CSS/StyleSheet.css" ="text/css" rel ="Stylesheet"  />
</head>
<body>
<center>
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
    <div>
    
       <uc1:WebUserControl_news ID="WebUserControl_news1" runat="server" />
        <table style ="width:970px;" cellpadding ="0" cellspacing="0" class ="StyleTabTd" border="1px" >
        <tr style ="height :50px">
            <td class ="STYLE7TT"><span >&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label22" 
                    runat="server" Text="Label"></asp:Label>
                &nbsp; 新闻修改页面:</span></td>
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
                            <asp:TextBox ID="TextBox2" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class="STYLE8">.新闻的标题</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label2" runat="server" Text="新闻副标题："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox1" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class="STYLE8">.新闻副标题</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label13" runat="server" Text="作者："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox3" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8">.新闻作者</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label14" runat="server" Text="通讯社："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox4" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8">.通讯社</td>
                    </tr>
                    <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label15" runat="server" Text="备注："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:TextBox ID="TextBox5" runat="server" Width="600px"></asp:TextBox>
                        </td>
                        <td class ="STYLE8" >.备注</td>
                    </tr>
                     </tr>
                    <tr>
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label1" runat="server" Text="相关图片："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                        <td class="STYLE8">.相关图片</td>
                    </tr>
                    <tr>
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label16" runat="server" Text="相关图片："></asp:Label>
                        </td>
                        <td style ="width:600px" align="left" class ="StyleTabTd">
                            <input id ="File1" type="file" name ="file" style ="width:100%" onclick="fileclick1"/></td>
                        <td class="STYLE8">.相关图片(注意修改时必须重新上传图片【图片的名字不必改了，以便节约空间】，才能更新。或者把这条删除后重新添加，谢谢您的合作！)</td>
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
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="NewFl" DataValueField="NewFl">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:WebUserDBConnectionString %>" 
                                SelectCommand="SELECT [NewFl] FROM [NewsFl]"></asp:SqlDataSource>
                        </td>
                        <td class="STYLE8">.新闻分类</td>
                    </tr>
                    <tr style ="height :400px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                            <asp:Label ID="Label19" runat="server" Text="新闻内容："></asp:Label>
                        </td>
                        <td style ="width:600px; height :300px" align="left" class ="StyleTabTd">
                            <input type="hidden" id="content1" name="content1" runat="server" />
                            <iframe id="eWebEditor1" 
                                src="ewebeditor/ewebeditor.htm?id=content1&style=coolblue" frameborder="0" scrolling="no" width="100%" height ="400px"></iframe></td>
                        <td class="STYLE8">.新闻内容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            (注意修改时必须重新上传图片【图片的名字不必改了，以便节约空间】，才能更新。或者把这条删除后重新添加，谢谢您的合作！)</td>
                    </tr>
                      <tr style ="height :30px">
                        <td style ="width:150px" align="right" class ="StyleTabTd">
                           
                        </td>
                        <td style ="width:600px" align="center" class ="StyleTabTd">
                            <asp:Button ID="Button1" runat="server" Text="提交" 
                                onclick="Button1_Click1" Width="90px" />
                        </td>
                       <td></td>
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
