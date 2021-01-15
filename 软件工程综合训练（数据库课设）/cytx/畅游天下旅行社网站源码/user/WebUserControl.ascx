<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="user_WebUserControl"  %>
     <head>
    <title></title>
     <script src="../js/Morning_JS.js" type="text/javascript"></script>    
</head>
<body style="margin: 0px" onload="showTime();">
     <table style="width:970px;" cellpadding ="0" cellspacing="0">
        <tr>
            <td style="height :50px; width:970px; color:#507CD1; font-size:larger; font-weight:bold" >系统管理后台</td>
        </tr>
        <tr>
            <td style="width: 970px; height: 49px;">
                <table style="width:100%; height: 30px;" border ="0" cellpadding ="0" cellspacing="0" >
                     <tr style ="background-color:#507CD1">
                        <td style="width :80%;height:24px;" align ="left" valign ="middle">
                            <a href="../news/index.aspx" style ="font-family:Arial; color :White; font-size:small;font-weight :bold; text-decoration:none" >首页 | </a>
                            <a href= "chaxun.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold">用户查询 | </a>
                            <a href="yhzhuce.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold">用户注册 | </a>
                            <a href="../news_manager/manager.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >编辑发布信息 | </a>
                            <a href ="../news_manager/upload_news.aspx"style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >新闻发布 | </a>
                            <a href ="../news_manager/new_Fl.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >添加类别 | </a>
                            <a href ="../error.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >论坛管理 | </a>
                            <a href ="SelectUser.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >用户管理 | </a>
                            <a href="/EditUserPwd.aspx" style ="font-family:Arial; color :White;font-size:small; text-decoration:none; font-weight:bold" >修改密码 | </a>
                            </td>
                            <td style ="width:20%; font-size:small ;" align ="left" >
                               <script type="text/javascript">getDate();</script> <span id="ShowTime"></span>
                         </td>
                    </tr>
                </table>
            </td>
        </tr>
     </table>
     </body>
