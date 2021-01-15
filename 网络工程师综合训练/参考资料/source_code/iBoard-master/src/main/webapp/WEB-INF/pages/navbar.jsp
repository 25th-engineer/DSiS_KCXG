<%--
  Created by IntelliJ IDEA.
  User: veve
  Date: 2020/7/28
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
  全局导航栏
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="level is-mobile" style="margin:0.5em;">
    <div class="level-left">
        <div class="level-item">
            <p class="title">
                <a href="">iBoard</a>
            </p>
        </div>
    </div>


    <div class="level-right">

        <c:if test="${sessionScope.user==null}">
            <p class="level-item">
                <a class="button is-primary" href="${pageContext.request.contextPath}/user/register">
                    <strong>Sign up</strong>
                </a>
            </p>
            <p class="level-item">
                <a class="button is-light" href="${pageContext.request.contextPath}/user/login">
                    Log in
                </a>
            </p>
        </c:if>


        <c:if test="${sessionScope.user!=null}">
            <%--        已经登陆--%>
            <%--        ${sessionScope.user.name}--%>
            <div class="level-item navbar-item has-dropdown is-hoverable">
                <a class="navbar-link">
                        ${sessionScope.user.name}
                </a>
                <div class="navbar-dropdown">
                    <a class="navbar-item">
                        Profile
                    </a>
                    <a class="navbar-item" href="${pageContext.request.contextPath}/user/signout">
                        Sign out
                    </a>
                </div>
            </div>
        </c:if>
    </div>
</nav>
