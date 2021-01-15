<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/personinfor.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/person-complete.css">
    <script type="text/javascript" src="${ctx }/static/frontjs/xiala.js"></script> 
    <script type="text/javascript" src="${ctx }/static/frontjs/birthday.js"></script>
    <script type="text/javascript" src="${ctx }/static/js/address.js"></script> 
    <script src='${ctx }/static/frontjs/jquery-1.9.0.min.js'></script>
    <script src="${ctx }/static/frontjs/html5shiv.min.js"></script>
    <script src="${ctx }/static/frontjs/home.js"></script>
    <script>
    	//单选框初始化
        function initradio(rName,rValue){
            var rObj = document.getElementsByName(rName);
                for(var i = 0;i < rObj.length;i++){
                    if(rObj[i].value == rValue){
                        rObj[i].checked =  'checked';
                    }
                }
        }
        //下拉菜单回选/年份
        function change1(idname,idvalue){
			var address = idvalue;
		    var a1 = document.getElementById(idname);
		    for(i = 0;i<=a1.length;i++){
		        if(a1.options[i].value == address){
		        	a1.options[i].selected = true;
		        	break;
		        }
		    }
		}
        //出现文件上传界面
        function tempClick(){  
            //IE浏览器实现点击图片出现文件上传界面  
            document.getElementById('img_1').click();
            document.getElementById('touxiang').submit()
        } 
        //预览图片  
        function PreviewImg(obj) {
            var newPreview = document.getElementById("img_2");   
            var imgPath = getPath(obj);
            /* var imgPath = obj.value; */
            alert(imgPath);
            if( !obj.value.match( /.jpg|.gif|.png|.bmp/i ) ){  
                alert("图片格式错误！");  
                return false;  
            }  
              
            newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";      
            newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgPath; 
        }    
       //得到图片绝对路径  
        function getPath(obj){   
            if(obj) {     
                if(navigator.userAgent.indexOf("MSIE")>0) {    
                    obj.select();     
                    //IE下取得图片的本地路径     
                    return document.selection.createRange().text;    
                } else if(isFirefox=navigator.userAgent.indexOf("Firefox")>0) {    
                     if (obj.files) {  // Firefox下取得的是图片的数据     
                        return files.item(0).getAsDataURL();     
                     }     
                     return obj.value;     
                 }    
                 return obj.value;     
            }     
        } 
    </script>
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
        <div class="left">
        	<div class="personimg">
            <!-- 上传头像 -->
            <form action="${pageContext.request.contextPath}/userInfo/userpic" method="post" id="touxiang" enctype="multipart/form-data">
	            <img id="img_2" src="${userPicture }" onclick="tempClick()">
	            <div><input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;" size="1" id="img_1" name="main_img" onchange="PreviewImg(main_img)"></div>
            </form>
            </div>
            <div class="nickname"><p>${user.userName }</p></div>
            <div class="reinfor"><a href="${pageContext.request.contextPath}/publicCourseType/list1">修改个人信息</a></div>
            <div class="collect"><a href="#">我的收藏</a></div>
        </div>
        <div class="line"></div>
        <div class="right">
            <div class="infor"><p>个人信息</p></div>
            <div class="information">
            <form action="${pageContext.request.contextPath}/userInfo/edit" method="post">
            <div class="top_form">
            	<div class="username">
                    <span>昵称：</span>
                    <input type="text" name="userName" placeholder="${user.userName }"/>
                </div>
                <div class="useremail">
                    <span>邮箱：</span>
                    <input type="text" name="userEmail" placeholder="${user.userEmail }"/>
                </div>
                <div class="sex">
                    <span>性别：</span>
                    <input type="radio" value="0" name="userGender"/>男
                    <input type="radio" value="1" name="userGender"/>女
                </div>
                <div class="age">
                    <span>生日：</span>
                    <select name="birthday" id="year" onchange="changeday()">
                        <option value="${bir[0] }">${bir[0] }</option>
                    </select>
                    <select name="birthday" id="month" onchange="changeday()">
                        <option value="${bir[1] }">${bir[1] }</option>
                    </select>
                    <select name="birthday" id="day">
                        <option value="${bir[2] }">${bir[2] }</option>
                    </select>
                </div>
                <div class="edurank">
                    <span>学历：</span>
                    <select name="userEducation">
                        <option value="${user.userEducation }" selected="selected">${user.userEducation }</option>
                        <option value="小学">小学</option>
                        <option value="初中">初中</option>
                        <option value="高中">高中</option>
                        <option value="本科">本科</option>
                        <option value="专科">专科</option>
                        <option value="研究生">研究生</option>
                        <option value="博士生及以上">博士生及以上</option>
                    </select>
                </div>
                <div class="work">
                    <span>职业：</span>
                    <select name="userWork">
                        <option value="${user.userWork }" selected="selected">${user.userWork }</option>
                        <option value="学生">学生</option>
                        <option value="会计">会计</option>
                        <option value="IT">IT</option>
                        <option value="医生">医生</option>
                        <option value="老师">老师</option>
                        <option value="律师">律师</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
                <div class="address">
                    <span>地址：</span>
                    <select id="cmbProvince" name="address_province"></select>    
                    <select id="cmbCity" name="address_city"></select>    
                    <select id="cmbArea" name="address_area"></select>    
                    <script type="text/javascript">    
                        addressInit('cmbProvince', 'cmbCity', 'cmbArea');    
                    </script>
                </div>
                <div class="userphone">
                    <span>手机号：</span>
                    <input type="text" name="userPhoneNumber" placeholder="${user.userPhoneNumber }"/>
                </div>
            </div>
            <div class="top_select">
                <div class="infor"><p>兴趣爱好</p></div>
                <div class="mixselect">
	                <c:forEach items="${listPublicTypeP }" var="courseType">
	                		<label class="demo--label">	
								<input class="demo--radio" type="checkbox" name="publicTypeName" value="${courseType.publicTypeName }"/>
		                        <span class="demo--checkbox demo--radioInput"></span>${courseType.publicTypeName }
		                    </label>            	
	                </c:forEach>
                </div>
                <div class="tijiao">
                    <input type="submit" name="提交" value="保存">
                </div>
            </div>
        	</form>   
    		</div>
    	</div>
    </div>
    <div id="backgroundImg"></div>
