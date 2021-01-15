<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta charset="utf-8">
	<script src='${ctx }/static/frontjs/jquery-1.9.0.min.js'></script>
	<script src="${ctx }/static/frontjs/html5shiv.min.js"></script>
	<script src="${ctx }/static/frontjs/home.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/home.css">
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
				<a href="../course/listAllCourse?coursePageIndex=1">全部课程</a>
			</div>
			<div class="allclass">
				<a href="../course/showCollections?collectionsPageIndex=1">个人中心</a>
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
				    <form action="${ctx }/userLogin/login.do" method="post">
					    <input type="text" name="email" id="email" value="" placeholder="请输入邮箱" class="email-a" onblur="check_box1()" />
					    <div class="bcde" align="center"></div>
					    <input type="password" name="password" id="pwd_login" value="" placeholder="请输入密码" onblur="check_box2()"/>
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
					<form action="${ctx }/userInfo/save.do" method="post">
						<input type="text" name="email" id="email_regist" value="" placeholder="请输入邮箱" class="email-b" onblur="check_box()" />
						<div class="bcd" align="center"></div>
						<input type="password" name="password" id="pwd_regist" value="" placeholder="密码为6-16位包含数字、字母、下划线" onblur="check()" />
						<div id="spinfo2" align="center"></div>
						<input type="password" name="password2" id="pwd_pwd" value="" placeholder="再次输入密码" onblur="check_again()">
						<div id="spinfo3" align="center"></div>
						<input type="text" name="username" id="petname" value="" placeholder="昵称"/>
						<input type="text" name="phone" id="phone" value="" placeholder="手机" onblur="Mous()" />
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
		<!--幻灯片-->
		<section class="slider-container">
			<ul id="slider" class="slider-wrapper">
				<li class="slide-current">
					<img src="${ctx }/static/frontimages/1.jpg" alt="Slider Imagen 1">
					<div class="caption">
						<h3 class="caption-title">甘蔗推荐网简介：</h3>
						<p>***********************************************************************</p>
					</div>
				</li>

				<li>
					<img src="${ctx }/static/frontimages/2.jpg" alt="Slider Imagen 1">
					<div class="caption">
						<h3 class="caption-title">甘蔗推荐网简介：</h3>
						<p>***********************************************************************</p>
					</div>
				</li>

				<li>
					<img src="${ctx }/static/frontimages/1.jpg" alt="Slider Imagen 1">
					<div class="caption">
						<h3 class="caption-title">甘蔗推荐网简介：</h3>
						<p>***********************************************************************</p>
					</div>
				</li>

				<li>
					<img src="${ctx }/static/frontimages/2.jpg" alt="Slider Imagen 1">
					<div class="caption">
						<h3 class="caption-title">甘蔗推荐网简介：</h3>
						<p>***********************************************************************</p>
					</div>
				</li>
			</ul>

			<ul id="slider-controls" class="slider-controls"></ul>

		</section>
		
		
		<!--猜你喜欢块-->
		<div class="first">
			<img src="${ctx }/static/frontimages/love.jpg" alt="love" height="25px"/><h1>猜你喜欢</h1>
			<div class="first_love">
			<c:forEach items="${recommend }" var="s">
				<a href="../course/courseDetails?courseID=${s.courseID }"><img src="${ctx }/static/images/${s.introductionImg1}" alt="" width="270px" height="165px" class="recommend"/></a>
			</c:forEach>
			</div>
		</div>
		
		
		<!--热门综合推荐块-->
		<div class="second">
			<img src="${ctx }/static/frontimages/hot.jpg" alt="hot" height="25px"/><h1>热门综合推荐</h1>
			<c:forEach items="${Sixrecommend }" var="six">
			<div class="second_hot">
				<div class="hot">
					<img src="${ctx }/static/images/${six.introductionImg1}" alt="hot" height="115px"/>
					<a href="../course/courseDetails?courseID=${six.courseID }"><h3>${six.courseName }</h3></a>
					<p>${six.courseBrief}</p>
				</div>
			</div>
			</c:forEach>
		</div>
		
		
		<!--课程分类块-->
		<table class="project" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="6" class="project_1">
					<img src="${ctx }/static/frontimages/cloud.jpg" alt="cloud" height="25px"/><h1>课程分类</h1>
				</td>
			</tr>
			
			
			<tr>
				<td colspan="6" class="project_2">
					<h2>${courseType1.courseTypeName }</h2>
					 <ul>
                           <c:forEach items="${publicCourseTypeLists1 }" var="publicCourseType1">
                           <li><a href="../course/listAllCourseByType?coursePageIndex=1&publicCourseTypeID=${publicCourseType1.publicTypeId }">${publicCourseType1.publicTypeName }</a></li>
                           </c:forEach>
                           </ul>
				</td>
			</tr>
			<tr>
			
			<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
			<c:forEach  items="${courseList1}" begin="0" end="4" var="courseList1" varStatus="i">		
				<td class="project_4"><a href="../course/courseDetails?courseID=${courseList1.courseID }"><img src="${ctx }/static/${courseList1.introductionImg1}" alt="project"/></a></td>
		    </c:forEach>
			</tr>
			<tr>
			 <c:forEach  items="${courseList1}" begin="0" end="4" var="courseList1" varStatus="i">
				<td class="project_5">
				<div class="p"> 
				<a href="../course/courseDetails?courseID=${courseList1.courseID }">
				<p>${courseList1.courseName }</p><p>${courseList1.sellerInfo.sellerName }</p>
	            </a></div></td>
			</c:forEach>
			</tr>

            <!-- 第二大类 -->
			<tr>
				<td colspan="6" class="project_2">
					<h2>${courseType2.courseTypeName }</h2>
					 <ul>
                           <c:forEach items="${publicCourseTypeLists2 }" var="publicCourseType2">
                           <li><a href="../course/listAllCourseByType?coursePageIndex=1&publicCourseTypeID=${publicCourseType2.publicTypeId }">${publicCourseType2.publicTypeName }</a></li>
                           </c:forEach>
                           </ul>
				</td>
			</tr>
			<tr>
			
			<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
			<c:forEach  items="${courseList2}" begin="0" end="4" var="courseList2" varStatus="i">		
				<td class="project_4"><a href="../course/courseDetails?courseID=${courseList2.courseID }"><img src="${ctx }/static/${courseList2.introductionImg1}" alt="project"/></a></td>
		    </c:forEach>
			</tr>
			<tr>
			 <c:forEach  items="${courseList2}" begin="0" end="4" var="courseList2" varStatus="i">
				<td class="project_5">
				<div class="p"> 
				<a href="../course/courseDetails?courseID=${courseList2.courseID }">
				<p>${courseList2.courseName }</p><p>${courseList2.sellerInfo.sellerName }</p>
	            </a></div></td>
			</c:forEach>
			</tr>
	       
	       
	       <!-- 第三大类 -->
	       <tr>
				<td colspan="6" class="project_2">
					<h2>${courseType3.courseTypeName }</h2>
					 <ul>
                           <c:forEach items="${publicCourseTypeLists3 }" var="publicCourseType3">
                           <li><a href="../course/listAllCourseByType?coursePageIndex=1&publicCourseTypeID=${publicCourseType3.publicTypeId }">${publicCourseType3.publicTypeName }</a></li>
                           </c:forEach>
                           </ul>
				</td>
			</tr>
			<tr>
			
			<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
			<c:forEach  items="${courseList3}" begin="0" end="4" var="courseList3" varStatus="i">		
				<td class="project_4"><a href="../course/courseDetails?courseID=${courseList3.courseID }"><img src="${ctx }/static/${courseList3.introductionImg1}" alt="project"/></a></td>
		    </c:forEach>
			</tr>
			<tr>
			 <c:forEach  items="${courseList3}" begin="0" end="4" var="courseList3" varStatus="i">
				<td class="project_5">
				<div class="p"> 
				<a href="../course/courseDetails?courseID=${courseList3.courseID }">
				<p>${courseList3.courseName }</p><p>${courseList3.sellerInfo.sellerName }</p>
	            </a></div></td>
			</c:forEach>
			</tr>
			<!-- 第四大类 -->
			<tr class="changeTr1" style="display: none;">
				<td colspan="6" class="project_2">
					<h2>${courseType4.courseTypeName }</h2>
					 <ul>
                           <c:forEach items="${publicCourseTypeLists4 }" var="publicCourseType4">
                           <li><a href="../course/listAllCourseByType?coursePageIndex=1&publicCourseTypeID=${publicCourseType4.publicTypeId }">${publicCourseType4.publicTypeName }</a></li>
                           </c:forEach>
                           </ul>
				</td>
			</tr>
			<tr class="changeTr1" style="display: none;">
			
			<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
			<c:forEach  items="${courseList4}" begin="0" end="4" var="courseList4" varStatus="i">		
				<td class="project_4"><a href="../course/courseDetails?courseID=${courseList4.courseID }"><img src="${ctx }/static/${courseList4.introductionImg1}" alt="project"/></a></td>
		    </c:forEach>
			</tr>
			<tr class="changeTr1" style="display: none;">
			 <c:forEach  items="${courseList4}" begin="0" end="4" var="courseList4" varStatus="i">
				<td class="project_5">
				<div class="p"> 
				<a href="../course/courseDetails?courseID=${courseList4.courseID }">
				<p>${courseList4.courseName }</p><p>${courseList4.sellerInfo.sellerName }</p>
	            </a></div></td>
			</c:forEach>
			</tr>
			<!-- 第五大类 -->
			<tr class="changeTr1" style="display: none;">
				<td colspan="6" class="project_2">
					<h2>${courseType5.courseTypeName }</h2>
					 <ul>
                           <c:forEach items="${publicCourseTypeLists5 }" var="publicCourseType5">
                           <li><a href="../course/listAllCourseByType?coursePageIndex=1&publicCourseTypeID=${publicCourseType5.publicTypeId }">${publicCourseType5.publicTypeName }</a></li>
                           </c:forEach>
                           </ul>
				</td>
			</tr>
			<tr class="changeTr1" style="display: none;">
			
			<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
			<c:forEach  items="${courseList5}" begin="0" end="4" var="courseList5" varStatus="i">		
				<td class="project_4"><a href="../course/courseDetails?courseID=${courseList5.courseID }"><img src="${ctx }/static/${courseList5.introductionImg1}" alt="project"/></a></td>
		    </c:forEach>
			</tr>
			<tr class="changeTr1" style="display: none;">
			 <c:forEach  items="${courseList5}" begin="0" end="4" var="courseList5" varStatus="i">
				<td class="project_5">
				<div class="p"> 
				<a href="../course/courseDetails?courseID=${courseList5.courseID }">
				<p>${courseList5.courseName }</p><p>${courseList5.sellerInfo.sellerName }</p>
	            </a></div></td>
			</c:forEach>
			</tr>
			<!--  tr>
				<td colspan="6" class="project_2">
					<h2>经济管理</h2>
					<ul>
						<li><a href="#">金融分析师</a></li>
						<li><a href="#">工商管理</a></li>
						<li><a href="#">注册会计师</a></li>
						<li><a href="#">电子商务</a></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
			</tr>
			<tr>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
			</tr>
			
			<tr>
				<td colspan="6" class="project_2">
					<h2>健身</h2>
					<ul>
						<li><a href="#">器械</a></li>
						<li><a href="#">一对一</a></li>
						<li><a href="#">健身操</a></li>
						<li><a href="#">瑜伽</a></li>
						<li><a href="#">篮球</a></li>
						<li><a href="#">高尔夫</a></li>
						<li><a href="#">游泳</a></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
			</tr>
			<tr>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
			</tr>
			
			<tr class="changeTr1" style="display: none;">
				<td colspan="6" class="project_2">
					<h2>折叠</h2>
					<ul>
						<li><a href="#">计算机基础</a></li>
						<li><a href="#">编程基础</a></li>
						<li><a href="#">计算机组成</a></li>
						<li><a href="#">C语言入门</a></li>
						<li><a href="#">Java工程师</a></li>
					</ul>
				</td>
			</tr>
			<tr class="changeTr1" style="display: none;">
				<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
			</tr>
			<tr class="changeTr1" style="display: none;">
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
			</tr>
			<tr class="changeTr1" style="display: none;">
				<td colspan="6" class="project_2">
					<h2>折叠</h2>
					<ul>
						<li><a href="#">计算机基础</a></li>
						<li><a href="#">编程基础</a></li>
						<li><a href="#">计算机组成</a></li>
						<li><a href="#">C语言入门</a></li>
						<li><a href="#">Java工程师</a></li>
					</ul>
				</td>
			</tr>
			<tr class="changeTr1" style="display: none;">
				<td rowspan="2" class="project_3"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
				<td class="project_4"><a href="#"><img src="${ctx }/static/frontimages/c.jpg" alt="project"/></a></td>
			</tr>
			<tr class="changeTr1" style="display: none;">
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
				<td class="project_5"><div class="p"><a href="#"><p>C语言</p><p>XXXXXXXX教育</p></a></div></td>
			</tr-->
			<tr>
				<td rowspan="6" class="project_6"><p id="zhe1">展开剩余分类</p><img src="${ctx }/static/frontimages/triangle.jpg" alt="triangle" id="triangle1"/></td>
			</tr>
		</table>
		<!--培训机构块--> 
		<div class="last">
			<div class="last_1">
				<img src="${ctx }/static/frontimages/plane.jpg" alt="plane" class="plane"/><h1>培训机构</h1>
				<img src="${ctx }/static/frontimages/triangle.jpg" alt="triangle" id="triangle2"/><h2 id="zhe2">展开查看全部培训机构</h2>
			</div>
			<h2 class="last_2">为您推荐</h2>
			<table cellpadding="25" cellspacing="25" class="last_3">
			<tbody>
				<c:forEach var="sellerInfo"  items="${showOrg}" varStatus="num" begin="0" end="9">
						<c:if test="${num.count eq 1 ||(num.count-1)%5 eq 0 }">
							<tr>
						</c:if>
							<c:if test="${num.index % 2 == 0}"><td class="black">
								<a href="${ctx }/sellerInfo/findSeller?sellerInfoId=${sellerInfo.sellerID }">${sellerInfo.sellerName}</a></td>
							</c:if>
					        <c:if test="${num.index % 2 == 1}"><td class="white">
					        	<a href="${ctx }/sellerInfo/findSeller?sellerInfoId=${sellerInfo.sellerID }">${sellerInfo.sellerName}</a></td>
							</c:if>
						<c:if test="${num.count % 5 eq 0 ||num.count eq 5 }">
							</tr>
						</c:if>  
				</c:forEach>  
			</tbody>
				<c:forEach var="sellerInfo"  items="${showOrg}" varStatus="num" begin="10">
					<c:if test="${num.count eq 1 ||(num.count-1)%5 eq 0 }">
						<tr class="changeTr2" style="display:none;">
					</c:if>
					<c:if test="${num.index % 2 == 0}"><td class="black">
								<a href="${ctx }/sellerInfo/findSeller?sellerInfoId=${sellerInfo.sellerID }">${sellerInfo.sellerName}</a></td>
							</c:if>
					        <c:if test="${num.index % 2 == 1}"><td class="white">
					        	<a href="${ctx }/sellerInfo/findSeller?sellerInfoId=${sellerInfo.sellerID }">${sellerInfo.sellerName}</a></td>
							</c:if>
						<c:if test="${num.count % 5 eq 0 ||num.count eq 5 }">
							</tr>
						</c:if>  
				</c:forEach>
			</table>
		</div>
		<br style="clear:both;">
	</div>
</div>
<div id="backgroundImg"></div>
<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>