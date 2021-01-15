<?php
//留言内容组件功能模块
require_once 'config.php';
require_once 'common.php';
require_once 'medoo.php';
require_once 'auth.php';

$data = $_POST;

$db = new \Medoo\Medoo($config['db']);
$user = $db->get('user', '*', ['id' => $user['id']]);

// 禁言用户不能留言
if ($user['admin'] != 1) {
    if ($user['forbid'] == -1 || ($user['forbid'] > 0 && $user['forbid'] <= date('Y-m-d'))) {
        exit(json_encode(['code' => 201, 'msg' => '被禁言']));
    }
}

$data['from_user'] = $user['id'];
$data['time'] = date('Y-m-d H:i:s');

if (!$data['content']) {
    exit(json_encode(['code' => 201, 'msg' => '留言内容不能为空']));
}

if (isset($data['message_id']) && $data['message_id']) {
    $message = $db->get('message', '*', [
        'id' => $data['message_id']
    ]);
    if ($message) {
        $data['to_user'] = $message['from_user'];
    }
}
if (isset($data['code'])) unset($data['code']);
$db->insert('message', $data);
exit(json_encode(['code' => 200, 'msg' => '留言成功']));
