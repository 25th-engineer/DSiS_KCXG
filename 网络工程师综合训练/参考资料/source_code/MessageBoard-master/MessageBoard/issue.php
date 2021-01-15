<h1>发布信息</h1>
<a href="main.php">主界面</a>
<br/>
<br/>

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
$sql = "select password from pinfo where username=$user";
$sql = "SELECT username FROM pinfo";
$result = $dbmanager->Query($sql);

$alluser = array();
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"])?>">
    <p>接收人：
        <select name="jsr">
            <option value="all" checked>所有人</option>
            <?php
            while ($row = $result->fetch_assoc())
            {
                array_push($alluser, $row["username"]);
                if ($row["username"] != $user)
                    echo "<option value=" . $row["username"] .">" . $row["username"] . "</option>";
            }
            ?>
        </select>
    </p>
    <br/>
    <p>
        信息内容：<textarea name="content"></textarea>
    </p>
    <br/>
    <input type="submit" value="发送" />
</form>

<?php
function data_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" and !empty($_POST["jsr"] and !empty($_POST["content"])))
{
    $jsr = data_input($_POST["jsr"]);
    $content = data_input($_POST["content"]);

    //  使用预处理语句
    $sql = "INSERT INTO message(receiver, sender, content) VALUES(?, ?, ?)";
    $conn = $dbmanager->getConn();
    $stmt = $conn->prepare($sql) or die($conn->error);
    if ($jsr != "all")
    {
        $stmt->bind_param('sss', $jsr, $user, $content);
        $stmt->execute();
    }
    else
    {
        foreach ($alluser as $index => $value) {
            if ($value != $user){
            $stmt->bind_param('sss', $value, $user, $content);
            $stmt->execute();
            }
        }
    }
}
?>