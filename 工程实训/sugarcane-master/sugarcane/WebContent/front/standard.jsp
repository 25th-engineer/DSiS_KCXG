<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
</head>
<body>
<div class="overall">
<!--header-->
    <div class="header">
    <!--logo-->
    	<div class="logo">
            <img src="${ctx }/static/frontimages/b3.png">
        </div>
    <!--首页选项卡-->
        <div class="home">
        	<a href="home.html">首页</a>
        </div>
    <!--全部课程选项卡-->
        <div class="allclass">
        	<a href="allclass.html">全部课程</a>
        </div>
    <!--搜索框-->
        <div class="sousuo">
			<form> 
                <div class="s_img">
                    <a href="${ctx }/front/search.jsp">搜索 <img src="${ctx }/static/frontimages/sousuo.png"></a> 
                </div>
            </form>
	    </div>
    <!--用户注册登录-->
        <div class="login_regist">
        	<a href="userLogin.html">登录/注册</a>
        </div>
    <!--培训机构登录-->
        <div class="org_login">
        	<a href="orgLogin.html">培训机构登录</a>
        </div>
    </div>
<!--body-->
    <div class="body"></div>
<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</div>
</body>
</html>