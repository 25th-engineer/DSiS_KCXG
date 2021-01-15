<?php
//更新用户个人信息功能模块
require_once 'common.php';
require_once 'auth.php';
require_once 'config.php';
require_once 'medoo.php';

$db = new \Medoo\Medoo($config['db']);
$id = $_GET['id'];
$u = $db->get('user', '*', ['id' => $id]);
$messages = [];
if ($user['admin'] == 1) {
    $messages = $db->select('message', '*', [
        'from_user' => $id
    ]);
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
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="id" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['id_public'] ? $u['id'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['email_public'] ? $u['email'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input type="text" name="realname" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['realname_public'] ? $u['realname'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-block">
                <input type="text" name="telephone" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['telephone_public'] ? $u['telephone'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">博客</label>
            <div class="layui-input-block">
                <input type="text" name="blog"class="layui-input" readonly value="<?=  $user['admin'] == 1 || $u['blog_public'] ? $u['blog'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">QQ</label>
            <div class="layui-input-block">
                <input type="text" name="qq" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['qq_public'] ? $u['qq'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">微信</label>
            <div class="layui-input-block">
                <input type="text" name="wechat" class="layui-input" readonly value="<?= $user['admin'] == 1 || $u['wechat_public'] ? $u['wechat'] : '私密';?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">微博</label>
            <div class="layui-input-block">
                <input type="text" name="weibo" class="layui-input"  value="<?= $user['admin'] == 1 || $u['weibo_public'] ? $u['weibo'] : '私密';?>">
            </div>
        </div>
    </form>

    <?php if ($messages):?>
    <table class="layui-table">
        <thead>
        <tr>
            <th>发表用户</th>
            <th width="60%">发表内容</th>
            <th>发表性质</th>
            <th>发表时间</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($messages as $v): ?>
            <tr>
                <td><a href="<?= $user ? 'info.php?id='.$v['from_user'] : 'javascript:;'?>"><?= $v['nickname'] ? $v['nickname'] : $v['from_user']?></a></td>
                <td width="60%"><?= $v['content']?></td>
                <td><?= $v['type'] == 1 ? '留言' : (($v['type'] == 2 ? '回复' : '评论') . '('. $v['from_user'] . '->' . $v['to_user'] .')') ?></td>
                <td><?= $v['time']?></td>

            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif;?>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
</body>
</html>
