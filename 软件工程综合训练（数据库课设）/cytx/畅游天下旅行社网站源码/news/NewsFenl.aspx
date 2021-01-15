<%@ Page Language="C#" MasterPageFile="~/news/MasterPage.master" AutoEventWireup="true" CodeFile="NewsFenl.aspx.cs" Inherits="news_NewsFenl" Title="云南省华坪县一中新闻发布系统----详细新闻信息列表" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href ="../StyleSheet.css" type ="text/css" rel ="Stylesheet"  />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:80%" border="0"  cellpadding="0" cellspacing="0">
  <tr>
      <td style="width:200px" valign="top">
          <table style="width:100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../Images/titleSearch.jpg" height="36" alt ="" style=" background-repeat:repeat-x " /></td>
            </tr>
          </table>
          <table style ="width:100%" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="16px">
                        <asp:ListItem>按标题</asp:ListItem>
                        <asp:ListItem>按作者</asp:ListItem>
                    </asp:DropDownList>
                  </td>
                <td align="left">
                    <asp:TextBox ID="TextBox1" runat="server" Width="110px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td align="center">
                    <asp:ImageButton ID="ImageButton1" runat="server" imageUrl="~/Images/btnSearch.jpg" onclick="ImageButton1_Click"/></td>
              </tr>
            </table>
        </td>
      <td valign="top">
            <table style="width:100%" border="0" cellspacing="0" cellpadding="10">
              <tr>
                <td style="width:12px"><img src="../images/arrow1.gif" width="12" height="12" alt ="" /></td>
                <td align ="left"><span class="Abtt">新闻系统&gt;<asp:Label ID="Label11" runat="server" Text="Label" CssClass ="STYLE9"></asp:Label>
                    </span></td>
              </tr>
            </table>
             <table style="width:100%" border="0" cellspacing="0" cellpadding="10">
              <tr>
               <td style ="width:50%;" class ="STYLE6" align ="left">
                  页次：<asp:Label ID ="Label1" runat ="server" ></asp:Label>
                  /<asp:Label ID ="Label2" runat ="server" ></asp:Label>，
                  共<asp:Label ID="Label3" runat ="server" ForeColor="Red" Font-Bold="true"  ></asp:Label>条记录</td>
                <td style ="width:50%;" align ="right"> 
                  <asp:LinkButton ID="btnFirst" OnClick="PagerButtonClick1" runat="server" CssClass="STYLE6" >[首 页]</asp:LinkButton>
                  <asp:LinkButton ID="btnPrev"  OnClick="PagerButtonClick2" runat="server" CssClass="STYLE6" >[上一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnNext"  OnClick="PagerButtonClick3" runat="server" CssClass="STYLE6" >[下一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnLast"  OnClick="PagerButtonClick4" runat="server"  CssClass="STYLE6">[尾 页]</asp:LinkButton>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">GO</asp:LinkButton>
                  </td>
              </tr>
            </table>
            <table style ="width:100%" border="0" cellpadding ="0" cellspacing="0">
                <tr>
                    <td valign ="top" align ="left"  >
                        <asp:GridView ID="Gridview1" runat ="server" AutoGenerateColumns ="false" 
                            Width ="100%" ShowHeader="false" AllowPaging="True" 
                            BorderStyle="None" GridLines="None">
                            <PagerSettings Visible="False" />
                            <Columns>
                                <asp:TemplateField >
                                    <ItemTemplate>
                                        ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval (Container .DataItem ,"NewID") %>" target="_blank" class ="STYLE13"><%#DataBinder.Eval (Container .DataItem ,"Title") %></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                    </ItemTemplate>
                                    <ItemStyle  CssClass="STYLE13" Height="30px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
      </td>
    </tr>
</table>
</asp:Content>

