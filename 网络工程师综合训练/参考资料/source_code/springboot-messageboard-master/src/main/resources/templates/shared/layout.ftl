<#macro layout>

<!DOCTYPE html>
<html>
<head>
    <title>留言板</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.4.1/css/bootstrap.min.css"/>

    <style type="text/css">
        .msg-panel {
            font-size: 14px;
        }

        .form-txt {
            font-size: 14px;
            width: 50%;
        }
    </style>
</head>
<body>

<!--导航 begin-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixd-top">
    <div class="container-xl">
        <a class="navbar-brand" href="/">留言板</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/message/list">留言列表 <span class="sr-only">(current)</span></a>
                </li>
                <#if username??>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                           aria-expanded="false">${username!}</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07XL">
                            <a class="dropdown-item" href="/user/logout">退出</a>
                        </div>
                    </li>
                <#else>
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/login" tabindex="-1">登录</a>
                    </li>
                </#if>

            </ul>
        </div>
    </div>
</nav>
<!--导航 end-->

<div class="container">
    <#nested />
</div>


<script src="https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>

<@bottom />

</body>
</html>

</#macro>