<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>收藏</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/colCourse.css">
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
         <div class="line"></div>
        <div class="right">
            <div class="down">
                <select name="allcollect">
                              <option value="1">全部收藏</option>
                              <option value="1"><a href="#">1</a></option>
                              <option value="2"><a href="#">2</a></option>
                              <option value="3"><a href="#">3</a></option>
                              <option value="4"><a href="#">4</a></option>
                </select>

            </div>
           <!-- 收藏内容--> 
            <div class="coll">
                    <form>
                        <table>
                                <tr>
                                    <td>
                                    <div class="one">
                                        <img src="resources/images/timg.jpg">
                                    </div>
                                    <div class="two">
                                        <div class="two1">
                                            <h1>外语</h1>
                                            <p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                        </div>
                                        <div class="two2">
                                            <a href="#"><img src="resources/images/dele.jpg"></a>
                                        </div>
                                    </div>
                                    </td>
                                    <td>
                                       <div class="three">
                                        <img src="resources/images/timg.jpg">
                                    </div>
                                    <div class="four">
                                        <div class="four1">
                                              <h1>外语</h1>
                                            <p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                        </div>
                                        <div class="four2">
                                            <a href="#"><img src="resources/images/dele.jpg"></a>
                                        </div>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                      
                                            <div class="five">
                                            <img src="resources/images/timg.jpg">
                                             </div>
                                            <div class="six">
                                               <div class="six1">
                                                   <h1>外语</h1>
                                                   p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                                </div>
                                                <div   class="six2">
                                                  <a hre ="#"><img src="resources/images/dele.jpg"></a>
                                                </div>
                                              </div>
                                         
                                    </td>
                                    <td>
                                       
                                            <div class="seven">
                                        <img src="resources/images/timg.jpg">
                                    </div>
                                    <div class="eight">
                                        <div class="eight1">
                                              <h1>外语</h1>
                                            <p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                        </div>
                                        <div class="eight2">
                                            <a href="#"><img src="resources/images/dele.jpg"></a>
                                        </div>
                                    </div>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                      
                                            <div class="nine">
                                        <img src="resources/images/timg.jpg">
                                    </div>
                                    <div class="ten">
                                        <div class="ten1">
                                              <h1>外语</h1>
                                            <p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                        </div>
                                        <div class="ten2">
                                            <a href="#"><img src="resources/images/dele.jpg"></a>
                                        </div>
                                    </div>
                                        
                                    </td>
                                    <td>
                                        
                                            <div class="elven">
                                        <img src="resources/images/timg.jpg">
                                    </div>
                                    <div class="twelve">
                                        <div class="twelve1">
                                               <h1>外语</h1>
                                            <p>如果时光无法简洁表达你的想法，那只说明你还不够了解它</p>
                                        </div>
                                        <div class="twelve2">
                                            <a href="#"><img src="resources/images/dele.jpg"></a>
                                        </div>
                                    </div>
                                        </div>
                                    </td>
                                </tr>
                        </table>
                    </form>
            </div>
            <!--分页-->
            <div class="last">
                        <div class="list">
                            
                            
                            <a href="#"><</a>  
                            <a href="#">1</a>  
                            <a href="#">2</a>  
                            <a href="#">3</a>  
                            <a href="#">4</a>  
                            <a href="#">...</a>  
                            <a href="#">20</a>  
                            <a href="#">></a>  
                         
                                  
                        </div>


            </div>
        </div>
    </div>
<!--footer-->
    <div class="footer">
        <div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>