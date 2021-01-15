<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>教育机构</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/education.css">
    <script src='${ctx }/static/frontjs/jquery-1.9.0.min.js'></script>
    <script src="${ctx }/static/frontjs/html5shiv.min.js"></script>
    <script src="${ctx }/static/frontjs/home.js"></script>
</head>
<SCRIPT>
   function showmenu1(){menu1.style.display= "block";   }
function hidmenu1(){menu1.style.display = "none";}
   function showmenu2(){menu2.style.display= "block";   }
function hidmenu2(){menu2.style.display = "none";}
   function showmenu3(){menu3.style.display= "block";   }
function hidmenu3(){menu3.style.display = "none";}
   function showmenu4(){menu4.style.display= "block";   }
function hidmenu4(){menu4.style.display = "none";}
document.onclick=function(){
    hidmenu1();
    hidmenu2();
    hidmenu3();
    hidmenu4();
}
  </SCRIPT>
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
                    <input type="text" placeholder="搜索">
                    <div class="s_img">
                        <a href="#"><img src="${ctx }/static/frontimages/sousuo.png"></a> 
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
				<a href="../organization/orgLogin.jsp">培训机构登录</a>
			</div>
		</div>
	</div>	
<!--body-->
    <div class="body">
                <div class="first">
                    <div class="firstroom">
                            <div class="eduimg">
                                    <img src="${ctx }/static/frontimages/timg0.jpg" >
                            </div>   
                            <div class="edutext1">
                                    <p>${sellerInfo.sellerName }</p>
                                     <div class="edutext2">
                                    <p>我们的宣言：XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                                    </div>
                            </div>                         
                            <div class="count">
                                    <p>1234</p>
                            </div>
                            <div class="zan">
                                        <div class="ai">
                                        <a href="#">❤</a>
                                        </div>
                            </div>
                    </div>
                </div>
                <div class="line">
                    <div class="linet">

                    </div>
                </div>
                <div class="second">
                        <div class="room">
                        <div class="hand">
                               <p> 机构故事 </p>
                        </div>
                        <div class="smallline">
                                <div class="smalllinet">

                                </div>
                        </div>
                        <div class="content">
                                    <p>${sellerInfo.brief}</p>
                        </div>
                    </div>
                </div>
                <div class="third">
                        <div class="tleft">
                                    <table>
                                    <c:forEach var="courseType" items="${seller }">
                                        <tr>
                                        <td>
                                            <div class="add" >
                                                <div class="addimg">
                                             	</div>
                                            	<div class="wenzi">
                                                	<a href="${ctx }/sellerInfo/type?sellerId=${sellerInfo.sellerID }&sellerCourseTypeID=${courseType.sellerCourseTypeID}">
                                                	<p>${courseType.courseTypeName2}</p></a>                                             	
                                             	</div>
                                           </div>
                                       </td>
                                       </tr>
                                    </c:forEach>
                                    </table>
                        </div>
                        <div class="tline">
                        </div>
                        <div class="tright">
                                                <div class="one">
                                                        <p>课程</p>
                                                </div>
                                                <div class="two">
                                                    <div class="twoline">
                                                    </div>
                                                </div>
                                                <div class="three">
                                                             <table>
																	<c:forEach var="list" items="${list }">
																		<tr><td>
																		<div class="conimg">
																		<c:set var="url" value="${list.introductionImg1}"/>
					                                             		<img src="${ctx }/static/images/${url}">
					                                             		</div>
					                                             		<div class="context"><a>${list.courseName }</a></div></td></tr>
																	</c:forEach>                                                              
                                                             </table>       
                                                </div>
                                                <div class="four">
                                                    <div class="list">                    
                                                       	<a href="findSeller?sellerInfoId=${sellerInfo.sellerID}&pageNum=${pageNum-1}"><</a>  
                                                       	<c:forEach begin="1" end="${pageCount}" step="1" var="i">
            												<a href="findSeller?sellerInfoId=${sellerInfo.sellerID}&pageNum=${i}">${i}</a>
            											</c:forEach>
                                                       	<a href="findSeller?sellerInfoId=${sellerInfo.sellerID}&pageNum=${pageNum+1}">></a>  
                                                    </div>                                                                
                                                </div>
                        </div>
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