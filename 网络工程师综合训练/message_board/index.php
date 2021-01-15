<?php
//主页面
require_once 'common.php';
require_once 'config.php';
require_once 'medoo.php';

if (!session_id()) session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : [];
$user = $user ? json_decode($user, true) : [];

$database = new \Medoo\Medoo($config['db']);

$where = [];
if (!$user) {
    $where[] = 'visibility=1';
} else {
    if ($user['admin'] != 1) {
        $where[] = '(visibility in (1,2) || (visibility = 3 and from_user = '. $user['id'] .'))';
    }
}

$time = $_GET['time'] ?? '';
if ($time) {
    $start_time = date('Y-m-d 00:00:00',strtotime($time));
    $end_time = date('Y-m-d 23:59:59',strtotime($time));
    $where[] = '(time>=\''.$start_time.'\' and time<=\''.$end_time.'\')';
}


$content = $_GET['content'] ?? '';
if ($content) {
    $where[] = 'content like \'%'.$content.'%\'';
}

$where = implode(' and ', $where);
$where = $where ? 'where ' . $where : '';

$message = $database->query('select * from message ' . $where . ' order by time desc')->fetchAll();
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
    <style>
    	.code {
            float: left;
            width: 920px;
        }

        #canvas {
            float: right;
            width: 100px!important;
            height: 38px!important;
        }
    </style>
</head>
<body>
<?php require_once 'header.php'; ?>

<div class="layui-main" style="margin-top: 50px;">
	
	<?php if ($user): ?>
        <form class="layui-form" action="" method="post" style="margin-top: 100px;">
            <h2 style="text-align: center; margin-bottom: 20px;">留言</h2>
            <div class="layui-form-item">
                <label class="layui-form-label">留言内容</label>
                <div class="layui-input-block">
                    <textarea name="content" class="layui-input" style="height: 100px;"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input type="text" name="nickname" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">可见性</label>
                <div class="layui-input-block">
                    <select name="visibility">
                        <option value="1">所有人可见</option>
                        <option value="2">登陆可见</option>
                        <option value="3">个人可见</option>
                    </select>
                </div>
            </div>
            
            <?php if (!$user['admin']):?>
            <div class="layui-form-item input-item code-box">
            	<label class="layui-form-label">验证码</label>
                <div class="layui-input-block">
		        	<input type="text" placeholder="请输入验证码" name="code" id="code" class="layui-input code">
		        	<canvas id="canvas" width="100px" height="38px"></canvas>
		        </div>
		    </div>
		    <?php endif;?>

            <input type="hidden" name="type" value="1">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn btn-message">留言</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    <?php endif;?>
	
    <div>
        <form class="layui-form" action="" method="get" style="min-width: 300px;padding: 20px;">
        	<h2 style="text-align: center; margin-bottom: 20px;">筛选</h2>
            <div class="layui-form-item">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block">
                    <input type="text" name="content" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-block">
                    <input type="text" name="time" class="time layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn">筛选</button>
                </div>
            </div>
        </form>

    <table class="layui-table">
        <thead>
        <tr>
            <th>发表用户</th>
            <th width="60%">发表内容</th>
            <th width="10%">发表性质</th>
            <th width="10%">发表时间</th>
            <th  width="10%">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($message as $v): ?>
            <tr>
                <td><a href="<?= $user ? 'info.php?id='.$v['from_user'] : 'javascript:;'?>"><?= $v['nickname'] ? $v['nickname'] : $v['from_user']?></a></td>
                <td width="60%"><?= $v['content']?></td>
                <td><?= $v['type'] == 1 ? '留言' : (($v['type'] == 2 ? '回复' : '评论') . '('. $v['from_user'] . '->' . $v['to_user'] .')') ?></td>
                <td><?= $v['time']?></td>
                <td>
                    <?php if ($user && $user['id'] != $v['from_user'] && $v['type'] == 1): ?>
                        <a href="javascript:;" data-id="<?= $v['id']?>" class="comment">评论</a>
                    <?php endif;?>
                    <?php if ($user && ($user['admin'] == 1 || $user['id'] == $v['to_user']) && $v['type'] == 3): ?>
                        <a href="javascript:;" data-id="<?= $v['id']?>" class="reply">回复</a>
                    <?php endif;?>
                    <?php if ($user && ($user['admin'] == 1 || $v['from_user'] == $user['id'])): ?>
                        <a href="javascript:;" data-id="<?= $v['id']?>" class="delete">删除</a>
                    <?php endif;?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <div class="form-box" style="display: none;">
        <form class="layui-form" action="" method="post" style="min-width: 300px;padding: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block">
                    <textarea name="content" class="layui-input" style="height: 100px;"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input type="text" name="nickname" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">可见性</label>
                <div class="layui-input-block">
                    <select name="visibility">
                        <option value="1">所有人可见</option>
                        <option value="2">登陆可见</option>
                        <option value="3">个人可见</option>
                    </select>
                </div>
            </div>

            <input type="hidden" name="type" value="1">
            <input type="hidden" name="message_id">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn btn-message">留言</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
<script>
	if ($('#canvas').length > 0) {
		code_draw();
	    // 点击后刷新验证码
	    $("#canvas").on('click', function() {
	        code_draw();
	    });
	}

    var laydate = layui.laydate;

    laydate.render({
        elem: '.time'
    })

    $('.comment, .reply').on('click', function () {
        var id = $(this).data('id');
        var el = $('.form-box');
        var type = $(this).is('.comment') ? 3 : 2;
        var title = type == 3 ? '评论留言' + id : '回复留言' + id;
        el.find('input[name="type"]').val(type);
        el.find('input[name="message_id"]').val(id);
        el.find('.btn-message').text(type == 3 ? '评论' : '回复');
        layer.open({
            type: 1,
            title: title,
            content: el
        });
    });

    $('.delete').on('click', function (e) {
        e.preventDefault();
        var ids = [$(this).data('id')];
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
        
        if ($(this).parents('form').find('#canvas').length > 0) {
        	if ($('#code').val() != $('#canvas').attr('data-code')) {
        		layer.msg('验证码不正确', {icon: 5});
        		code_draw();
        		return;
        	}
        }

        $.ajax({
            url: 'message.php',
            type: 'post',
            data: $(this).parents('form').serialize(),
            dataType: 'json',
            success: function (res) {
                if (res.code == 200) {
layer.msg('留言成功', {icon: 6}, function () {
			  window.location.reload();
			});
                   
                } else {
                    layer.msg(res.msg, {icon: 5});
                }
            }
        });
    });
</script>
</body>
</html>
