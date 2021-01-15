<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>课程详情页</title>
<link rel="stylesheet" type="text/css"
	href="${ctx }/static/frontcss/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctx }/static/frontcss/courseDetails.css">
<script src='${ctx }/static/frontjs/jquery-1.9.0.min.js'></script>
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
				<a href="../organization/orgLogin.jsp">全部课程</a>
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
				<c:choose>
				<c:when test="${username == null }">
				<!-- 顶部未登录 -->
					<a href="javascript:void(0)" onClick="showBox()">登录</a>
					<a href="javascript:void(0)" onClick="registBox()">注册</a>
				</c:when>
				<c:otherwise>
				<!-- 顶部已登录 -->
					<a href="#" target="_blank"><strong>${username }</strong></a>
					 |<a href="${ctx }/userLogin/outLogin.do">退出</a>
				</c:otherwise>
			</c:choose>
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
				<a href="orgLogin.html">培训机构登录</a>
			</div>
		</div>
	</div>
		<!--body-->
		<div class="body">
			<div class="course_details">
				<div class="videos">
					<video src="${ctx }/static/video/movie.ogg" controls="controls">
					Your browser does not support the video tag. </video>
					<a href="../course/courseDetails?courseID=${courseDetails.courseID }">❤收藏</a>
					<!--弹出消息-->
			<div class="fadeud">
				<p>已收藏</p>
			</div>

				</div>
				<div class="course_info">
					<div class="courseinfos">
						课程名称:<span>${courseDetails.courseName }</span>
					</div>
					<div class="courseinfos">
						所属机构:<span>${sellerInfo.sellerName }</span>
					</div>
					<div class="courseinfos">
						价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:<span>￥${courseDetails.price }</span>
					</div>
					<div class="courseinfos">
						授课教师:<span>${courseDetails.teacher }</span>
					</div>
					<div class="courseinfos">
						联系方式:<span>${courseDetails.phoneNumber }</span>
					</div>
					<div class="courseinfos">
						授课地点:<span>${sellerInfo.address_province }${sellerInfo.address_city }${sellerInfo.address_area }${sellerInfo.address_detail }</span>
					</div>
				</div>
			</div>
			<h3>简介</h3>
			<div class="intro">
				<div class="intro_top">
					<div class="intro_img1">
						<a href="#"><img src="${ctx }/static/${courseDetails.introductionImg1}"
							alt=""></a>
					</div>
					<div class="intro_text1">
						<span> ${courseDetails.courseBrief }
						</span>
					</div>
					<div class="intro_text2">
						<span> 你是否羡慕别人完美的身材，来这里其实你也可以。<br> 健康与优美的邂逅，精彩时尚新生活！<br>
							唯有身材才是你永远的陪伴。<br>
						</span>
					</div>
					<div class="intro_img2">
						<a href="#"><img src="${ctx }/static/frontimages/lidejianshen2.jpg"
							alt=""></a>
					</div>
					<div class="intro_text3">
						<span>健于行,始于乐;爱于心,益于民。将运动进行到底!</span>
					</div>
				</div>
			</div>
				
				
					<div class="evaluate_top">
						<span>评价</span> <a href="../course/courseDetailsByEvaluateRender?courseID=${courseDetails.courseID }&evaluatePageIndex=1&render=1" class="evaluateRender">好评</a>
						<a href="../course/courseDetailsByEvaluateRender?courseID=${courseDetails.courseID }&evaluatePageIndex=1&render=2">中评</a> 
						<a href="../course/courseDetailsByEvaluateRender?courseID=${courseDetails.courseID }&evaluatePageIndex=1&render=3">差评</a>
						<a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=1">其他</a>
					</div>
					
					<c:forEach var="evaluateList"  items="${evaluateList }">
					<div class="evaluate_content">
						<div class="evaluate_content_person">
							<img src="${ctx }/static/${evaluateList.userInfo.userPicture}" alt="" /><br>
							<span>${evaluateList.userInfo.userName }</span>
						</div>
						<div class="evaluate_content_text">
							<span>${evaluateList.content }</span>
						</div>
					</div>
					</c:forEach>

					<div class="evaluate_page">
						<ul class="evaluate_page_list">
							<li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=1">首页</a></li>
							<li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=${evaluatePageIndex-1}">上一页</a></li>
							<!--li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=${evaluatePageIndex+1}">下一页</a></li-->
                          <c:if test="${evaluatePageIndex<evaluatePageCount}">
                          <li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=${evaluatePageIndex+1}">下一页</a></li>
                          </c:if>
                          <c:if test="${evaluatePageIndex>=evaluatePageCount}">
                          <li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=${evaluatePageCount }">下一页</a></li>
                          </c:if>
						<li><a href="../course/courseDetails?courseID=${courseDetails.courseID }&evaluatePageIndex=${evaluatePageCount}">尾页</a></li>
						</ul>
					</div>
								<div class="evaluate">
				<form action="../course/savaEvaluate">
				 <div class="mixselect">
                    <label class="demo--label">
                        <input class="demo--radio" type="radio" name="render" value="1">
                        <span class="demo--checkbox demo--radioInput"></span>好评
                    </label>
                    <label class="demo--label">
                        <input class="demo--radio" type="radio" name="render" value="2">
                        <span class="demo--checkbox demo--radioInput"></span>中评
                    </label>
                    <label class="demo--label">
                        <input class="demo--radio" type="radio" name="render" value="3">
                        <span class="demo--checkbox demo--radioInput"></span>差评
                    </label>
                 </div>
					<div class="evaluate_write">
						<div class="evaluate_write_textarea">
							<textarea cols="100" rows="10" name="content"></textarea>
						</div>
					    <div>
					    
					    </div>
						<div class="evaluate_write_submit">
							<input type="submit" value="发表" />
						</div>
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
<script>
function updatecar(obj){
	console.log(obj.getAttribute('goodID'));
	var goodID = obj.getAttribute('goodID');
	$.ajax({
		type:"get",
		url:"http://datainfo.duapp.com/shopdata/updatecar.php",
		data:{userID:localStorage.getItem('userID'),goodsID:goodID,number:1},
		success:function(data){
			if(data == 0){
				console.log(0);
				$('.fadeudfail').fadeIn();
				setTimeout(function(){$('.fadeudfail').fadeOut();},1500);
			}else{
				console.log(1);
				$('.fadeud').fadeIn();
				setTimeout(function(){$('.fadeud').fadeOut();},1500);
			}
		},
		error:function(err){
			console.log(err);
		}
	});
}
window.onload = function(){

// 绑定事件加点击样式
var adds = document.getElementsByClassName('addevent');
console.log(adds);
for(var i = 0; i < adds.length; i++){
	(function(i){
		adds[i].addEventListener('touchstart', function () { });
		adds[i].addEventListener('touchstop', function () { });
	}(i))
}
}
</script>
</html>