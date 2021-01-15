<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">留言板</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/login">登录</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/add">添加用户</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users-1">查看所有用户</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/loginout">退出</a></li>
            </ul>
        </div>
    </div>
</nav>