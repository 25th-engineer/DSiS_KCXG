<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="news_manager_manager" %>

<%@ Register src="WebUserControl_news.ascx" tagname="WebUserControl_news" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统管理后台</title>
    <link href = "../CSS/StyleSheet.css" ="text/css" rel ="Stylesheet"  />
    <script language="javascript" type="text/javascript">    
    // 鼠标经过改变行的颜色
    if (!objbeforeItem)
    {
        var objbeforeItem=null;
        var objbeforeItembackgroundColor=null;
    }    
    function ItemOver(obj)
    {
        if(objbeforeItem)
        {
            objbeforeItem.style.backgroundColor = objbeforeItembackgroundColor;
        }
        objbeforeItembackgroundColor = obj.style.backgroundColor;
        objbeforeItem = obj;
        obj.style.backgroundColor = "#507CD1";     
    }
    </script>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    
        <uc1:WebUserControl_news ID="WebUserControl_news1" runat="server" />
    
    </div>
 <table style ="width:970px; height :25px" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px">
            <td style ="width:5%"></td>
            <td style ="width:30%;" class ="STYLE6" align ="left">页次：<asp:Label ID ="Label1" runat ="server" ></asp:Label>/<asp:Label ID ="Label2" runat ="server" ></asp:Label>，共<asp:Label ID="Label3" runat ="server" ForeColor="Red" Font-Bold="true"  ></asp:Label>条记录</td>
            <td style ="width:20%">&nbsp;</td>
            <td style ="width:40%" align ="right">
                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="STYLE6" onclick="LinkButton1_Click">[导出excel]</asp:LinkButton>
                  <asp:LinkButton ID="btnFirst" OnClick="PagerButtonClick1" runat="server" CssClass="STYLE6" >[首 页]</asp:LinkButton>
                  <asp:LinkButton ID="btnPrev"  OnClick="PagerButtonClick2" runat="server" CssClass="STYLE6" >[上一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnNext"  OnClick="PagerButtonClick3" runat="server" CssClass="STYLE6" >[下一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnLast"  OnClick="PagerButtonClick4" runat="server"  CssClass="STYLE6">[尾 页]</asp:LinkButton>
                  <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                  <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">GO</asp:LinkButton>
            </td>
             <td style ="width:5%"></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="970px" 
            Font-Size="Small" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging1" AllowSorting="True" 
            onrowcommand="GridView1_RowCommand" PageSize="12" 
            onrowdeleting="GridView1_RowDeleting" >
            <PagerSettings Visible="False" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="20px"/>
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="编号">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"NewID") %>
                    </ItemTemplate>
                    <ItemStyle Width="2%" BorderWidth="1px" HorizontalAlign="Center" Height="25px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px"  Font-Size="Small"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="新闻标题">
                    <ItemTemplate>
                        <a href ="SingleNewsInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem,"NewID") %>" target="_blank" title ="<%#DataBinder.Eval(Container.DataItem, "Title")%>" class="STYLE6"><%#DataBinder.Eval(Container.DataItem, "Title")%></a>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="left" Width="8%" BorderWidth="1px" Height="25px" Font-Size="Medium" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作者">
                    <ItemTemplate>
                       <%#DataBinder.Eval(Container.DataItem, "Author")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="center" Width="3%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="点击次数">
                    <ItemTemplate><%#DataBinder.Eval (Container.DataItem ,"HitCounts") %></ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="2%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="加入日期">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AddTime")%></ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" BorderWidth="1px" CssClass="STYLE6" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="新闻分类">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "NewFl")%></ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" BorderWidth="1px" CssClass="STYLE6" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="编辑会员">
                    <ItemTemplate>
                        <a href="upload_news.aspx" title ="添加用户信息" target="_blank" class="STYLE10">添加</a> 
                        <a href="UpdateNew.aspx?NewID=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" title ="修改<%#DataBinder.Eval (Container.DataItem ,"Title") %>的个人信息" target="_blank" class="STYLE6">修改</a> 
                        <%--<a href ="DeleteNew.aspx?newid=<%#DataBinder.Eval (Container.DataItem ,"NewID")%>" title="删除<%#DataBinder.Eval (Container.DataItem ,"Title")%>的个人信息" class ="STYLE9">删除</a>--%>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText ="删除" >
                    <ItemTemplate >
                        <asp:ImageButton  ID ="ImgButton1" runat ="server" ImageUrl="~/Images/delete.gif" CommandName ="delete"
                         CommandArgument ='<%#DataBinder .Eval (Container .DataItem ,"NewID") %>' OnClientClick="return confirm('确定删除吗？')" />                 
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Center" Width ="2%" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
    </center>
</body>
</html>
