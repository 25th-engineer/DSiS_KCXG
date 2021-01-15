<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查询是否通过审核</title>
<link href="${ctx}/static/css/passed.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/static/js/jquery-1.9.0.min.js"></script>
</head>
<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg"> 
  <a id="exit">退出登录</a>
  <a href="#"><img src="${ctx}/static/images/exit.png" id="exitimg"></a>
 
</p>  
</div>
<div><hr/></div>

<!--内容-->
<div id="content">
<div id="out">
<form action="${ctx}/sellerInfo/pass.do " method="post">
		<div id="table1">
		
		<table>
			<tr>
			  <td class="td1">邮&nbsp;&nbsp;箱:</td>
			  <td><input type="text" class="input1" name="email" /></td></tr>
			<tr>
			  <td class="td1">机构名称:</td>
			  <td><input type="text" class="input1" name="name"/></td></tr>
		</table>
		
		</div><!--table1-->
  
	<div id="chaxun">
	<a href="#">
	<input type="submit" value="查询" class="chaxun"/>
	</a>
	</div>

</form>

</div><!--out-->
</div><!--content-->

<div id="footer">
     ©CopyRight sugarcane <a href="#">联系我们</a>
</div><!--footer-->

</body>

</script>
</html>