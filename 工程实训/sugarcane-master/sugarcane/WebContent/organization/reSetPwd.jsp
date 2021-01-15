<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>重置密码</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/orgStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/resetPwd.css">
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/yanzheng.js"></script>
    <script src="${ctx}/static/js/html5shiv.min.js"></script>
    <script src="${ctx}/static/js/home.js"></script>
</head>

<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg">
  <a href="#" id="login">登录</a>
</p>  
</div>
<!--分割线-->
<div><hr></div>
<!--内容-->
<!--body-->
 <div class="body">
    <!--标题-->
        <div class="body_top">
            <span>重置密码</span>
        </div>
    <!--表单-->
        <div class="body_bottom">
            <div class="form">
                <form action="" onsubmit="javascript:alert('重置成功！');">
                    <div class="reset">
                        <span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱&nbsp;：</span>
                        <div class="form_input">
                            <input type="email" name="email" placeholder="请输入正确的邮箱账号" id="checkemail" onchange="check_email()" required="required" />
                        </div>
                        <span id="mail"></span>
                    </div>
                    <div class="reset">
                        <span>旧&nbsp;密&nbsp;码&nbsp;：</span>
                        <div class="form_input">
                            <input type="text" placeholder="请输入旧密码" />
                        </div>
                    </div>
                    <div class="reset">
                        <span>新&nbsp;密&nbsp;码&nbsp;：</span>
                        <div class="form_input">
                            <input type="password" name="password" placeholder="密码长度为6-12位" id="password" />
                        </div>
                    </div>
                    <div class="reset">
                        <span>确认密码：</span>
                        <div class="form_input">
                            <input type="password" name="checkPWD" placeholder="密码长度为6-12位" id="checkPWD" onchange="check_password()" />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="确认重置"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

<!--footer-->    
<div id="footer">
     CopyRight© sugarcane <a href="#">联系我们</a>
</div>

</body>


</html>