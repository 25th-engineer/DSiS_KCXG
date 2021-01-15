<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <title>重置密码</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/resetPwd.css">
    <script type="text/javascript" src="${ctx }/static/frontjs/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/static/frontjs/yanzheng.js"></script>
    <script src="${ctx }/static/frontjs/html5shiv.min.js"></script>
    <script src="${ctx }/static/frontjs/home.js"></script>
</head>
<body>
<div class="overall">
<!--header-->
    <div class="header">
		<div class="banner">
		<!--logo-->
			<div class="logo">
				<img src="${ctx }/static/frontimages/b3.png">
			</div>
		<!--首页选项卡-->
			<div class="home">
				<a href="home.jsp">首页</a>
			</div>
		<!--全部课程选项卡-->
			<div class="allclass">
				<a href="allclass.html">全部课程</a>
			</div>
		<!--搜索框-->
			<div class="sousuo">
				<form> 
                    <div class="s_img">
                        <a href="${ctx }/front/search.jsp">搜索 <img src="${ctx }/static/frontimages/sousuo.png"></a> 
                    </div>
                </form>
			</div>
		<!--用户注册登录-->
			<div class="login_regist">
				<a href="javascript:void(0)" onClick="showBox()">登录</a>
				<a href="javascript:void(0)" onClick="registBox()">注册</a>
			</div>
			<div class="event" id="login_box" style="display: none;">
				<div class="login">
					<div class="title">
					    <span class="t_txt">登录</span>
					    <span class="del" onClick="deleteLogin()">X</span>
				    </div>
				    <form action="" method="post">
					    <input type="text" name="email" id="email" value="" placeholder="请输入邮箱" class="email-a" onblur="check_box1()" />
					    <div class="bcde" align="center"></div>
					    <input type="password" name="" id="pwd_login" value="" placeholder="请输入密码" onblur="check_box2()"/>
					    <div class="error_pwd" align="center"></div>
					    <input type="submit" name="" id="" value="登录" class="btn" />
					    <input type="button" name="" id="forgetPwd" value="忘记密码?" class="">
					    <input type="button" name="" id="noAccount" value="没有账号?去注册" class="" onClick="regist()">
				    </form>
				</div>
			</div>
			<div class="event" id="regist_box" style="display: none;">
				<div class="regist">
					<div class="title">
						<span class="t_txt">注册</span>
						<span class="del" onClick="deleteRegist()">X</span>
					</div>
					<form action="" method="post">
						<input type="text" name="" id="email_regist" value="" placeholder="请输入邮箱" class="email-b" onblur="check_box()" />
						<div class="bcd" align="center"></div>
						<input type="password" name="" id="pwd_regist" value="" placeholder="密码为6-16位包含数字、字母、下划线" onblur="check()" />
						<div id="spinfo2" align="center"></div>
						<input type="password" name="" id="pwd_pwd" value="" placeholder="再次输入密码" onblur="check_again()">
						<div id="spinfo3" align="center"></div>
						<input type="text" name="" id="petname" value="" placeholder="昵称"/>
						<input type="text" name="" id="phone" value="" placeholder="手机" onblur="Mous()" />
						<div id="spinfo1" align="center"></div>
						<input type="submit" name="" id="regist_1" value="注册" class="btn">
					</form>	
				</div>
			</div>
			<div class="bg_color" onClick="deleteLogin()" id="bg_filter" style="display: none;"></div>
		<!--培训机构登录-->
			<div class="org_login">
				<a href="../organization/orgLogin.jsp">培训机构登录</a>
			</div>
		</div>
	</div>
	
   
<!--body-->
    <div class="body">
    <!--标题-->
        <div class="body_top">
            <span><h3>重置密码<h3/></span>
        </div>
    <!--表单-->
        <div class="body_bottom">
            <div class="form">
                <form action="" onsubmit="javascript:alert('重置成功！');">
                    <div class="reset">
                        <span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱&nbsp;：</span>
                        <div class="form_input">
                            <input type="email" name="email" placeholder="请输入正确的邮箱账号" id="checkemail" onchange="check_email()" required="required" />
                        </div>
                        <span id="mail"></span>
                    </div>
                    <div class="reset">
                        <span>旧&nbsp;密&nbsp;码&nbsp;：</span>
                        <div class="form_input">
                            <input type="text" placeholder="请输入旧密码" />
                        </div>
                    </div>
                    <div class="reset">
                        <span>新&nbsp;密&nbsp;码&nbsp;：</span>
                        <div class="form_input">
                            <input type="password" name="password" placeholder="密码长度为6-12位" id="password" />
                        </div>
                    </div>
                    <div class="reset">
                        <span>确认密码：</span>
                        <div class="form_input">
                            <input type="password" name="checkPWD" placeholder="密码长度为6-12位" id="checkPWD" onchange="check_password()" />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="确认重置"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
     <div id="backgroundImg"></div>
<!--footer-->
    <div class="footer">
        <div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>