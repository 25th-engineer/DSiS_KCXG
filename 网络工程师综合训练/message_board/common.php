<?php
function dd($arr)
{
    echo '<pre>';
    var_dump($arr);
    die();
}

function dump($arr)
{
    echo '<pre>';
    var_dump($arr);
}

/**
 * 是否是POST提交
 * @return int
 */
function isPost()
{
    return ($_SERVER['REQUEST_METHOD'] == 'POST' && (empty($_SERVER['HTTP_REFERER']) || preg_replace("~https?:\/\/([^\:\/]+).*~i", "\\1", $_SERVER['HTTP_REFERER']) == preg_replace("~([^\:]+).*~", "\\1", $_SERVER['HTTP_HOST']))) ? 1 : 0;
}


/**
 * 当前请求是否ajax请求
 *
 * @access public
 * @return bool
 * PHP判断ajax请求的原理：
 * 在发送ajax请求的时候，我们可以通过XMLHttpRequest这个对象，创建自定义的header头信息。
 * 就是在header一层判断是否是ajax请求，对应的php根据$_SERVER['HTTP_X_REQUESTED_WITH']判断。
 */

function isAjax()
{
    return isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest";
}
