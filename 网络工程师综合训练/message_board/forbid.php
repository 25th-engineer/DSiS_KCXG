<?php
//管理员禁言普通用户功能模块
require_once 'config.php';
require_once 'common.php';
require_once 'medoo.php';
require_once 'auth.php';

$id = $_POST['id'];
$type = $_POST['type'];
$date = $_POST['date'];

if (!$user['admin']) {
    exit(json_encode(['code' => 201, 'msg' => '没有操作权限']));
}

$db = new \Medoo\Medoo($config['db']);
$u = $db->get('user', '*', ['id' => $id]);
if (!$u) {
    exit(json_encode(['code' => 201, 'msg' => '用户不存在']));
}

if ($u['admin']) {
    exit(json_encode(['code' => 201, 'msg' => '不能禁言管理员']));
}

if ($type == 1) {
    $data['forbid'] = '-1';
} else {
    if (!$date) {
        exit(json_encode(['code' => 201, 'msg' => '请输入时间']));
    }

    $data['forbid'] = $date;
}

$db->update('user', $data, ['id' => $id]);
exit(json_encode(['code' => 200, 'msg' => '禁言成功']));
