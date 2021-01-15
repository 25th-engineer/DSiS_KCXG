<?php
//管理员删除普通用户及其留言功能模块
require_once 'config.php';
require_once 'common.php';
require_once 'medoo.php';
require_once 'auth.php';

$data = $_POST;
$ids = $data['ids'];
$table = $data['table'];

$db = new \Medoo\Medoo($config['db']);
if ($table == 'user') {
    $db->delete($table, [
        'AND' => [
            'id' => $ids,
            'admin[!]' => 1
        ]
    ]);

    $db->delete('message', [
       'OR' => [
           'form_user' => $ids,
           'to_user' => $ids,
       ]
    ]);
} else if ($table ) {
    $db->delete('message', [
        'id' => $ids
    ]);
}

exit(json_encode(['code' => 200, 'msg' => '删除成功']));