<!-- 性别初始化单选 -->
<script>
	//性别初始化
    initradio('userGender', '${user.userGender}' );
	//下拉菜单年份回选
	change1('cmbProvince', '${user.address_province}' );
</script>
<!-- 兴趣爱好复选框回选 -->
<script>
$(function(){
	var boxObj = $("input:checkbox[name='publicTypeName']");  
    var cbs = '${checkboxs}';
    var cb = cbs.split(',');  
    $.each(cb, function(index, c){  
       boxObj.each(function () {  
            if($(this).val() == c) {  
               $(this).attr("checked",true);  
            }  
        });  
    });  
});
</script>
<!--生日下拉框-->
<script type="text/javascript" language="javascript">
    var curdate = new Date();
    var year = document.getElementById("year");
    var month = document.getElementById("month");
    var day = document.getElementById("day");
    //绑定年份月分的默认
    function add() {
        var curyear = curdate.getFullYear();
        var minyear = curyear - 99;
        var maxyear = curyear;
        for (maxyear; maxyear >= minyear; maxyear = maxyear - 1) {
        year.options.add(new Option(maxyear, maxyear));
        }
        for (var mindex = 1; mindex <= 12; mindex++) {
            month.options.add(new Option(mindex, mindex));
        }
    }

    //判断是否是闰年
    function leapyear(intyear) {
        var result = false;
        if (((intyear % 400 == 0) && (intyear % 100 != 0)) || (intyear % 4 == 0)) {
            result = true;
        }
        else {
            result = false;
        }
            return result;
    }
    //绑定天数
    function addday(maxday) {
        day.options.length = 1;
        for (var dindex = 1; dindex <= maxday; dindex++) {
            day.options.add(new Option(dindex, dindex));
        }
    }
    function changeday() {
        if (year.value == null || year.value == "") {
            alert("请先选择年份！");
            return false;
        }
        else {
            if (month.value == 1 || month.value == 3 || month.value == 5 || month.value == 7 || month.value == 8 || month.value == 10 || month.value == 12) {
                addday(31);
            }
            else {
                if (month.value == 4 || month.value == 6 || month.value == 9 || month.value == 11) {
                    addday(30);
                }
                else {
                    if (leapyear(year.value)) {
                        addday(29);
                    }
                    else {
                        addday(28);
                    }
                }
            }
        }
    }
    window.onload = add();
</script>
<!--footer-->
    <div class="footer">
        <div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>