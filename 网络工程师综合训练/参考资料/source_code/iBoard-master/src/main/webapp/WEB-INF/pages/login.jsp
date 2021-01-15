<%--
  Created by IntelliJ IDEA.
  User: veve
  Date: 2020/7/28
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%@include file="base.jsp" %>
    <title>Title</title>
</head>
<body>
<div class="container is-fluid">
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="filed">
            <table class="table">
                Username:
            </table>

            <div class="controler">
                <input name="name" type="text" placeholder="Username!" class="input">
            </div>
        </div>
        <div class="filed">
            <table class="table">Password:</table>
            <div class="controler">
                <input class="input" name="password" type="text" placeholder="Password">
            </div>
        </div>
        <div class="field">
            <div class="control">
                <button class="button is-link is-light" type="submit" value="Submit">Submit</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
