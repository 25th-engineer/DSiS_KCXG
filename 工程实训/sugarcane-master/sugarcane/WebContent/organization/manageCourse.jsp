<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>培训机构管理课程</title>
<link href="${ctx}/static/css/manageCourse.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/orgStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/static/js/jquery-1.9.0.min.js"></script>
</head>
<body>
<!--导航栏-->
<div id="header">
<p>
  <img src="${ctx}/static/images/b.png" id="welcomeImg"> 
  <a id="exit">退出登录</a>
  <a href="#"><img src="${ctx}/static/images/exit.png" id="exitimg"></a>
  <a href="#" id="jgName">${sellerLogin.sellerLoginName }</a>
 
</p>  
</div>
<div><hr/></div>
<!--内容-->
<div id="content">
<div id="out">
    <div id="list">
     <div class="a1 lefta"><a href="${ctx }/organization/manageIntro.jsp" class="leftb">○&nbsp;管理简介</a></div>
     <div class="a1 lefta"><a href="${ctx}/sellerInfo/sellerFindCourse?sellerID=${sellerLogin.sellerID}" class="leftb">○&nbsp;管理分类</a></div>
     <div class="a1 lefta selecteda"><a href="../course/listCourse?coursePageIndex=1&sellerID=1"class="selecteda leftb">○&nbsp;管理课程</a></div>  

     </div><!--list-->

     <div id="setClass">
     <div id="addClass">
        <div id="seta1">
        <a href="${ctx }/organization/addCourse.jsp" ><span id="a1">添加课程</span></a></div>
        <div id="select">
        <form action="../course/listCourseBySellerCourseType">
        <select >
        	<option >请选择类型</option>
        <c:forEach  items="${sellerCourseTypeList}" var="sellerCourseType" varStatus="i">
        	<option name="sellerCourseTypeID" value="${sellerCourseType.sellerCourseTypeID }">${sellerCourseType.courseTypeName2 }</option>
        </c:forEach>
        </select>
        <input type="submit" value="搜索" class="find">
        </form>

        </div><!--select-->
     </div><!--addClass-->

     <div id="table">
     <form>
     <p>注意： 课程编号自动生成，尽量不要修改，若冲突否则将无法正常修改</p>
     <table cellspacing="0" >
     	<tr>
     	<td class="td">课程编号</td>
     	<td class="td">课程名称</td>
        <td class="td">课程价格/h</td>
        <td class="td">授课教师</td>
        <td class="td">联系方式</td>
     	<td class="td">所属机构分类</td>
     	<td class="td">公共分类</td>
     	<td class="td">修改</td>
     	<td class="td">删除</td>
     	</tr>
     	
     <c:forEach items="${courseList}" var="course" varStatus="i">
     <form action="../course/updateOneCourse">
     	<tr>
     	<td class="td"><input type="text" name="courseID" value="${course.courseID }" /></td>
        <td class="td"><input type="text" name="courseName" value="${course.courseName }" /></td>
        <td class="td"><input type="text" name="price" value="${course.price }" /></td>
        <td class="td"><input type="text" name="teacher" value="${course.teacher }" /></td>
        <td class="td"><input type="text" name="phoneNumber" value="${course.phoneNumber }" /></td>
     	<td class="td">
     	 <select name="sellerCourseTypeID">
        	<option >请选择类型</option>
        <c:forEach  items="${sellerCourseTypeList}" var="sellerCourseTypeList" varStatus="i">
        	<option  value="${sellerCourseTypeList.sellerCourseTypeID }">${sellerCourseTypeList.courseTypeName2 }</option>
        </c:forEach>
        </select>
     	</td>
     	<td class="td">
     	 <select name="publicCourseTypeID">
        	<option >请选择类型</option>
        <c:forEach  items="${publicCourseTypeList}" var="publicCourseTypeList" varStatus="i">
        	<option  value="${publicCourseTypeList.publicTypeId }">${publicCourseTypeList.publicTypeName }</option>
        </c:forEach>
        </select>
     	</td>
     	<td class="td"><input type="submit" value="修改"></td>
     	<td class="td"><a href="../course/deleteOneCourse?courseID=${course.courseID}&coursePageIndex=1">删除 </a></td>
       </tr>
      </form>
      </c:forEach>
     </table>
     </form>


      <div id="pageDivide">
        <ul class="pager"> 
            <li><a href="../course/listCourse?coursePageIndex=1&sellerID=${sellerID}" class="pagea">首页</a></li>
            <li><a href="../course/listCourse?coursePageIndex=${coursePageIndex-1 }&sellerID=${sellerID}"><</a></li>          
             <c:forEach begin="${coursePageIndex }" end="${coursePageCount}" step="1" var="i">
            	<li><a href="../course/listCourse?coursePageIndex=${i}&sellerID=${sellerID}">${i}</a></li>
            </c:forEach>
            <c:if test="${coursePageIndex+1<coursePageCount-1}">
            <li><a href="../course/listCourse?coursePageIndex=${coursePageIndex+1 }&sellerID=${sellerID}">></a></li>
            </c:if>
            <c:if test="${coursePageIndex+1>coursePageCount}">
             <li><a href="../course/listCourse?coursePageIndex=${coursePageCount }&sellerID=${sellerID}">></a></li>
            </c:if>
            <li><a href="../course/listCourse?coursePageIndex=${coursePageCount }&sellerID=${sellerID}">尾页</a></li>
        </ul>
     </div>

	 </div><!--table-->

	
     </div><!--右：setClass-->
</div><!--out-->
</div><!--content-->

<div id="footer">
     ©CopyRight sugarcane <a href="#">联系我们</a>
</div><!--footer-->
</body>
</html>