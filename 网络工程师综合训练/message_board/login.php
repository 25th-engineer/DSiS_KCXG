<?php
//登录功能模块
require_once 'config.php';
require_once 'common.php';
require_once 'medoo.php';

$error = '';
if (isPost()) {
    $data = $_POST;
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    if (!$email || !$password)
        $error = '参数有误';

    if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL))
        $error = '邮箱格式错误';

    $database = new \Medoo\Medoo($config['db']);
    $result = $database->get('user','*', [
        'email' => $data['email'],
        // 'password' => md5($data['password'])
    ]);
    
    if (!$result)
        $error = '邮箱输入错误或未注册！';
        
    if ($result['password'] != md5($password))
        $error = '邮箱输入错误或未注册！';

    if (!$error) {
        if (!session_id()) session_start();
        $_SESSION['user'] = json_encode($result);

        header('Location: index.php');
    }
}
?>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="css/main.css">
    <style>
        body {
            position: relative;
            overflow: hidden;
            background-image: -webkit-radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);
            background-image: radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);
        }

        .code {
            float: left;
            width: 180px;
        }

        #canvas {
            float: right;
            width: 100px!important;
            height: 38px!important;
        }
    </style>
</head>
<body>
<canvas id="canv"></canvas>
<form class="login-form layui-form" id="loginform" method="post">
    <h2>登陆</h2>
    <div class="layui-form-item input-item">
        <input type="text" placeholder="请输入邮箱" class="layui-input" name="email">
    </div>
    <div class="layui-form-item input-item">
        <input type="password" placeholder="请输入密码" name="password" class="layui-input">
    </div>
    <div class="layui-form-item">
        <button class="layui-btn w100  btn-login" id="btn">登陆</button>
        <p class="text-right"><a href="register.php">没有账号,去注册</a></p>
    </div>
</form>
<script src="js/jquery.min.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
<script>
    $('.btn-login').on('click', function (e) {
        e.preventDefault();
        var form = $(this).parents('form');
        var data = form.serializeArray();
        var d = {};
        $.each(data, function() {
            d[this.name] = this.value;
        });

        if (!d.email) {
            layer.msg('邮箱格式不正确', {icon: 5});
            return false;
        }

        if (!d.password) {
            layer.msg('密码不能为空', {icon: 5});
            return false;
        }

        $(this).prop('disabled', true);
        form.submit();
    });

    <?php if ($error):?>
    layer.msg('<?= $error;?>', {icon: 5})
    <?php endif;?>
</script>
</body>
</html>
