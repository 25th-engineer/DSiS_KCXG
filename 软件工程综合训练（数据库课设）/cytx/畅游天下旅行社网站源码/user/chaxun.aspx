<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chaxun.aspx.cs" Inherits="caldenar_Default2" %>

<%@ Register src="../news_manager/WebUserControl_news.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户查询页面</title>
    <link href= "../CSS/StyleSheet.css" type ="text/css" rel ="Stylesheet"  />
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
        <uc1:WebUserControl ID="WebUserControl1" runat="server" />
        <br />
    <table style ="height:25px; width:520px" cellpadding="0" cellspacing="0" class="StyleTabTd"  >
        <tr style ="height:25px">
            <td style ="width:190px" align ="right"><asp:Label ID="Label5" runat="server" Text="注册日期查询："></asp:Label></td>
            <td style ="width:100px;" align="right"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td style ="width:40px"><asp:Button ID="Button2" runat="server" Text="..." onclick="Button2_Click" /></td>
            <td style ="width:100px" align ="left"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            <td style ="width:40px"><asp:Button ID="Button3" runat="server" Text="..." onclick="Button3_Click" /></td>
            <td style ="width:50px" align ="left"><asp:Button ID="Button4" runat="server" Text="提交" onclick="Button4_Click" Width="50px" /></td>
        </tr>
    </table>
    </div>
    <asp:Calendar ID="Calendar1" runat="server" Visible="False" 
            onselectionchanged="Calendar1_SelectionChanged" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            ShowGridLines="True" Width="220px">
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
            ForeColor="#FFFFCC" />
        </asp:Calendar>
    <asp:Calendar ID="Calendar2" runat="server" Visible ="False" 
            onselectionchanged="Calendar2_SelectionChanged" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            ShowGridLines="True" Width="220px">
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
            ForeColor="#FFFFCC" />
        </asp:Calendar>
     <table style ="height:25px; width:520px" cellpadding="0" cellspacing="0" class="StyleTabTd"  >
        <tr style ="height:25px">
            <td align ="right" style ="width:370px">
                <asp:Label ID="Label4" runat="server" Text="选择查询条件："></asp:Label>
            </td>
            <td style ="width:50px;" align="right">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="150px">
                    <asp:ListItem>----请选择查询类型-----</asp:ListItem>
                    <asp:ListItem>按姓名查询</asp:ListItem>
                    <asp:ListItem>按地址查询</asp:ListItem>
                    <asp:ListItem>按邮箱查询</asp:ListItem>
                    <asp:ListItem>按联系电话查询</asp:ListItem>
                    <asp:ListItem>按性别查询</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style ="width:50px" align ="left">
                <asp:TextBox ID="TextBox3" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td style ="width:50px" align ="left">
                <asp:Button ID="Button1" runat="server" Text="提交" 
                    Width="84px" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
        <table style ="width:970px; height :25px" cellpadding ="0" cellspacing="0">
        <tr style ="height:25px">
            <td style ="width:5%"></td>
            <td style ="width:30%;" class ="STYLE6" align ="left">页次：<asp:Label ID ="Label1" runat ="server" ></asp:Label>/<asp:Label ID ="Label2" runat ="server" ></asp:Label>，共<asp:Label ID="Label3" runat ="server" ForeColor="Red" Font-Bold="true"  ></asp:Label>条记录</td>
            <td style ="width:30%"></td>
            <td style ="width:30%" align ="right">
                  <asp:LinkButton ID="btnFirst" OnClick="PagerButtonClick1" runat="server" CssClass="STYLE6" >[首 页]</asp:LinkButton>
                  <asp:LinkButton ID="btnPrev"  OnClick="PagerButtonClick2" runat="server" CssClass="STYLE6" >[上一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnNext"  OnClick="PagerButtonClick3" runat="server" CssClass="STYLE6" >[下一页]</asp:LinkButton>
                  <asp:LinkButton ID="btnLast"  OnClick="PagerButtonClick4" runat="server"  CssClass="STYLE6">[尾 页]</asp:LinkButton>
            </td>
             <td style ="width:5%"></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="970px" 
            Font-Size="Small" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging1" AllowSorting="True" 
            onrowdatabound="GridView1_RowDataBound" 
            PageSize="12" >
            <PagerSettings Visible="False" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="20px"/>
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="编号">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"UserID") %>
                    </ItemTemplate>
                    <ItemStyle Width="2%" BorderWidth="1px" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px"  Font-Size="Small"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名称">
                    <ItemTemplate>
                        <a href ="userinfo.aspx?userid=<%#DataBinder.Eval(Container.DataItem,"UserID") %>" target="_blank" title ="该用户的名称信息" class="STYLE6"><%#DataBinder.Eval (Container.DataItem ,"UserName") %></a>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="3%" BorderWidth="1px" Height="25px" Font-Size="Medium" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="邮箱地址">
                    <ItemTemplate>
                        <a href ="mailto:<%#DataBinder.Eval (Container.DataItem ,"Email") %>" class ="STYLE6"><%#DataBinder.Eval (Container.DataItem ,"Email") %></a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="8%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="性别">
                    <ItemTemplate><%#DataBinder.Eval (Container.DataItem ,"sex") %></ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="2%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="地区">
                    <ItemTemplate><%#DataBinder.Eval (Container.DataItem ,"Arear") %></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="6%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="个人简历">
                    <ItemTemplate><%#DataBinder.Eval (Container.DataItem ,"prontery") %></ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="15%" BorderWidth="1px" CssClass="STYLE6" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="注册日期">
                    <ItemTemplate><%#DataBinder.Eval (Container.DataItem ,"Zhuceriqi") %></ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" BorderWidth="1px" CssClass="STYLE6" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑会员">
                    <ItemTemplate>
                        <%--<a href="yhzhuce.aspx" title ="添加用户信息" target="_blank" class="STYLE10">添加</a> --%>
                        <a href="UpaterUser.aspx?UserID=<%#DataBinder.Eval (Container.DataItem ,"UserID")%>" title ="修改<%#DataBinder.Eval (Container.DataItem ,"Username") %>的个人信息" target="_blank" class="STYLE6">修改</a> 
                        <a href="EditUserPwd.aspx?UserID=<%#DataBinder.Eval (Container.DataItem ,"UserID")%>" title ="修改密码<%#DataBinder.Eval (Container.DataItem ,"Username") %>的个人信息" target="_blank" class="STYLE6">修改密码</a> 
                        <%--<a href ="DleeteUser.aspx?UserID=<%#DataBinder.Eval (Container.DataItem ,"UserID")%>" title="删除<%#DataBinder.Eval (Container.DataItem ,"Username")%>的个人信息" class ="STYLE9">删除</a>--%>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" BorderWidth="1px" />
                    <HeaderStyle HorizontalAlign="Center" BorderWidth="1px" Font-Size="Small" />
                </asp:TemplateField>
               <%-- <asp:TemplateField HeaderText ="删除用户" >
                    <ItemTemplate >
                        <asp:ImageButton  ID ="ImgButton1" runat ="server" ImageUrl="~/Images/delete.gif" CommandName ="delete"
                         CommandArgument ='<%#DataBinder .Eval (Container .DataItem ,"UserID") %>' />                 
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Center" Width ="2%" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>
    </form>
    </center>
</body>
</html>
