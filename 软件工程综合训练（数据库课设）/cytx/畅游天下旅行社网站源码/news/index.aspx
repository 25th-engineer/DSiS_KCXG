<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="news_index" %>

<%@ Register src="../tupianqh.ascx" tagname="tupianqh" tagprefix="uc1" %>

<%@ Register src="../floot.ascx" tagname="floot" tagprefix="uc2" %>

<%@ Register src="../yqlianjie.ascx" tagname="yqlianjie" tagprefix="uc3" %>
<%@ Register src="head.ascx" tagname="head" tagprefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>华坪民族旅游网</title>
    <meta name="description" content="华坪民族网，内容包括民族风情、地方特色、地方资源。" />
    <meta content="华坪,民族,旅游,电站,攀枝花,船房,华坪县,乌木河" name="keywords" />
    <link href="../CSS/css.css" rel="stylesheet" type="text/css" />
    <script src="../js/Morning_JS.js" type="text/javascript"></script> 
</head>
<body onload="showTime();">
    <form id="form1" runat="server">
    <div id="box">
    <%-- 头部内容开始--%>
      <div id="head">
         <div class="head"><a href="#" target="_blank"><img src="../Images/512.jpg" border="0"></a></div>
      </div>
      <div id="fenlei">
          <uc5:head ID="head2" runat="server" />
        </div>
    
    <%-- 头部内容结束--%>
      <div id="xinxi">欢迎您光临华坪民族旅游网主页 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                   <asp:Label ID="Count" runat="server">当前在线&nbsp;<font color="red"><%=Application["Count"]%></font>&nbsp;人</asp:Label> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的IP：<asp:Label ID="IP" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<script type="text/javascript">getDate();</script><span id="ShowTime"></span></div>
      <%--主体工作开始--%>
    <div id="zbigbody">
      <%--左边开始--%>
       <div id="left">
           <div class="leftbottom">
             <div class="lefttitle">&nbsp;<span class="biaoti1">公告</span></div>
          <div id="leftnews">
          <marquee direction="up"onmouseover="this.stop()" onmouseout="this.start()">
            <asp:GridView ID ="GridView7" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                    <Columns >
                        <asp:TemplateField>
                            <ItemTemplate>
                                ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>
                            </ItemTemplate>
                            <ItemStyle CssClass ="STYLE13" Height="25px" />
                        </asp:TemplateField>
                    </Columns>
              </asp:GridView></marquee>
          </div>
       
       </div>
          <div class="leftbottom">
             <div class="lefttitle">&nbsp;<span class="biaoti1">信息排行榜</span></div>
          
            <div class="leftnews">
            
                 <asp:GridView ID ="GridView1" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1%>.
                                        </ItemTemplate>
                                        <ItemStyle CssClass ="STYLE13" Width="1%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13" title ="<%#DataBinder.Eval (Container.DataItem ,"Title") %>"><%# Fun.CutStr ( DataBinder.Eval (Container.DataItem,"Title").ToString (),27) %></a>
                                        </ItemTemplate>
                                        <ItemStyle CssClass ="STYLE13" Height="25px" />
                                    </asp:TemplateField>
                                </Columns>
                          </asp:GridView>
            
            </div>
           </div>
            <%--第二块开始--%>
            <div class="leftbottom">
             <div class="lefttitle">&nbsp;<span class="biaoti1">旅游常识</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          
            <div class="leftnews">
            
                <asp:GridView ID ="GridView2" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a><%--[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]--%>
                                        </ItemTemplate>
                                        <ItemStyle Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
            
            </div>
           </div>
            <%--第二块结束--%>
            </div>
          </div>
       <%--左边结束--%>
         <%--右边开始--%>
       
         <div id="right"> 
            
           <%-- 模块一--%>
            <div class="dyzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">精品线路</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=精品线路" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                       <asp:GridView ID ="GridView3" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" ShowFooter="false">
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle  Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                     
                  </div>
               </div>
               
               <div class="ylzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">景点介绍</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=景点介绍" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                    <asp:GridView ID ="GridView4" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle  Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                  
                  </div>
               </div>
               <%--加大行间距--%>
               
               <div class="jianju"></div>
               
               <div class="dyzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">芒果之乡</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=芒果之乡" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                 <asp:GridView ID ="GridView5" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" ><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle  Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
               
                  </div>
               </div>
               
               <div class="ylzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">民族风情</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=民族风情" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                 <asp:GridView ID ="GridView6" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                
                  </div>
               </div>
                <%--加大行间距--%>
               
               <div class="jianju"></div>
               
               <div class="dyzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">华坪资源</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=华坪资源" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                 <asp:GridView ID ="GridView9" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" ><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle  Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
               
                  </div>
               </div>
               
                <div class="ylzt">
              <div class="lefttitle">&nbsp;&nbsp;<span class="biaoti1">华坪特色</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="small"><a href="NewsFenl.aspx?NewFl=民族风情" target="_blank">MORE&nbsp;>></a></span>
              </div>
              <div class="leftnews">
                 <asp:GridView ID ="GridView8" runat ="server" AutoGenerateColumns="false" Width="100%" BorderStyle="None"  GridLines="None" ShowHeader="false" >
                                <Columns >
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                              ·<a href ="XinwenInfo.aspx?NewID=<%#DataBinder.Eval(Container.DataItem, "NewID")%>" target="_blank" class="STYLE13"><%#Fun.CutStr( DataBinder.Eval(Container.DataItem, "Title").ToString(),40)%></a>[<%#DataBinder.Eval(Container.DataItem, "AddTime")%>]
                                        </ItemTemplate>
                                        <ItemStyle Height ="25px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                
                  </div>
               </div>
               
         </div>
         <%--右边结束--%>
          <%--加大行间距--%>
               <div class="jianju2"></div>
               <div class="jiange"><span class="biaoti1">图片欣赏</span></div>
         <div class="tupianbottom"> <uc1:tupianqh ID="tupianqh1" runat="server" /> </div>
         <%--加大行间距--%>
               
               <div class="jianju"></div>
               <div class="floot">
                   <uc3:yqlianjie ID="yqlianjie1" runat="server" />
        </div>
               
               <%--加大行间距--%>
               
               <div class="jianju"></div>
          <div class="floot">
              <uc2:floot ID="floot1" runat="server" />
        </div>
    </div>
    
    <%--主体工作结束--%>
    </form>
</body>
</html>
