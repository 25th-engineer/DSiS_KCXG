<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>甘蔗后台用户管理</title>
<meta charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/bgstyle.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/frontcss/bgUser.css">
<script type="text/javascript">
	//提交禁用选项
	function forbidClick(){
	    document.getElementById('submitfc').submit()
	} 
</script>
</head>
<body>
	<div class="header">
		<a href="${ctx }/admin/logoff">退出</a>
		<P>${adminLogin.adminName }</p>
	</div>
<!--body-->
	<div class="body">
		<div class="left">
			<ul class="option">
				<li><a href="${ctx }/admin/listUser" id="user">用户管理</a></li>
				<li><a href="${ctx }/manager/bgCompany.jsp">培训机构管理</a></li>
			</ul>
		</div>
		<div class="right">
			<div class="first"><a href="${ctx }/manager/background.jsp">后台</a>&nbsp;&nbsp;>&nbsp;&nbsp;用户管理</div>
			<form action="${ctx }/admin/listUser" method="post" class="form">
				<input type="text" value="单行输入" name="userName" class="text"/>
				<input type="submit" value="搜索" class="search" />
			</form>
			<form action="${ctx }/admin/forbidUser" method="post" id="submitfc">
			<table class="table">
				<tr>
					<th>用户编号</th>
					<th>用户名</th>
					<th class="lastcol">禁用</th>
				</tr>
				<c:forEach items="${listUser }" var="user" varStatus="cou" >
					<tr>
						<td>${cou.count }</td>
						<td>${user.userName }</td>
						<c:choose>
							<c:when test="${user.userLogin.getForbid() == 1  }">
								<td>
									<input type="checkbox" id="${cou.count }" name="userID" value="${user.userID }" checked="checked" onclick="forbidClick()" /><label for="${cou.count }"></label>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<input type="checkbox" id="${cou.count }" name="userID" value="${user.userID }" onclick="forbidClick()"/><label for="${cou.count }"></label>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				<!-- <tr><td>
				<input type="submit" name="tijiao" value="提交">
				</td></tr> -->
			</table>
			</form>
			<div class="fenye">
				<form method="POST" action="${ctx }/admin/listUser" style="clear:left">
					<table border="0" align="center" >
				        <tr>
				            <td>共${pageCount }页<a href="${ctx }/admin/listUser?pageIndex=1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></td>
					        <c:if test="${pageIndex>1 }">
		                    	<td><a href="${ctx }/admin/listUser?pageIndex=${pageIndex-1 }">&nbsp;&nbsp;&nbsp;&nbsp;上一页</a></td>
							</c:if>
							<td><a href="${ctx }/admin/listUser?pageIndex=${pageIndex }" style="font-weight:bolder;">&nbsp;&nbsp;&nbsp;&nbsp;${pageIndex }</a></td>
					        <c:if test="${pageIndex<pageCount }">
					            <td><a href="${ctx }/admin/listUser?pageIndex=${pageIndex+1 }">&nbsp;&nbsp;&nbsp;&nbsp;下一页</a></td>
					            <td><a href="${ctx }/admin/listUser?pageIndex=${pageCount }">&nbsp;&nbsp;&nbsp;&nbsp;尾页</a></td>
					        </c:if>
					        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转到第<input type="text" name="page" size="2" id="inputPage">页&nbsp;&nbsp;
							<input type="submit" value="跳转" name="cndok" class="go">
							</td>
				        </tr>
				    </table>
				</form>
			</div>
		</div>
	</div>
<!--footer-->
    <div class="footer">
    	<div class="footer_text">Copyright©2018-2019&nbsp;&nbsp;&nbsp;sugarcane&nbsp;&nbsp;&nbsp;联系我们</div>
    </div>
</body>
</html>