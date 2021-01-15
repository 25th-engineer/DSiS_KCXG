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
    <title>iBoard</title>
    <%@include file="base.jsp" %>
</head>
<body>

<script>
    function likes() {

    }
</script>

<%@include file="navbar.jsp" %>

<div class="container is-fluid">
    <div class="container">
        <%--        <form action="${pageContext.request.contextPath}/message/save" method="post" id="submitform">--%>
        <form action="" method="post" id="submitform" onsubmit="return false">
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
            <input type="hidden" name="id" value="-1">
            <div class="field">
                <div class="control">
                    <button class="button is-link is-light" type="submit" onclick="submitAjax()" value="Submit">Submit
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>


<c:set var="index" value="${fn:length(list)-1}"></c:set>

<%--<button onclick="testButton()">TestButton</button>--%>

<div class="container" id="mlist">


    <%-- Ajax请求完成 显示   --%>
    <div class="column is-full" id="ajaxCard">
        <div class="card">
            <div class="fluid" style="float: right;margin: 1em;">
                <a class="delete" onclick="deleteAjax(this)"></a>
            </div>
            <div class="card-content">
                <div class="content">
                    <p class="title" id="ajaxConten"> AjaxSubmit</p>
                    <nav class="level is-mobile">
                        <div class="level-left">
                            <div class="level-item has-text-centered">
                                          <span style="margin-right: 10px" onclick="likesClick(this)">
                                         <img src="${pageContext.request.contextPath}/img/favorite_border-24px.svg"
                                              onmouseover="hover(this)" onmouseout="unhover(this)" class="myfloat">
                                        <div class="myfloat  is-hidden ">0</div>
                                    </span>
                            </div>
                            <div class="level-item has-text-centered" style="margin-left: 1em">
                                <div class="myfloat" align="left" id="ajaxDate">8秒前</div>
                            </div>
                        </div>
                        <div class="level-right">
                            <div class="level-item has-text-centered">
                                <strong style="float: right;" align="right" id="ajaxAuthor">test</strong>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <%--Ajax请求显示 结束--%>
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
            <div class="column is-full" cardid="${list[sta.index].id}">
                <div class="card">

                    <div class="fluid" style="float: right;margin: 1em;">
                            <%--                    <a class="delete"--%>
                            <%--                       href="${pageContext.request.contextPath}/message/deleteById?id=${list[sta.index].id}"></a>--%>
                        <a class="delete" onclick="deleteAjax(this)"></a>
                    </div>
                        <%--                    <header class="card-header ">--%>
                        <%--                        <p class="card-header-title">${account.author}</p>--%>
                        <%--                    </header>--%>
                <div class="card-content">
                    <div class="content">
                            <%--                                <strong>${account.author}</strong><br>--%>
                            <%--                        <p class="title"> ${list[index-sta.index].content}</p>--%>
                        <p class="title"> ${list[sta.index].content}</p>

                        <nav class="level is-mobile">
                            <div class="level-left">
                                <div class="level-item has-text-centered">
                                          <span style="margin-right: 10px" onclick="likesClick(this)"
                                                mid="${list[sta.index].id}">
                                         <img src="${pageContext.request.contextPath}/img/favorite_border-24px.svg"
                                              onmouseover="hover(this)" onmouseout="unhover(this)" class="myfloat">

                                        <div class='myfloat  <c:if test="${list[sta.index].likes==0}">is-hidden </c:if>'>${list[sta.index].likes}</div>

                                    </span>
                                        <%--                                        <span>--%>
                                        <%--                                         <img src="${pageContext.request.contextPath}/img/chat_bubble_outline-black-24dp.svg" class="myfloat">--%>
                                        <%--                                            <div class="myfloat">5</div>--%>
                                        <%--                                        </span>--%>
                                </div>
                                <div class="level-item has-text-centered" style="margin-left: 1em">
                                    <div class="myfloat" align="left">${list[sta.index].date}</div>
                                </div>
                            </div>
                            <div class="level-right">
                                <div class="level-item has-text-centered">
                                    <strong style="float: right;" align="right">${list[sta.index].author}</strong>
                                </div>
                            </div>
                        </nav>


                    </div>
                </div>
                    <%--                <br>--%>
                    <%--                <br>--%>
            </div>
                <%--                ${account.content}:${account.author}<br>--%>

        </div>
    </c:forEach>

        <nav class="bd-notice navbar level is-fixed-bottom has-text-centered is-mobile" style="margin-bottom: 0"
             id="bd">
            <div class="has-text-centered" style="margin: 0 auto">
                <strong>
                </strong>
            </div>
        </nav>


</div>

<%@ include file="mouseAction.jsp" %>

</body>
</html>
