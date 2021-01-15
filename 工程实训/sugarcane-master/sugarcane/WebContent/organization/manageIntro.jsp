<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>培训机构管理简介</title>
<link href="${ctx}/static/css//manageIntro.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.9.0.min.js"></script>

</head>
<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg">
  <a href="#" id="exit">退出登录</a>
   <a href="#"><img src="${ctx}/static/images/exit.png" id="exitimg"></a>
  <a href="#" id="jgName">${sellerLogin.sellerLoginName}</a></p>  
</div>
<!--分割线-->
<div><hr></div>
<!--内容-->
<div id="content">
<div id="out">
    <div id="list">
     <div class="a1 lefta selecteda"><a href="${ctx }/organization/manageIntro.jsp" class="selecteda leftb">○&nbsp;管理简介</a></div>
     <div class="a1 lefta"><a href="${ctx}/sellerInfo/sellerFindCourse?sellerID=${sellerLogin.sellerID}" class="leftb">○&nbsp;管理分类</a></div>
     <div class="a1 lefta"><a href="../course/listCourse?coursePageIndex=1&sellerID=${sellerLogin.sellerID }"class="leftb">○&nbsp;管理课程</a></div>  
     </div><!--list-->
    <!-- 简介内容 -->
    <div  class="top" align="center">
		<div>
			<form action="${ctx}/sellerInfo/updatebrief.do" method="post">
				<table>
					<tr><p class="title">简介</p></tr>
					<tr><!-- 原简介本身更改 -->
						<td><div><textarea class="form-control" cols="95" rows="20" placeholder="请输入您的机构简介" name="brief">${breif }</textarea></div></td>
					</tr>
				</table>
				<div>
					<button class="button" type="submit"><span><a style="font-size:13px" href="#">保存</a></span></button>
					
				</div>		
			</form>
		</div>
		<br>
	</div>
<!--footer-->    
<div id="footer">
     CopyRight© sugarcane <a href="#">联系我们</a>
</div>

</body>
