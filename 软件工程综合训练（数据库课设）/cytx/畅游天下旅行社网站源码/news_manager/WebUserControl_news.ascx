<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl_news.ascx.cs" Inherits="user_WebUserControl"  %>
    <head>
    <title></title>
     <script src="../js/Morning_JS.js" type="text/javascript"></script>    
</head>
<body style="margin: 0px" onload="showTime();">
     <table style="width:970px;" cellpadding ="0" cellspacing="0">
        <tr>
            <td style="height :50px; width:100%; color:#507CD1; font-size:larger; font-weight:bold" align="left" >系统管理后台</td>
        </tr>
        <tr>
            <td style="width: 100%; height: 49px;">
                <table style="width:100%; height: 30px;" border ="0" cellpadding ="0" cellspacing="0" >
                     <tr style ="background-image:url(../Images/titleBg.jpg)">
                        <td style="width :80%;height:24px;" align ="left" valign ="middle">
                            <a href="../news/index.aspx"style ="color :White; font-size:small; font-weight:600; text-decoration:none" target="_blank"  >首页 | </a>
                            <a href="../user/denglu.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" target="_blank" >用户登陆 | </a>
                            <a href= "chaxun.aspx" style ="color :White;font-size:small;font-weight:600; text-decoration:none" target="_blank" >用户查询 | </a>
                            <a href="manager.aspx" style ="color :White;font-size:small;font-weight:600; text-decoration:none" target="_blank" >编辑发布信息 | </a>
                            <a href ="upload_news.aspx" style ="color :White;font-size:small; text-decoration:none;font-weight:600;" target="_blank" >新闻发布 | </a>
                            <a href="new_Fl.aspx" style ="color :White;font-size:small;font-weight:600;text-decoration:none;font-weight:600;" target="_blank" >添加类别 | </a>
                            <a href ="News_index.aspx" style ="color :White;font-size:small;font-weight:600; text-decoration:none;" target="_blank" >新闻浏览 | </a>
                            <a href ="../error.aspx" style ="color :White;font-size:small;font-weight:600; text-decoration:none"  target="_blank" >论坛管理 | </a>
                            <a href="../error.aspx"style ="color :White;font-size:small;font-weight:600; text-decoration:none" target="_blank">修改密码 |</a>
                             <a href="../user/LoginOut.aspx"style ="color :White;font-size:small;font-weight:600; text-decoration:none">安全退出 |</a>
                            </td>
                            
                        <td style ="width:20%;color :White;font-size:small;" align="right"> <script type="text/javascript">getDate();</script> <span id="ShowTime"></span></td>

                    </tr>
                </table>
            </td>
        </tr>
     </table>
     </body>
