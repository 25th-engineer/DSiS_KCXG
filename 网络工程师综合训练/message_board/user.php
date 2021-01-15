<?php
//用户后台模块
require_once 'common.php';
require_once 'auth.php';
require_once 'config.php';
require_once 'medoo.php';

$database = new \Medoo\Medoo($config['db']);
$users = $database->select('user', '*');

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<?php require_once 'header.php'; ?>
<div class="layui-main" style="margin-top: 50px;">
    <div>
        <?php if ($user['admin']): ?>
            <button id="delete" class="layui-btn">删除</button>
        <?php endif; ?>
    </div>
    <table class="layui-table" style="max-width: 1140px;width: 1140px; table-layout:fixed">
        <thead>
        <tr>
            <th width="20"></th>
            <th width="10%">用户ID</th>
            <th width="10%">邮箱</th>
            <th width="10%">真实姓名</th>
            <th width="10%">手机</th>
            <th width="10%">博客</th>
            <th width="10%">QQ</th>
            <th width="10%">微信</th>
            <th width="10%">微博</th>
            <th width="10%">类型</th>
            <th width="10%">禁言</th>
            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($users as $v): ?>
            <tr>
                <td width="20">
                    <?php if (!$v['admin']): ?>
                        <input type="checkbox" name="ids" value="<?= $v['id']; ?>">
                    <?php endif; ?>
                </td>
                <td width="10%"><?= $user['admin'] == 1 || $v['id_public'] ? $v['id'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['email_public'] ? $v['email'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['realname_public'] ? $v['realname'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['telephone_public'] ? $v['telephone'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['blog_public'] ? $v['blog'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['qq_public'] ? $v['qq'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['wechat_public'] ? $v['wechat'] : '私密' ?></td>
                <td width="10%"><?= $user['admin'] == 1 || $v['weibo_public'] ? $v['weibo'] : '私密' ?></td>
                <td width="10%"><?= $v['admin'] == 1 ? '管理员' : '普通会员' ?></td>
                <td width="10%"><?= $v['forbid'] == '-1' ? '永久' : ($v['forbid'] >= date('Y-m-d') ? $v['forbid'] : ''); ?></td>
                <td width="10%">
                    <?php if ($user['admin'] == 1 && $v['admin'] != 1): ?>
                        <a href="javascript:;" class="forbid" data-id="<?= $v['id']; ?>">禁言</a>
                    <?php endif; ?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div id="forbid" style="display: none;padding: 20px;">
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">禁言类型</label>
            <div class="layui-input-block">
                <input type="radio" name="type" value="1" title="永久" checked>
                <input type="radio" name="type" value="2" title="期限">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">禁言时间</label>
            <div class="layui-input-block">
                <input type="text" name="date" class="layui-input" id="date">
            </div>
        </div>
        <input type="hidden" id="id" name="id">
        <div class="layui-form-item" style="text-align: center">
            <button class="layui-btn btn-forbid">确定</button>
        </div>
    </form>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
<script>
    var laydate = layui.laydate;

    laydate.render({
        elem: '#date'
    })

    // 禁言
    $('.forbid').on('click', function () {
        let id = $(this).data('id');
        let title = '禁言用户' + id;
        $('#id').val(id);
        layer.open({
            type: 1,
            title: title,
            content: $('#forbid')
        });
    });

    $('.btn-forbid').on('click', function (e) {
        e.preventDefault();
        var type = $('input[name="type"]:checked').val();
        var date = $('#date').val();
        if (!type) {
            layer.msg('请选择类型', {icon: 5});
            return;
        }

        if (type == 2 && !date) {
            layer.msg('请选择时间', {icon: 5});
            return;
        }

        var form = $(this).parents('form');
        $.ajax({
            url: 'forbid.php',
            type: 'post',
            data: form.serialize(),
            dataType: 'json',
            success: function (res) {
                if (res.code == 200) {
                    window.location.reload();
                } else {
                    layer.msg(res.msg, {icon: 5});
                }
            }
        });
    });

    $('#delete').on('click', function (e) {
        e.preventDefault();
        var ids = [];
        $('input[name="ids"]:checked').each(function () {
            ids.push($(this).val());
        });
        if (!ids) {
            layer.msg('请选择要删除的用户', {icon: 5});
            return;
        }

        $.ajax({
            url: 'delete.php',
            type: 'post',
            data: {
                ids: ids,
                table: 'user'
            },
            dataType: 'json',
            success: function (res) {
                if (res.code == 200) {
                    window.location.reload();
                } else {
                    layer.msg(res.msg, {icon: 5});
                }
            }
        });
    });
</script>
</body>
</html>
