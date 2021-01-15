<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yhzhuce.aspx.cs" Inherits="user_zhuce2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../StyleSheet.css" type ="text/css" rel ="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center >
        <table style ="width:571px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 50px">&nbsp</td>
                <td align="center" class ="AAC">用户注册</td>
        <%--        <td style="width :244px;height :50px; background-image:url(Images/5555.jpg); background-repeat:no-repeat; background-position:center"></td>
        --%>        <td style="height: 50px">&nbsp</td>
            </tr>
            <tr>
                <td style ="width:160px" align ="right"><span class ="STYLE6">用户名称：</span></td>
                <td style="height :20px; width: 248px;" align="center">
                   <asp:TextBox ID ="name" runat ="server" Width="98%"></asp:TextBox></td>
                <td align ="left" class ="STYLE6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="名称不能为空" ErrorMessage="RequiredFieldValidator" ControlToValidate="name"></asp:RequiredFieldValidator>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">用户密码：</span></td>
                <td style="height :20px; width: 248px;" align="center">
                <asp:TextBox ID ="TextBox1" runat ="server" Width="98%" TextMode="Password"></asp:TextBox></td>
                <td align ="left" class ="STYLE6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="密码不能为空" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">密码确认：</span></td>
                <td style="height :20px; width: 248px;" align="center"><asp:TextBox ID ="TextBox2" runat ="server" Width="98%" TextMode="Password"></asp:TextBox></td>
                <td align ="left" class ="STYLE6">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Text ="两次输入的密码不一致" ControlToCompare="TextBox1" ControlToValidate="TextBox2"></asp:CompareValidator>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">电子邮件：</span></td>
                <td style="height :20px; width: 248px;" align="center"><asp:TextBox ID ="TextBox3" runat ="server" Width="98%"></asp:TextBox></td>
                <td>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px; height: 30px;" align ="right"><span class ="STYLE6">性别：</span></td>
                <td style="width: 248px;" align="left">
                    <asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal" 
                        Font-Size="Smaller" Height="16px" Width="40%" style="font-size: small">
                          <asp:ListItem>女</asp:ListItem>
                          <asp:ListItem>男</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px; height: 19px;" align ="right"><span class ="STYLE6">出生年月：</span></td>
                <td style="height :19px; width: 248px; text-align:left;" align="center">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="61px">
                    <asp:ListItem>1969</asp:ListItem>
                    <asp:ListItem>1970</asp:ListItem>
                    <asp:ListItem>1971</asp:ListItem>
                    <asp:ListItem>1972</asp:ListItem>
                    <asp:ListItem>1973</asp:ListItem>
                    <asp:ListItem>1974</asp:ListItem>
                    <asp:ListItem>1975</asp:ListItem>
                    <asp:ListItem>1976</asp:ListItem>
                    <asp:ListItem>1977</asp:ListItem>
                    <asp:ListItem>1978</asp:ListItem>
                    <asp:ListItem>1979</asp:ListItem>
                    <asp:ListItem>1980</asp:ListItem>
                    <asp:ListItem>1981</asp:ListItem>
                    <asp:ListItem>1982</asp:ListItem>
                    <asp:ListItem>1983</asp:ListItem>
                    <asp:ListItem>1984</asp:ListItem>
                    <asp:ListItem>1985</asp:ListItem>
                    <asp:ListItem>1986</asp:ListItem>
                    <asp:ListItem>1987</asp:ListItem>
                    <asp:ListItem>1988</asp:ListItem>
                    <asp:ListItem>1989</asp:ListItem>
                    <asp:ListItem>1990</asp:ListItem>
                    <asp:ListItem>1991</asp:ListItem>
                    <asp:ListItem>1992</asp:ListItem>
                    <asp:ListItem>1993</asp:ListItem>
                    <asp:ListItem>1994</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                    <asp:ListItem>1986</asp:ListItem>
                    <asp:ListItem>1997</asp:ListItem>
                    <asp:ListItem>1998</asp:ListItem>
                    <asp:ListItem>1999</asp:ListItem>
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    </asp:DropDownList>
                    <span style="font-size: 10pt">年</span><asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <span style="font-size: 10pt">月</span><asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList><span style="font-size: 10pt">日</span></td>
                <td style="height: 19px">&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">联系方式：</span></td>
                <td style="height :20px; width: 248px;" align="center"><asp:TextBox ID ="TextBox4" runat ="server" Width="97%"></asp:TextBox></td>
                <td>&nbsp</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">所在地区：</span></td>
                <td style="height :20px; width: 248px;" align="center">
                    <asp:DropDownList ID="DropDownList4" runat="server" Width="100%">
                    <asp:ListItem>云南</asp:ListItem>
                    <asp:ListItem>曲靖</asp:ListItem>
                    <asp:ListItem>宣威</asp:ListItem>
                    <asp:ListItem>格宜</asp:ListItem>
                    <asp:ListItem>大兴</asp:ListItem>
                    <asp:ListItem>大理</asp:ListItem>
                    <asp:ListItem>玉溪</asp:ListItem>
                    <asp:ListItem>怒江</asp:ListItem>
                    </asp:DropDownList></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table  style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td style="width:161px" align ="right"><span class ="STYLE6">个人简历：</span></td>
                <td style="height :20px; width: 248px;" align="center"><asp:TextBox ID ="TextBox5" runat ="server" Width="98%" Height="205px" TextMode="MultiLine"></asp:TextBox></td>
                <td>&nbsp</td>
            </tr>
        </table>
        <table style ="width:571px" border="0" cellpadding="0" cellspacing="0" >
           <tr>
                 <td style="width: 160px; height: 50px;">&nbsp;</td>
                <td style ="width:200px">
                <asp:Button ID ="button1" runat ="server" Text ="提交" OnClick="button1_Click" />
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID ="button2" runat ="server" Text ="清空" OnClick="button2_Click" />
                </td>
            <td>&nbsp;</td>
           </tr> 
        </table>
        </center>
    </div>
    </form>
</body>
</html>
