<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>培训机构管理分类</title>

<link href="${ctx}/static/css/manageClassify.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/jquery-1.9.0.min.js"></script>

</head>
<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg"> 
  <a id="exit">退出登录</a>
  <a href="${ctx}/organization/orgLogin.jsp"><img src="${ctx}/static/images/exit.png" id="exitimg"></a>
  <a href="" id="jgName">${sellerLogin.sellerLoginName}</a>
</p>  
</div>
<div><hr/></div>
<!--内容-->
<div id="content">
<div id="out">
    <div id="list">
     <div class="a1 lefta"><a href="${ctx }/organization/manageIntro.jsp" class="leftb">○&nbsp;管理简介</a></div>
     <div class="a1 lefta selecteda"><a href="${ctx}/sellerInfo/sellerFindCourse?sellerID=${sellerLogin.sellerID}" class="leftb selecteda">○&nbsp;管理分类</a></div>
     <div class="a1 lefta "><a href="../course/listCourse?coursePageIndex=1&sellerID=${sellerLogin.sellerID }"class="leftb"" class="leftb">○&nbsp;管理课程</a></div> 

     </div><!--list-->

     <div id="setClass">
     <div id="table">
     <form>
     <table cellspacing="0">
	     	<tr>
	     	<td>课程名称</td>
	        <td>课程所属分类</td>
	     	<td>修改所属分类</td>
	     	<td>操作</td></tr>
	     	<c:forEach var="sellerCourseType" items="${sellerCourselist }">
		     	<tr>
			     	<td>${sellerCourseType.courseName}</td>
			        <td>${sellerCourseType.sellerCourseType.courseTypeName2}</td>
			     	<td>
			     		<select>
				        	<option>所属类型</option>
				        	
				        	<c:forEach var="publicCourseType" items="${publicCourseType}">
					        	<option>${publicCourseType.publicTypeName}</option>
				        	</c:forEach>
			        	</select>
			     	</td>
			     	<td><a href="${ctx}/sellerCourseType/updateCourseType?id=${sellerCourseType.courseID}">更新</a>&nbsp;/&nbsp;<a href="${ctx}/sellerInfo/deleteCourseType?id=${sellerCourseType.courseID}&uid=${sellerLogin.sellerID}">删除</a></td></tr>
			    </tr>
        </c:forEach>
        <tr>
        	<form action="${ctx}/sellerCourseType/addCourseType">
	        	<div><td><input type="text" name = "courseName"/></td></div>
	        	<div><td><input type="text" name="publicTypeName"/></td></div>
	        	<div><td>
	        		<select>
				        <option >所属类型</option>
				        	<c:forEach var="publicCourseType" items="${publicCourseType}">
					        	<option>${publicCourseType.publicTypeName}</option>
				        	</c:forEach>
				    </select>
				</td></div>

	        	 <td><input type="submit" value="确认添加" style="border:2px solid #9ACD32;onclick="this.style.background='#D3D3D3';"></td>
        	</form>
        </tr>
     </table>
     </form>
<!--  分页       -->
      <div id="pageDivide">
        <ul>
            <li><a href="sellerFindCourse?sellerID=${sellerLogin.sellerID}&pageNum=1">首页</a></li>
            <li><a href="sellerFindCourse?sellerID=${sellerLogin.sellerID}&pageNum=${pageNum-1}">上一页</a></li>
            <c:forEach begin="1" end="${pageCount}" step="1" var="i">
            	<li><a href="sellerFindCourse?sellerID=${sellerLogin.sellerID}&pageNum=${i}">${i}</a></li>
            </c:forEach>
            <li><a href="sellerFindCourse?sellerID=${sellerLogin.sellerID}&pageNum=${pageNum+1}">下一页</a></li>
            <li><a href="sellerFindCourse?sellerID=${sellerLogin.sellerID}&pageNum=${pageCount}">尾页</a></li>
        </ul>
     </div>
	 </div><!--table-->
</div><!--out-->
</div><!--content-->

<div id="footer">
     ©CopyRight sugarcane <a href="#">联系我们</a>
</div><!--footer-->
</body>

</html>