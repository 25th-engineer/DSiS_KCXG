<%@ Page Language="C#" MasterPageFile="~/news/MasterPage.master" AutoEventWireup="true" CodeFile="News_Index.aspx.cs" Inherits="news_Default" Title="新闻发布系统---首页" %>
<%@ Register src="caledar.ascx" tagname="caledar" tagprefix="uc1" %>
<%@ Register src="../floot.ascx" tagname="floot" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href ="../StyleSheet.css" type ="text/css" rel ="Stylesheet" charset ="gb2312"  />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style ="width:80%; height :25px" cellpadding ="0" cellspacing="0">
       <tr>
            <td></td>
       </tr>
    </table>
    <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">旅游常识列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=旅游常识" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left" style ="background-color:#F7F3F7">
                <asp:GridView ID="GridView1" runat="server" ShowHeader="false" AutoGenerateColumns="false" Width ="100%"  BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="30px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%;background-color:#F7F3F7"></td>
        </tr>
    </table>
      <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">景点介绍列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=景点介绍" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView2" runat="server" ShowHeader="false" AutoGenerateColumns="false" Width ="100%" BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
    </table>
     
      <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">芒果之乡列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=芒果之乡" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView3" runat="server"  ShowHeader="false" AutoGenerateColumns="false" Width ="100%" BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
    </table>
      <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">民族风情列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=民族风情" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView4" runat="server" ShowHeader="false" AutoGenerateColumns="false" Width ="100%" BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
    </table>
     <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">华坪特色列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=华坪特色" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView5" runat="server" ShowHeader="false" AutoGenerateColumns="false" Width ="100%"   BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
    </table>
    <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">告列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=公告" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView6" runat="server"  ShowHeader="false" AutoGenerateColumns="false" Width ="100%"  BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
    </table>
    <table style ="width:80%; background-color:#FFFFFF" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px;" class ="STYLE7TT">
            <td align ="left" class ="STYLE11" style ="width:80%">精品线路列表</td>
            <td class ="STYLE11" style ="width:20%"><a href ="NewsFenl.aspx?NewFl=精品线路" target ="_blank" class="STYLE11">更多&gt;&gt;&gt;</a></td>
        </tr>
         <tr style ="width:80%">
            <td align ="left">
                <asp:GridView ID="GridView7" runat="server"  ShowHeader="false" AutoGenerateColumns="false" Width ="100%"  BorderStyle="none" GridLines="None">
                    <Columns >
                        <asp:TemplateField >
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" class ="STYLE13"><%#DataBinder.Eval (Container.DataItem ,"Title") %></a> [<%#DataBinder.Eval (Container.DataItem ,"AddTime")%>]
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE6" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             </td>
             <td style ="width:20%"></td>
        </tr>
        <tr>
          <td colspan="2">
              <uc2:floot ID="floot1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

