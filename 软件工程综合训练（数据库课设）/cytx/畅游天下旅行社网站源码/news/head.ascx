<%@ Control Language="C#" AutoEventWireup="true" CodeFile="head.ascx.cs" Inherits="news_head" %>

   <table style ="width:100%; height:30px" cellpadding ="0" cellspacing="0">
               <tr style ="background-image:url(../Images/secondpage_01.jpg)">
                <td style ="width:5%;font-size:14px;font-weight:bold;" align ="left" ><a href="../news/index.aspx">首页</a></td>
                <td style="width:85%" align="left">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" Height="30px" Width="0%" RepeatColumns="20">
                        <ItemTemplate>
                            <a href ="NewsFenl.aspx?NewFl=<%#DataBinder.Eval(Container.DataItem, "NewFl")%>" style="font-size:14px;font-weight:bold;" title ="进入<%#DataBinder.Eval(Container.DataItem, "NewFl")%>的更多信息"><%#DataBinder.Eval(Container.DataItem, "NewFl")%> 
                            | </a>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="true" HorizontalAlign="Left"  />
                    </asp:DataList>
                </td>
                <td style="width:10%;font-size:14px;font-weight:bold;"><a href="../user/denglu.aspx">用户登录</a></td>
             </tr>
        </table>
        