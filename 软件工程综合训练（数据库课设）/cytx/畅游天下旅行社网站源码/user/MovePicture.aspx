<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovePicture.aspx.cs" Inherits="user_Default2" %>

<%@ Register src="WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href = "../CSS/StyleSheet.css" ="text/css" rel ="Stylesheet" />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <uc1:WebUserControl ID="WebUserControl1" runat="server" />
    <center>
    <table cellpadding="0" cellspacing="0"  style="width:970px;height:100px" border="1px">
        <tr >
            <td align="left" colspan="2"> 
                <div id="demo" style="overflow:hidden;width:968px;color:#ffffff;"> 
                <table cellpadding="0" cellspacing="0" border="0"> 
                    <tr>
                        <td id="demo1" valign="top" align="center"> 
                            <table cellpadding="0" cellspacing="0" border="0"> 
                                <tr align="left"> 
                                    <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                            <td>
                                                <a href="../news/XinwenInfo.aspx?Newid=<%# Eval("Newid")%>" target="_blank" ><img src='<%#@"../upload_files/"+Eval("picture") %>' width="180"  height="180" alt="" class ="Image1"></a>
                                            </td>
                                     </ItemTemplate>
                                     </asp:Repeater>
                                </tr> 
                            </table> 
                        </td> 
                        <td id="demo2" valign="top">
                        </td> 
                    </tr> 
                </table> 
                </div> 
                    <script language ="javascript" type ="text/javascript"> 
                        var speed=10//速度数值越大速度越慢 
                        demo2.innerHTML=demo1.innerHTML 
                        function Marquee(){ 
                        if(demo.scrollLeft<=0) 
                        demo.scrollLeft+=demo2.offsetWidth 
                        else{ 
                        demo.scrollLeft-- 
                        } 
                        } 
                        var MyMar=setInterval(Marquee,speed) 
                        demo.onmouseover=function() {clearInterval(MyMar)} 
                        demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 
                    </script>
            </td>
         </tr>
   </table>
   
   </center>
    </form>
    </center>
</body>
</html>
