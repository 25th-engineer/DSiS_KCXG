<head>
    <meta charset="utf-8">
    <title>欢迎来到留言板</title>
</head>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <p style="margin-top: 100px;margin-left:10px; height:250px; width:250px">
    <h1>简易留言板<h1>

    <p stype="margin-top: 20px">用户名：<input type="text" name="username" ><br></p>
    <p>密&nbsp;码：<input type="text" name="password"></p>
    <p style="margin-left: 80px"><input type="submit" value="登录" name="login">
        &nbsp;&nbsp;<input type="submit" value="注册" name="register">
    </p>
    </p>
</form>

<?php
session_start();
function IsRegister()
{
    if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST["register"])
        return true;
    return false;
}

if (IsRegister())
{
    header("location:register.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    $user = $_POST["username"];
    $password = $_POST["password"];
    if (empty($user) || empty($password))
        exit;

    require "DBManager.php";
    $dbmanager = new CMessageBoardDBM();
    $sql = "SELECT password FROM pinfo WHERE username='$user'";
    $result = $dbmanager->Query($sql);

    if (!$result || $result->num_rows <= 0)
        exit;

    $info = $result->fetch_assoc()["password"];
    if ($password == $info)
    {
        $_SESSION["username"] = $user;
        header("location:main.php");
        exit;
    }
}
?>
