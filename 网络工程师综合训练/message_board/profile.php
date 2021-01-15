<?php
require_once 'common.php';
require_once 'auth.php';
require_once 'config.php';
require_once 'medoo.php';

if (isPost()) {
    $id = $_POST['id'];
    unset($_POST['id']);
    unset($_POST['email']);

    $database = new \Medoo\Medoo($config['db']);
    $res = $database->update('user', $_POST, ['id' => $id]);
    $user = $database->get('user', '*', ['id' => $id]);
    if (!session_id()) session_start();
    $_SESSION['user'] = json_encode($user);
    $alert = '修改信息成功！';
    //exit(json_encode(['code' => 200, 'msg' => '修改信息成功！']));
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人信息</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <?php require_once 'header.php';?>
    <div class="layui-main" style="margin-top: 50px;">
        <form class="layui-form" action="" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">用户ID</label>
                <div class="layui-input-block">
                    <input type="text" name="id" class="layui-input" readonly value="<?= $user['id'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="id_public" value="1" title="公开" <?= $user['id_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="id_public" value="0" title="私密" <?= $user['id_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="email" class="layui-input" readonly value="<?= $user['email'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="email_public" value="1" title="公开" <?= $user['email_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="email_public" value="0" title="私密" <?= $user['email_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="realname" class="layui-input" value="<?= $user['realname'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="realname_public" value="1" title="公开" <?= $user['realname_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="realname_public" value="0" title="私密" <?= $user['realname_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-block">
                    <input type="text" name="telephone" class="layui-input"  value="<?= $user['telephone'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="telephone_public" value="1" title="公开" <?= $user['telephone_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="telephone_public" value="0" title="私密" <?= $user['telephone_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">博客</label>
                <div class="layui-input-block">
                    <input type="text" name="blog"class="layui-input"  value="<?= $user['blog'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="blog_public" value="1" title="公开" <?= $user['blog_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="blog_public" value="0" title="私密" <?= $user['blog_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">QQ</label>
                <div class="layui-input-block">
                    <input type="text" name="qq" class="layui-input"  value="<?= $user['qq'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="qq_public" value="1" title="公开" <?= $user['qq_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="qq_public" value="0" title="私密" <?= $user['qq_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">微信</label>
                <div class="layui-input-block">
                    <input type="text" name="wechat" class="layui-input"  value="<?= $user['wechat'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="wechat_public" value="1" title="公开" <?= $user['wechat_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="wechat_public" value="0" title="私密" <?= $user['wechat_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">微博</label>
                <div class="layui-input-block">
                    <input type="text" name="weibo" class="layui-input"  value="<?= $user['weibo'];?>">
                </div>
                <div class="layui-input-block">
                    <input type="radio" name="weibo_public" value="1" title="公开" <?= $user['weibo_public'] == 1 ? 'checked' : ''?>>
                    <input type="radio" name="weibo_public" value="0" title="私密" <?= $user['weibo_public'] != 1 ? 'checked' : ''?>>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/code.js"></script>
    <script src="plugins/layui/layui.all.js"></script>
    <script>
    	<?php if ($alert):?>
    		layer.msg('<?= $alert;?>', {icon: 6}, function () {
    			window.location.href = 'index.php';
    		});
    	<?php endif;?>
    </script>
</body>
</html>
