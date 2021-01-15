<?php
//实现留言的主体功能
require_once 'common.php';
require_once 'config.php';
require_once 'medoo.php';
require_once 'auth.php';

$database = new \Medoo\Medoo($config['db']);
$message = $database->select('message', '*');


if ($user['admin']) {
    $message = $database->select('message', '*', ["ORDER" => ["id" => "DESC"]]);
} else {
    $message = $database->select('message', '*', [
        'from_user' => $user['id'], "ORDER" => ["id" => "DESC"]
    ]);
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>留言板</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<?php require_once 'header.php'; ?>
<div class="layui-main" style="margin-top: 50px;">
    <div>
        <button id="delete" class="layui-btn">删除</button>
    </div>
    <table class="layui-table">
        <thead>
        <tr>
            <th width="20"></th>
            <th>发表用户</th>
            <th width="60%">发表内容</th>
            <th width="10%">发表性质</th>
            <th width="10%">发表时间</th>

        </tr>
        </thead>
        <tbody>
        <?php foreach ($message as $v): ?>
            <tr>
                <td width="20">
                    <?php if ((isset($user['admin']) && $user['admin']) || ($user['id'] == $v['from_user'])): ?>
                        <input type="checkbox" name="ids" value="<?= $v['id']; ?>">
                    <?php endif; ?>
                </td>
                <td><a href="<?= $user ? 'info.php?id='.$v['from_user'] : 'javascript:;'?>"><?= $v['nickname'] ? $v['nickname'] : $v['from_user']?></a></td>
                <td width="60%"><?= $v['content']?></td>
                <td><?= $v['type'] == 1 ? '留言' : (($v['type'] == 2 ? '回复' : '评论') . '('. $v['from_user'] . '->' . $v['to_user'] .')') ?></td>
                <td><?= $v['time']?></td>

            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
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
                table: 'message'
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

    $('.btn-message').on('click', function (e) {
        e.preventDefault();

        $.ajax({
            url: 'message.php',
            type: 'post',
            data: $(this).parents('form').serialize(),
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
