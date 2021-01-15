<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>甘蔗后台首页</title>
<meta charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/bgstyle.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/background.css">
</head>
<body>
	<div class="header">
		<a href="${ctx }/admin/logoff">退出</a>
		<P>${adminLogin.adminName }</p>
	</div>
	<div class="body">
		<div class="left">
			<ul class="option">
				<li><a href="${ctx }/manager/bgUser.jsp">用户管理</a></li>
				<li><a href="${ctx }/manager/bgCompany.jsp">培训机构管理</a></li>
			</ul>
		</div>
		<div class="right">
			<h1>欢迎来到后台</h1>
			<img src="${ctx }/static/frontimages/background.jpg" alt="cat" class="cat"/>
		</div>
	</div>
<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>