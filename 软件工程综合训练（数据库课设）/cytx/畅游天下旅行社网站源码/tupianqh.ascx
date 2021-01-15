<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tupianqh.ascx.cs" Inherits="kongjian_tupianqh" %>
<table cellpadding="0" cellspacing="0"  style="width:960px;height:179px" >
        <tr >
            <td align="left" colspan="2"> 
                <div id="demo" style="overflow:hidden;width:960px;color:#CCFFFF;"> 
                <table cellpadding="0" cellspacing="0" border="0"> 
                    <tr>
                        <td id="demo1" valign="top" align="center"> 
                            <table cellpadding="0" cellspacing="0" border="0"> 
                                <tr align="left"> 
                                    <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                            <td>
                                                <a href="../news/XinwenInfo.aspx?Newid=<%# Eval("Newid")%>" target="_blank" ><img src='<%#@"../upload_files/"+Eval("picture") %>' width="180"  height="175" alt=""></a>
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
