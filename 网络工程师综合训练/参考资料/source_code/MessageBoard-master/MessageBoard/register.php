<html>
<head>
    <meta charset="utf-8">
    <title>注册界面</title>
</head>
<style>
    .error{color:#FF0000;}
</style>

<?php
session_start();
function data_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

$user = $password = $name = "";
$usernameErr = $passwordErr = $nameErr = "";
$IsValid = false;
if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    $user = data_input($_POST["username"]);
    $password = data_input($_POST["password"]);
    $name = data_input($_POST["name"]);
    $IsValid = true;
    if (empty($user))
    {
        $usernameErr = "用户名是必须填的";
        $IsValid = false;
    }

    if (empty($password))
    {
        $passwordErr = "密码是必须填的";
        $IsValid = false;
    }

    if (empty($name))
    {
        $nameErr = "名字是必须填的";
        $IsValid = false;
    }
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"])?>">
    用户名：<input type="text" name="username">
    <span class="error">&nbsp;*&nbsp;<?php echo $usernameErr;?></span>
    </br></br>

    密&nbsp;码：<input type="text" name="password">
    <span class="error">&nbsp;*&nbsp;<?php echo $passwordErr;?></span>
    </br></br>

    名&nbsp;字：<input type="text" name="name">
    <span class="error">&nbsp;*&nbsp;<?php echo $nameErr;?></span>
    </br></br>

    <p style="margin-left: 100px"><input type="submit" value="注册"></p>
</form>
<?php
if (!$IsValid)
    return;

require "DBManager.php";
$dbmanager = new CMessageBoardDBM();
$sql = "INSERT INTO pinfo(username, password, name) VALUES('$user', '$password', '$name')";
$result = $dbmanager->Query($sql);

$_SESSION["username"]=$user;
header("location:main.php");
?>
</html>