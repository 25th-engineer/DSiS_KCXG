<body>
<div>
    <h2>
        <a href="issue.php" rel="external nofollow">发布信息</a>
        <a href="quit.php" rel="external nofollow">退出系统</a>
    </h2>
</div>
<br/><br/>

<h2>留言信息：</h2>
<table cellpadding="0" cellspacing="0" border="1" width="60%">
    <tr>
        <td>发送人</td>
        <td>接收人</td>
        <td>发送时间</td>
        <td>信息内容</td>
    </tr>
    <?php
    session_start();
    $user = $_SESSION["username"];
    if (empty($user))
    {
        header("location:login.php");
        exit;
    }

    require "DBManager.php";
    $dbmanager = new CMessageBoardDBM();
    $sql = "SELECT receiver, sender, sendtime, content FROM message where receiver = '$user'";
    $arr = $dbmanager->Query($sql);

    if ($arr->num_rows > 0){
        while ($row = $arr->fetch_assoc()){
            echo "
            <tr>
            <td>" . $row["receiver"] ."</td>
            <td>" . $row["sender"] . "</td>
            <td>" . $row["sendtime"] . "</td>
            <td>" . $row["content"] . "</td>
            </tr>";
        }
    }
    ?>
</table>
</body>