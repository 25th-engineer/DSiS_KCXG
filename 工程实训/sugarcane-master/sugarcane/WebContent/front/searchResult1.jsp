<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/search.css">
<script src="${ctx }/static/frontjs/html5shiv.min.js"></script>
<script src="${ctx }/static/frontjs/home.js"></script>
<script src="${ctx }/static/frontjs/jquery-1.9.0.min.js"></script>
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
                <a href="home.html">首页</a>
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
                        <input type="text" name="email" id="email" value="" placeholder="请输入邮箱" class="abcd" onblur="check_box1()" />
                        <div class="bcde" align="center"></div>
                        <input type="password" name="" id="pwd_login" value="" placeholder="请输入密码" onblur="check_box2()"/>
                        <div class="error_pwd" align="center"></div>
                        <input type="submit" name="" id="" value="登录" class="btn" />
                        <input type="button" name="" id="forgetPwd" value="忘记密码?" class="">
                        <input type="button" name="" id="noAccount" value="没有账号?去注册" class="">
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
                        <input type="text" name="" id="email" value="" placeholder="请输入邮箱" class="abc" onblur="check_box()" />
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
    <div id="backgroundImg"></div>
<!--body-->
<div class="body">
    <div class="result">共找到<span style="font-weight:bolder;color:#9ACD32">${totalNumber1}</span>门包含"<span style="color:#9ACD32;font-weight:bolder">${sellerName}</span>"关键字的课程</div>
        <div class="body_right">
            <div class="righttwo">
            <c:forEach items="${sellerSearcher }" var="s">
                <div class="righttwotable">
                    <div class="pic">
                        <img src="${ctx }/static/frontimages/zhuolinsheji.jpg">
                    </div>
                    <div class="h3"><h3><a href="../course/courseDetails?courseID=${s.id }">${s.title }</a></h3></div>
                    <div class="p">
                        <p>${s.brief }</p>
                    </div>
                    <div class="others"><span>浏览xxx次</span></div>
                </div>
            </c:forEach>      
            </div>
        </div>
			<div class="rightthree">
                <ul class="pager">
                  <li><a href="../search/searchByCourse?currentPage=1&searchName=${sellerName }">首页</a></li>
                  <li><a href="../search/searchByCourse?currentPage=${currentPage-1 }&searchName=${sellerName }">上一页</a></li>
                  <li>
						<c:forEach begin="1" end="${pageIndex1 }" var="i" step="1">
							<a href="../search/searchByCourse?currentPage=${i}&searchName=${sellerName }">${i}</a>
						</c:forEach>
                  </li>
                  <li><a href="../search/searchByCourse?currentPage=${currentPage+1 }&searchName=${sellerName }">下一页</a></li>
                  <li><a href="../search/searchByCourse?currentPage=100&searchName=${sellerName }">尾页</a></li>
                </ul>
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