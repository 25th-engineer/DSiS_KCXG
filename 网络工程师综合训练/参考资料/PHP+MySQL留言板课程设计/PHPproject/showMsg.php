 <?php
    header('Content-type: text/html; charset=UTF8');
	session_start();
	if(empty($_SESSION['uid'])){ 
		echo "<script>alert('请登录或注册！');location='login.php'</script>";
	}
 ?>
    <html>  
    <head>  
    <title>我的讯息-与您分享</title> 
	<link rel="stylesheet" type="text/css" href="./css/index.css">
    </head>  
    <body background="./images/p2.jpg" style="background-size:cover;background-attachment: fixed;" >
    <font color="red">天气预报：</font>
    <span>
    <iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=7&icon=12&num=5&site=12"></iframe>
    </span>
    <center>
	<?php
	$name = $_SESSION["uid"];
		echo $name."的讯息";
    ?> 
    <br/>
    <input type = "button" value = "发布讯息" onclick="location.href='addMsg.php'" class="button"/>
    <input type = "button" value = "查看讯息" onclick="location.href='showMsg.php'" class="button"/>
    <input type = "button" value = "退出登录" onclick="location.href='login.php'" class="button"/>
    <hr width = "70%"> 
	</center>
	<?php
        //数据库连接  
        $con = @mysqli_connect("127.0.0.1:3306","root","",myDemo);  
        if(!$con){  
            die("数据库连接错误".mysqli_connect_error());  
        }
        mysqli_query($con,"set names 'utf8'");  
        //显示每页的讯息数  
        $pagesize = 4;
        //确定页数p参数  
        @$p = $_GET['p']?$_GET['p']:1;  
        //数据指针  
        $offset = ($p-1)*$pagesize; 
        //查询本页现实的数据 
        $query_sql = "select * from MSG order by time desc limit $offset,$pagesize";  
        $result = mysqli_query($con,$query_sql); 
        //循环输出  
	    echo "<div style='margin-top:55px'>";
	    while($res = mysqli_fetch_array($result)){
	    echo "<div class='k'>";
	    echo "<div class='ds-post-main'>";
	    echo "<div class='ds-comment-body'>
	    <span>{$res['author']}  于  {$res['time']}  发布的讯息</span>
	    <span style='float:right'><a href = 'delMsg.php?id=".$res['user']."&time=".$res['time']."'><input type='submit' class='button1' value='删除'></input></a></span>
	    <p>讯息主题 : {$res['title']}   讯息地址 : <span>{$res['ip']}</span></p>
            <hr width=450px> 
	    <p>{$res['content']}</p></div><br>";
	    echo "</div>";
	    echo "</div>";
        }
        echo "</div>";
        //分页代码  
        //计算讯息总数  
        $count_result = mysqli_query($con,"select count(*) as count from MSG");  
        $count_array = mysqli_fetch_array($count_result);  
      
        //计算总的页数  
        $pagenum = ceil($count_array['count']/$pagesize);  
        echo "<center>";
        echo "<div style='display: inline-block;margin-right: 15px;margin-left:15px;color:white;'>",'共',$count_array['count'],'条讯息','</div>';  
	    echo "<div style='display: inline-block;margin-right: 15px;margin-left:15px;color:white;'>",'共',$pagenum,'页','</div>';  
        //循环输出个页数及链接  
        if($pagenum>1){  
            for($i = 1;$i<=$pagenum;$i++){  
                if($i == $p){  
                    echo "<div style='background:#e8ffc4;width:25px;display: inline-block;margin-right: 10px;'>",$i,"</div>";      
                }else{  
			       echo '<a href="showMsg.php?p=',$i,'">',"<div style='width:25px;display: inline-block;margin-right: 10px;background:#FF9D6F'>",$i,'</div>','</a>';
                }
            }
	        echo "<div style='display: inline-block;margin-right: 10px;color:white;'>",'当前在 ',$p, ' 页',"</center></div>";
        }
	echo "<br>";
	echo "<br>";
	echo "<br>";
	echo "</div>";
	?>
</body>  
</html> 

