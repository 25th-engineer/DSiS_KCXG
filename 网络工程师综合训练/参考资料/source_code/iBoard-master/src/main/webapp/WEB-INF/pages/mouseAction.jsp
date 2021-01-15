<%--
  Created by IntelliJ IDEA.
  User: veve
  Date: 2020/8/5
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
  在 Body 内引用该 Jsp 会处理鼠标的事件 主要是鼠标右键菜单的操作 JS 方法在core.js
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="panel has-text-centered" id="menu" style="width: 100px;position: absolute;background-color: white;">
    <div class="panel-block" id="edit">
        <button class="button is-link is-outlined is-fullwidth">
            编辑
        </button>
    </div>

    <div class="panel-block" id="share">
        <button class="button is-link is-outlined is-fullwidth " disabled>
            分享
        </button>
    </div>
    <div class="panel-block">
        Version1.0
    </div>
</nav>