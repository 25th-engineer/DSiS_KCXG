<%--
  Created by IntelliJ IDEA.
  User: veve
  Date: 2020/7/23
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="base.jsp" %>
    <title>Success</title>
</head>
<body>

<c:set var="direct" value="${pageContext.request.contextPath}/message/getAll"></c:set>
<c:if test="${sessionScope.directAfterDone!=null}">
    <c:set var="direct" value="${sessionScope.directAfterDone}"></c:set>
    <%--    direct有值--%>
</c:if>

<script>
    setTimeout("javascript:location.href='${direct}'", 3000);
</script>

<section class="hero is-success is-fullheight">
    <!--    &lt;!&ndash; Hero head: will stick at the top &ndash;&gt;-->
    <!--    <div class="hero-head">-->

    <!-- Hero content: will be in the middle -->
    <div class="hero-body">
        <div class="container has-text-centered">
            <h1 class="title">
                ${msg}
            </h1>
            <h2 class="subtitle">
                即将自动跳转到之前的页面或<a href="${direct}">立即跳转</a>
            </h2>
        </div>
    </div>
    <!-- Hero footer: will stick at the bottom -->
    <!--    <div class="hero-foot">-->
</section>


<%--<h1>执行成功</h1>--%>
<%--<h1 align="center">${msg}</h1>--%>
<%--<h5>即将自动跳转到之前的页面或<a href="${direct}">立即跳转</a></h5>--%>
</body>
</html>
