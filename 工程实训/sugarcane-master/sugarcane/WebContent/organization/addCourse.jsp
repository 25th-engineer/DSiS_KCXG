<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>培训机构添加课程</title>
<link href="${ctx }/static/css/addCourse.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/static/css/orgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.9.0.min.js"></script>
</head>
<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx }/static/images/b.png" id="welcomeImg"> 
  <a id="exit">退出登录</a>
  <a href="#"><img src="${ctx }/static/images/exit.png" id="exitimg"></a>
  <a href="#" id="jgName">${sellerLogin.sellerLoginName }</a>
 
</p>  
</div>
<!--分割线-->
<div><hr></div>
<!--内容-->
<div id="content">
<div id="out">
     <div id="list">
     <div class="a1 lefta"><a href="${ctx }/organization/manageIntro.jsp" class="leftb">○&nbsp;管理简介</a></div>
     <div class="a1 lefta"><a href="${ctx}/sellerInfo/sellerFindCourse?sellerID=${sellerLogin.sellerID}" class="leftb">○&nbsp;管理分类</a></div>
     <div class="a1 lefta selecteda"><a href="../course/listCourse?coursePageIndex=1&sellerID=${sellerLogin.sellerID }" class="selecteda leftb">○&nbsp;管理课程</a></div>

     </div><!--list-->


    <div align="center" id="classDetail">
	    <form id="form" action="../course/addOneCourse">
		    <table>
			    <tr>
			    <td>课程名称：</td>
			    <td><input type="text" name="courseName"></td>
			    </tr>
			    <tr>
			    <td>机构分类：</td>
			    <td><select>
		        	<option >请选择类型</option>
		        	<c:forEach  items="${sellerCourseTypeList}" var="sellerCourseType" varStatus="i">
		        		<option name="sellerCourseTypeID" value="${sellerCourseType.sellerCourseTypeID }" selected="true">${sellerCourseType.courseTypeName2 }</option>
		        	</c:forEach>
		        </select></td>
		        </tr>
		           <tr>
			    <td>公共分类：</td>
			    <td><select>
		        	<option >请选择类型</option>
		        	<c:forEach  items="${publicCourseTypeList}" var="publicCourseType" varStatus="i">
		        		<option name="publicCourseTypeID" value="${publicCourseType.publicTypeId }" selected="true">${publicCourseType.publicTypeName }</option>
		        	</c:forEach>
		        </select></td>
		        </tr>
				<tr>
				<td>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</td>
				<td><input type="text" name="price"></td>
				</tr>
				<tr>
				<td>授课教师：</td><td><input type="text" name="teacher"></td>
				</tr>
				<tr>
				<td>联系方式：</td><td><input type="text" name="phoneNumber"></td>
				</tr>
				<!--  tr>
				<td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
				<td><input type="text" name="address"></td>
				</tr-->
				<tr>
				<td>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</td>
				<td><textarea rows="4" cols="27" name="courseBrief">请输入课程简介</textarea></td>
				</tr>
				<!-- 上传文件 -->
				<tr>
					<td></td>
					<td>
						<a href="javascript:;" class="file">上传视频
				    	<input type="file" id="file" name="video" accept="video/*">
						</a>
						<a href="javascript:;" class="file">上传图片
				    	<input type="file" id="fileElem" name="introductionImg1" multiple accept="image/*" onchange="handleFiles(this)">
						</a>
						<div id="fileList" style="width:200px;height:200px;"></div>
					</td>
					<td>
					<!-- 保存按钮 -->
  							<!-- button class="button" -->
  					<input type="submit" value="保存" class="save"/>
  							<!--/button-->
  					</td>
				</tr>
			</table>	
		</form>
  	</div>
<!--footer-->
<div id="footer">
     CopyRight© sugarcane <a href="#">联系我们</a>
</div>
</body>
<!--上传文件预览-->
<script>
	window.URL = window.URL || window.webkitURL;
    var fileElem = document.getElementById("fileElem"),
    fileList = document.getElementById("fileList");
    function handleFiles(obj) {
        var files = obj.files,
        img = new Image();
        if(window.URL){
            //File API
            alert("请求显示图片"+files[0].name + "," + files[0].size + " bytes");
            img.src = window.URL.createObjectURL(files[0]); //创建一个object URL，并不是你的本地路径
            img.width = 200;
            img.onload = function(e) {
                window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
            }
            fileList.appendChild(img);
        }else if(window.FileReader){
            //opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理
            var reader = new FileReader();
            reader.readAsDataURL(files[0]);
            reader.onload = function(e){
                alert("请求显示图片"+files[0].name + "," +e.total + " bytes");
                img.src = this.result;
                img.width = 200;
                fileList.appendChild(img);
            }
        }else{
            //ie
            obj.select();
            obj.blur();
            var nfile = document.selection.createRange().text;
            document.selection.empty();
            img.src = nfile;
            img.width = 200;
            img.onload=function(){
                alert(nfile+","+img.fileSize + " bytes");
            }
            fileList.appendChild(img);
        }
    }
 </script>