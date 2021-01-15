<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教育机构</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/education.css">
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
}
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
                <div class="first">

                    <div class="firstroom">
                            <div class="eduimg">
                                    <img src="resources/images/timg.jpg" >
                            </div>   

                            <div class="edutext1">
                                    <p>XXXXX教育</p>
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
                                    <p>如果你无法简洁的表达你的想法，那只说明你还不够了解它。如果你无法简洁的表达你的想法，那只说明你还不够了解它。如果你无法简洁的表达你的想法，那只说明你还不够了解它。如果你无法简洁的表达你的想法，那只说明你还不够了解它。如果你无法简洁的表达你的想法，那只说明你还不够了解它。</p>
                        </div>
                    </div>

                </div>
                <div class="third">
                        <div class="tleft">
                                    <table>
                                        <tr><td>
                                            <div class="add" >
                                                <div class="addimg">
                                             <a href="javascript:showmenu1()">  <img src="resources/images/add.jpg"></a>
                                                </div>
                                             <div class="wenzi">
                                                <a href="#"><p>语言</p></a>
                                            </div>
                                            </div>
                                            <div class="xiala ">
                                            <div  id="menu1">
                                                <a href="#">给我留言</a><br>
                                                <a href="#">在线聊天</a><br>
                                                <a href="#">网上图片</a><br>
                                                <a href="#">关于我们</a><br>
                                            </div>
                                        </div></td></tr>
                                         <tr><td>
                                            <div class="add" >
                                                <div class="addimg">
                                             <a href="javascript:showmenu2()">  <img src="resources/images/add.jpg"></a>
                                                </div>
                                             <div class="wenzi">
                                                <a href="#"><p>语言</p></a>
                                            </div>
                                            </div>
                                            <div class="xiala ">
                                            <div  id="menu2">
                                                <a href="#">给我留言</a><br>
                                                <a href="#">在线聊天</a><br>
                                                <a href="#">网上图片</a><br>
                                                <a href="#">关于我们</a><br>
                                            </div>
                                        </div></td></tr>
                                         <tr><td>
                                            <div class="add" >
                                                <div class="addimg">
                                             <a href="javascript:showmenu3()">  <img src="resources/images/add.jpg"></a>
                                                </div>
                                             <div class="wenzi">
                                                <a href="#"><p>语言</p></a>
                                            </div>
                                            </div>
                                            <div class="xiala ">
                                            <div  id="menu3">
                                                <a href="#">给我留言</a><br>
                                                <a href="#">在线聊天</a><br>
                                                <a href="#">网上图片</a><br>
                                                <a href="#">关于我们</a><br>
                                            </div>
                                        </div></td></tr>
                                         <tr><td>
                                            <div class="add" >
                                                <div class="addimg">
                                             <a href="javascript:showmenu4()">  <img src="resources/images/add.jpg"></a>
                                                </div>
                                             <div class="wenzi">
                                                <a href="#"><p>语言</p></a>
                                            </div>
                                            </div>
                                            <div class="xiala ">
                                            <div  id="menu4">
                                                <a href="#">给我留言</a><br>
                                                <a href="#">在线聊天</a><br>
                                                <a href="#">网上图片</a><br>
                                                <a href="#">关于我们</a><br>
                                            </div>
                                        </div></td></tr>
                                    

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

                                                                    <tr><td><div class="conimg"><img src="resources/images/timg.jpg"></div><div class="context"><a href="#">如果你无法简洁的表达你的想法，那只说明你还不够了解它。</a></div></td></tr> 
                                                                    <tr><td><div class="conimg1"><img src="resources/images/timg.jpg"></div><div class="context1"><a href="#">如果你无法简洁的表达你的想法，那只说明你还不够了解它。</a></div></td></tr> 
                                                                    <tr><td><div class="conimg2"><img src="resources/images/timg.jpg"></div><div class="context2"><a href="#">如果你无法简洁的表达你的想法，那只说明你还不够了解它。</a></div></td></tr> 
                                                                    <tr><td><div class="conimg3"><img src="resources/images/timg.jpg"></div><div class="context3"><a href="#">如果你无法简洁的表达你的想法，那只说明你还不够了解它。</a></div></td></tr> 
                                                                    <tr><td><div class="conimg4"><img src="resources/images/timg.jpg"></div><div class="context4"><a href="#">如果你无法简洁的表达你的想法，那只说明你还不够了解它。</a></div></td></tr>  

                                                             </table>       
                                                </div>
                                                <div class="four">
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

    </div>
<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>