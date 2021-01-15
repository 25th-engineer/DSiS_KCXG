<%--
  Created by IntelliJ IDEA.
  User: veve
  Date: 2020/7/23
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <%@include file="base.jsp" %>
</head>
<body>


<div class="container">
    <form action="${pageContext.request.contextPath}/account/save" method="post">
        <%--    <input type="text" name="content">--%>
        <div class="field">
            <label class="label">留言内容</label>
            <div class="control">
                <textarea class="textarea" name="content" placeholder="Please leave your please!"></textarea>
            </div>
        </div>
        <div class="field">
            <label class="label">昵称</label>
            <div class="control">
                <input class="input" type="text" name="author">
            </div>
        </div>
        <div class="field">
            <div class="control">
                <button class="button is-link is-light" type="submit" value="Submit">Submit</button>
            </div>
        </div>
    </form>
</div>


<c:set var="index" value="${fn:length(list)-1}"></c:set>


<div class="container">
    <%--    <div class="columns ">--%>


    <%--            <c:forEach items="${list}" var="account" varStatus="sta">--%>
    <%--                <div class="column is-full">--%>
    <%--                <div class="card">--%>
    <%--&lt;%&ndash;                    <header class="card-header ">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                        <p class="card-header-title">${account.author}</p>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                    </header>&ndash;%&gt;--%>


    <%--                    <div class="card-content">--%>
    <%--                        <div class="content">--%>
    <%--&lt;%&ndash;                                <strong>${account.author}</strong><br>&ndash;%&gt;--%>
    <%--                              <p class="title"> "${account.content}"</p>--%>
    <%--    <div class="container" align="right">--%>
    <%--        <p class="subtitle ">${account.author}</p>--%>
    <%--    </div>--%>

    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--&lt;%&ndash;                <br>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                <br>&ndash;%&gt;--%>
    <%--                </div>--%>
    <%--&lt;%&ndash;                ${account.content}:${account.author}<br>&ndash;%&gt;--%>
    <%--            </c:forEach>--%>
    <c:forEach items="${list}" var="account" varStatus="sta">
        <div class="column is-full">
            <div class="card">
                    <%--                    <header class="card-header ">--%>
                    <%--                        <p class="card-header-title">${account.author}</p>--%>
                    <%--                    </header>--%>
                <div class="card-content">
                    <div class="content">
                            <%--                                <strong>${account.author}</strong><br>--%>
                            <%--                        <p class="title"> ${list[index-sta.index].content}</p>--%>
                        <p class="title"> ${list[sta.index].content}</p>
                        <div class="container" align="right">
                                <%--                            <p class="subtitle ">${list[index-sta.index].author}</p>--%>
                            <p class="subtitle ">${list[sta.index].author}</p>
                        </div>
                    </div>
                </div>
            </div>
                <%--                <br>--%>
                <%--                <br>--%>
        </div>
        <%--                ${account.content}:${account.author}<br>--%>
    </c:forEach>


    <%--    </div>--%>


</div>


</body>
</html>
