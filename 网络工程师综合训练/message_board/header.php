<div class="layui-header header header-doc" winter="">
    <div class="layui-main">
        <a class="logo" href="/message_board/index.php">
            留言板
        </a>
        <ul class="layui-nav">
            <?php if ($user):?>
                <li><a href="messages.php">留言管理</a></li>
                <li><a href="user.php">用户后台</a></li>
                <li><a href="profile.php"><?= $user['email']?></a></li>
                <li><a href="logout.php">退出</a></li>
            <?php else:?>
                <li><a href="login.php">登陆</a></li>
                <li><a href="register.php">注册</a></li>
            <?php endif;?>
        </ul>
    </div>
</div>
<!--
顶部页面
-->