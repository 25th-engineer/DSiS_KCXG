<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/personinfor.css">
</head>
<body>
<!--header-->
    <div class="header">
    <!--logo-->
        <div class="logo"></div>
    <!--首页选项卡-->
        <div class="home">
            <a href="home.html">首页</a>
        </div>
    <!--全部课程选项卡-->
        <div class="allclass">
            <a href="allclass.html">全部课程</a>
        </div>
    <!--搜索框-->
        <div class="sousuo">
            <form>
            <!--文本框-->
                <div class="sou_text">
                    <input type="text" name="sousuo" value="请输入要查询的关键字" />
                </div>
            <!--搜索按钮-->
                <div class="sou_img">
                    <a href="#"><img src="resources/images/sou.png"></a>
                </div>
            </form>
        </div>
    <!--用户注册登录-->
        <div class="login_regist">
            <a href="userLogin.html">登录/注册</a>
        </div>
    <!--培训机构登录-->
        <div class="org_login">
            <a href="orgLogin.html">培训机构登录</a>
        </div>
    </div>
<!--body-->
    <div class="body">
        <div class="left">
            <div class="personimg"><img src="resources/images/timg.jpg"></div>
            <div class="nickname"><p>我的昵称</p></div>
            <div class="reinfor"><a href="#">修改个人信息</a></div>
            <div class="collect"><a href="#">我的收藏</a></div>
        </div>
        <div class="line"> </div>
        <div class="right">
            <div class="infor"><p>个人信息</p></div>
             <div class="inforline"></div>
             <div class="information">
                <form>
                <table>
                    <tr><td>昵称</td><td><input type="text" name="name"></td></tr>
                    <tr><td>邮箱</td><td><input type="text" name="mail"></td></tr>
                    <tr><td>性别</td><td><input type="radio" name="sex" value="男">男<input type="radio" name="sex" value="女">女</td></tr>
                    <tr><td>年龄</td><td><select name="year">
                            <option value="year">1990</option>
                            <option value="year">1995</option>
                            <option value="year">1997</option>
                            <option value="year">1998</option>
                            </select><select name="month">
                            <option value="month">5月</option>
                            <option value="month">6月</option>
                            <option value="month">7月</option>
                            <option value="month">8月</option>
                            </select><select name="day">
                            <option value="day">10日</option>
                            <option value="day">11日</option>
                            <option value="day">12日</option>
                            <option value="day">13日</option>
                            </select></td></tr>
                    <tr><td>学历</td><td><select name="education">
                            <option value="本科">本科</option>
                            <option value="硕士">硕士</option>
                            <option value="博士">博士</option>
                            <option value="小学">小学</option>
                            </select></td></tr>
                      <tr><td>职业</td><td><select name="vocation">
                            <option value="医生">医生</option>
                            <option value="教师">教师</option>
                            <option value="司机">司机</option>
                            <option value="白领">白领</option>
                            </select></td></tr>
                    <tr><td>地址</td><td><input type="text" name="address"></td></tr>
                    <tr><td>手机号</td><td><input type="text" name="phone"></td></tr>


                </table>
            </form>
            </div>   
            <div class="inforline2"></div> 
                <div class="infor2"><p>兴趣爱好</p></div>
                <div class="inforline3"></div>
                <div class="fuxuankuang">
                    <form>
                        <table>
                                <tr><td>1<input type="checkbox" name=""></td><td>2<input type="checkbox" name=""></td><td>3<input type="checkbox" name=""></td></tr>
                                 <tr><td>4<input type="checkbox" name=""></td><td>5<input type="checkbox" name=""></td><td>6<input type="checkbox" name=""></td></tr>
                                <tr><td>7<input type="checkbox" name=""></td><td>8<input type="checkbox" name=""></td><td>9<input type="checkbox" name=""></td></tr>
                        </table>
                    </form></div>
                    <div class="tijiao">
                            <input type="submit" name="提交" value="保存">
                    </div>


            </div>
        
    </div>
<!--footer-->
    <div class="footer">
        <div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>