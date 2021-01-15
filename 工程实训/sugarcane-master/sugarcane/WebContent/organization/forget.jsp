<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link href="${ctx}/static/css/forget.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/jquery-1.9.0.min.js"></script>
 <script type="text/javascript" src="${ctx}/static/frontjs/yanzheng.js"></script>
    <script src="${ctx}/static/frontjs/html5shiv.min.js"></script>
    <script src="${ctx}/static/frontjs/home.js"></script>
</head>

<body>
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
        <!--通过邮箱找回-->
            <div class="tip"><span>通过绑定的邮箱找回密码</span></div>
        <!--表单-->
            <div class="body_form">
                <form action="${ctx}/sellerInfo/forget.do">
                <!--单行文本框-->
                    <div class="form_text">
                        <span>邮箱号：</span>
                        <input type="email" name="email"  id="forget_email" onchange="check_email()" required="required">
                    </div>
                <!--按钮-->
                    <div class="button">
                        <input type="submit" id="btns" value="发送到验证邮箱" />
                    </div>
                </form>
            </div>
        <!--返回登录-->
           <div class="return_login">
               <a href="login.html">返回登录&gt;</a>
           </div> 
        </div>


<!--footer-->    
<div id="footer">
     CopyRight© sugarcane <a href="#">联系我们</a>
</div>
</body>


</html>