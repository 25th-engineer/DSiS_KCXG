<?php
session_start();
if (!isset($_SESSION['user'])) {
    if (isset($_COOKIE['user'])) {
        $_SESSION['user'] = $_COOKIE['user'];
    }else{
        header('location:welcome.php');
        exit();
    }
}
if (isset($_SESSION['rem'])) {
    setcookie('user',$_SESSION['user'],time()+3600);
    unset($_SESSION['rem']);
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
            <h1>个人作业</h1>
            <div class="jumbotron">
                <h1>Hello, <?php echo $_SESSION['user']; ?></h1>
                <p>合肥工业大学宣城校区2020-2021学年上学期《网络程序设计》实验3</p>
                <p><a class="btn btn-primary btn-lg" href="https://www.wenhua.link/" role="button" target="_blank">个人主页</a></p>
                <p><a class="btn btn-primary btn-lg" href="./display.php" role="button" target="_blank">查询课表</a></p>
            </div>
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

<!--
*******************************************
CREATE TABLE IF NOT EXISTS `students`(
`stu_id` VARCHAR(40) NOT NULL,
`stu_name` VARCHAR(100) NOT NULL,
`email` VARCHAR(40) NOT NULL,
`password` VARCHAR(100) NOT NULL,
`submission_time` timestamp,
PRIMARY KEY ( `stu_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `courses`(
`course_id` VARCHAR(30) not null,
`course_name` VARCHAR(100) NOT NULL,
`credit` int not null,
`submission_time` timestamp,
PRIMARY KEY ( `course_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `SC`(
`stu_id` VARCHAR(40) NOT NULL,
`course_id` VARCHAR(30) not null,
`grade` int not null,
`submission_time` timestamp,
PRIMARY KEY ( `stu_id`, `course_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into lab_3_2.courses (course_id, course_name, credit, submission_time) values('98030111','线性代数', 2, current_timestamp);
insert into lab_3_2.courses (course_id, course_name, credit, submission_time) values('98030112','高等数学', 6, current_timestamp);
insert into lab_3_2.courses (course_id, course_name, credit, submission_time) values('98030113','大学英语', 1, current_timestamp);
insert into lab_3_2.courses (course_id, course_name, credit, submission_time) values('98030114','大学语文', 1, current_timestamp);
insert into lab_3_2.courses (course_id, course_name, credit, submission_time) values('98030115','复变函数', 2, current_timestamp);

insert into lab_3_2.sc (stu_id, course_id, grade, submission_time) values('2017218001', '98030111', 100, current_timestamp);
insert into lab_3_2.sc (stu_id, course_id, grade, submission_time) values('2017218001', '98030112', 80, current_timestamp);
insert into lab_3_2.sc (stu_id, course_id, grade, submission_time) values('2017218002', '98030111', 90, current_timestamp);
insert into lab_3_2.sc (stu_id, course_id, grade, submission_time) values('2017218002', '98030115', 90, current_timestamp);

-->