<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload_news.aspx.cs" Inherits="user_Default" ValidateRequest ="false" %>
<%@ Register src="WebUserControl_news.ascx" tagname="WebUserControl_news" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>���ŷ���ϵͳ---�����ϴ�</title>
    <link href="../CSS/StyleSheet.css"type="text/css" rel ="Stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<center>
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
    <div>
      <uc1:WebUserControl_news ID="WebUserControl_news1" runat="server" />
      <table  cellspacing="0" cellpadding="0" border ="1px" style="width:970px;">
        <tr>
            <td style="width: 100px; height: 30px;" align ="right"  class="STYLE6" > ѡ����ͼƬ��</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <input type="file" name="File" style="width: 697px; height: 30px"/>*</td>
        </tr>
        <tr>
            <td style="width: 100px; height: 30px;" align ="right" class="STYLE6" >���ű��⣺</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:TextBox ID="TextBox3" runat="server" Width="700px"></asp:TextBox>*</td>
        </tr>
        <tr>
            <td style="width: 100px; height: 30px;" align ="right" class="STYLE6"  >���ߣ�</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:TextBox ID="TextBox1" runat="server" Width="700px"></asp:TextBox>*</td>
        </tr>
        <tr>
            <td style="width: 100px; height: 30px;" align ="right" class="STYLE6"  >���Ÿ����⣺</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:TextBox ID="TextBox2" runat="server" Width="700px"></asp:TextBox>*</td>
        </tr>
        <tr>
            <td align="right" class="STYLE6" style="width: 100px; height: 30px;">
                ͨѶ�磺</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:TextBox ID="TextBox4" runat="server" Width="700px"></asp:TextBox>*</td>
        </tr>
        <tr>
            <td align="right" class="STYLE6" style="width: 100px; height: 30px;">
                ��ע��</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:TextBox ID="TextBox5" runat="server" Width="700px"></asp:TextBox>*</td>
        </tr>
        <tr>
            <td align="right" class="STYLE6" style="width: 100px; height: 30px;">
                ѡ�����</td>
            <td style="width: 870px; height: 30px; color: red;" align ="left">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                *&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 30px;" align ="right"  class="STYLE6"   >�������ݣ�</td>
            <td style="width: 870px; height: 84px;" align ="left" class="STYLE6">
            <input type="hidden" id="content1" name="content1" runat="server" style="width: 870px" />
            <iframe id="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=content1&style=coolblue" frameborder="0" scrolling="no" width="870px" height="350" style="width:870px; height: 539px"></iframe></td>
        </tr>
    </table>
               <asp:Button ID="Submit1"  Text="��ʼ�ϴ�" runat ="server" OnClick="Submit1_Click1"/>
    <asp:Button ID="Button2" runat="server" Text="�˳�" onclick="Button2_Click" Width="119px" /></div>
        </form>
      </center>
</body>
</html>
