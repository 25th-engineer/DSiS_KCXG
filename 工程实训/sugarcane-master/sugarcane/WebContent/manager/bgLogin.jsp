<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>甘蔗后台管理系统</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/bgLogin.css">
</head>
<body>
	<!--header-->	
	<h1>欢迎进入甘蔗管理系统</h1>
	
	
	<!--左侧名言-->
	<div class="first">
		<p>如果你无法简洁的表达你的想法，那只说明你还不够了解它。</p>
		<p>--阿尔伯特·爱因斯坦</p>
	</div>
	
	
	<!--登录框-->
	<div class="login">
		<form action="${ctx }/admin/login" method="post">
			<div>账号：<input type="text" value="单行输入" name="adminName" class="text"/></div>
			<div class="pw">密码：<input type="password" value="单行输入" name="password" class="text"/></div>
			<input type="submit" value="登录" class="submit"/>
		</form>
	</div>
	<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>