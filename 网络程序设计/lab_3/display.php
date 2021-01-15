<?php
require_once 'config.php';
if (!$_SESSION['user']) {
    header('location:welcome.php');
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<!-- header部分 -->
<?php require_once 'public/layouts/header.php' ?>

<body>
<!-- 导航栏 -->
<?php require_once 'public/layouts/nav.php' ?>

<!-- 页面主体内容 -->
<div class="container">
    <div class="content">
        <div class="starter-template">
            <!-- 这里做了修改，其他地方自由发挥 -->
            <h1>选课表内容：</h1>
            <!--
            <div class="jumbotron">
            -->
            <table class="jumbotron" style='text-align:center; border:solid border-collapse:collapse' border="1" align="center">
                <!-- <tr><td>姓名</td><td>年龄</td></tr> -->
                <tr><td>序号</td><td>课程号</td><td>提交时间</td></tr>
                <?php

                $conn = mysqli_connect(DB_HOST, DB_USER, DB_PWD);
                if($conn){
                    //echo '连接成功';
                    echo '<div align="center"></div>';
                }else{
                    echo '<div align="center">连接失败</div>';
                }
                mysqli_query($conn,"use " . DB_NAME);
                mysqli_query($conn,"set name utf-8");

                //$sql = "SELECT * FROM sc WHERE stu_id = '".'2017218001'."'"; //$_POST['stu_id']
                $sql = "SELECT * FROM sc WHERE stu_id = '".$_SESSION['user']."'"; //$_POST['stu_id']
                $retval = mysqli_query($conn,$sql);
                $num=mysqli_num_rows($retval);
                if (!$num) {
                    printf("Error: %s\n", mysqli_error($conn));
                    exit();
                }

                //这里用一个for循环输出所有满足条件的查询语句
                for ($i=0; $i <$num ; $i++) {
                    $row=mysqli_fetch_assoc($retval);
                    $id=$row['stu_id'];
                    $course_id=$row['course_id'];
                    $course_name=$row['course_name'];
                    $submission_time=$row['submission_time'];

                    //echo "<tr><td>$id</td><td>$course_id</td><td></td>$course_name</td><td></td>$submission_time</td><tr>";
                    printf("<tr><td>$id</td><td>$course_id</td><td>$submission_time</td></tr>");

                }

                ?>
            </table>
            <!--
            </div>
            -->
        </div>
    </div>
</div><!-- /.container -->

<!-- 网页底部 -->
<?php require_once 'public/layouts/footer.php'; ?>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="public/js/check.js"></script>
</body>
</html>