<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage2.aspx.cs" Inherits="UserManage2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>用户信息管理平台</title>
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
        obj.style.backgroundColor = "#B9D1F3";     
    }
    </script>
</head>
<body style="font-size: 12pt">
<center>
    <form id="form1" runat="server">
    <div>
        <span>
        <span style="font-size: 14pt">用户信息管理平台:</span><br />
        </strong><span>
            <br />
            <table style="font-size: 11pt">
                <tr>
                    <td >请输入你要查询的条件</td>
                    <td> <asp:TextBox ID ="TextBox1" runat ="server"></asp:TextBox></td>
                    <td ><asp:Button ID ="Button1" runat ="server" Text ="提交" Height="27px" OnClick="Button1_Click" Width="57px"/></td>
                </tr>
            </table>
            <br />
            
        </span>
        <center >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="False" Width ="970px" CellPadding="4"  
            OnRowCommand="GridView1_RowCommand" Height="174px" OnRowDeleting="GridView1_RowDeleting" 
            ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound"
             AllowPaging="true" PageSize ="15" ShowFooter="true">
            
            <Columns>
                 <asp:TemplateField HeaderText ="自动编号" FooterText ="自动编号">
                    <ItemTemplate >
                        <%#Container .DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Center" Width ="3%" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
            
                <asp:TemplateField HeaderText ="用户编号" FooterText ="用户编号">
                    <ItemTemplate >
                        <%#DataBinder .Eval (Container .DataItem,"UserID") %>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Center" Width ="4%" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
                
                <asp:TemplateField  HeaderText ="用户名称" FooterText ="用户名称">
                    <ItemTemplate >
                        <a href ='EditUserName2.aspx?UserID=<%#DataBinder .Eval (Container .DataItem ,"UserID") %>'>
                        <%#DataBinder .Eval (Container .DataItem ,"UserName") %></a>
                    </ItemTemplate>
                    <ItemStyle  Width ="5%" HorizontalAlign ="Center" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText ="联系地址">
                    <ItemTemplate >
                        <%#DataBinder .Eval (Container .DataItem ,"email") %>
                    </ItemTemplate>
                    <ItemStyle  Width ="12%" HorizontalAlign ="Center" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText ="Email地址">
                    <ItemTemplate >
                        <a href = 'mailto:<%#DataBinder .Eval (Container .DataItem ,"Email")  %>'>
                        <%#DataBinder .Eval (Container .DataItem ,"Email") %></a>
                    </ItemTemplate>
                    <ItemStyle  Width ="10%" HorizontalAlign ="Center" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText ="删除用户" >
                    <ItemTemplate >
                        <asp:ImageButton  ID ="ImgButton1" runat ="server" ImageUrl="~/Images/delete.gif" CommandName ="delete"
                         CommandArgument ='<%#DataBinder .Eval (Container .DataItem ,"UserID") %>' />                 
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign ="Center" Width ="5%" BorderWidth="1px"/>
                    <HeaderStyle  HorizontalAlign ="Center"/>
                </asp:TemplateField>
                
            </Columns>
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <RowStyle BackColor="#EFF3FB" BorderColor="Gray" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <PagerSettings Mode="NextPreviousFirstLast" />
                <PagerSettings Visible ="false" />
            
            </asp:GridView>
            </center>
            <center >
          <table style="width: 483px; height: 16px; font-size: medium;" >
                <tr>
                    <td align="center" style="height: 25px; width: 1294px; font-size: small;">
                        <asp:LinkButton ID="btnFirst" OnClick="PagerButtonClick1" runat="server" Font-Overline="false">首 页</asp:LinkButton>
                        <asp:LinkButton ID="btnPrev"  OnClick="PagerButtonClick2" runat="server" Font-Overline ="false">上一页  </asp:LinkButton>
                        <asp:LinkButton ID="btnNext"  OnClick="PagerButtonClick3" runat="server" Font-Overline="false">下一页</asp:LinkButton>
                        <asp:LinkButton ID="btnLast"  OnClick="PagerButtonClick4" runat="server" Font-Overline="false">尾 页</asp:LinkButton>
                        <asp:Label ID="LblCurrentIndex" runat="server"></asp:Label>
                        <asp:Label ID="LblPageCount" runat="server"></asp:Label>
                        <asp:Label ID="LblRecordCount" runat="server"></asp:Label>
                   </td>
                </tr>

        </table>
        </center>
            <br />
            <asp:Button ID ="Buton1" runat ="server" Text ="注册新用户" Height="25px" OnClick="Buton1_Click" Width="102px" Font-Size="Smaller"  />
            <br />
    </form>
    </center>
</body>
</html>
