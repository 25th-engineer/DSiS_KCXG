<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta charset="utf-8"> 
<title>培训机构登录</title> 
</head>
<!-- Theme style  -->
<link rel="stylesheet" href="${ctx}/static/css/orgLogin.css">
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />


<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg">
</p>  

</div>
<!-- 分割线 -->
<div><hr></div>
<!-- 内容 -->
<div id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(${ctx}/static/images/bgimg.jpg);margin:2%;background-size:contain">
<div>
	<!-- 登录框 -->
	<div id="login">
			<br><br><br><br><br>
		
			<form action="${ctx }/sellerLogin/login" method="post">
				<div id="words">
					<div align="center">
						<label for="username">登录名:</label>
						<input type="text" class="form-control" name="username">
					</div><br>
					<div align="center">
						<label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
						<input type="password" class="form-control" name="password">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${information!=null}">
						<span>${information}</span>
					</c:if>
					<br>
					<div align="center">
						<button class="button" type="button"><span><a href="${ctx}/organization/orgRegist.jsp">注册</a></span></button>
						<button class="button" type="submit"><span>登录</span></button>
					</div>
				</div>
			</form>
			<div id="cfoot">
			<a href="${ctx}/organization/passed.jsp" >查询审核</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${ctx}/organization/forget.jsp" >忘记密码</a>
			</div>
	</div><!--login-->
</div> 
<div id="footer" style="background-color:#9ACD32;clear:both;text-align:center">
CopyRight© sugarcane <a href="#">联系我们</a></div>
</div>
</body>

</html>