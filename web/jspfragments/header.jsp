<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style>
body {
	padding-top: 48px;
}
.navbar{
	background-color: #c5c4c4;
}
</style>

<title>header</title>
</head>
<body>
	<!-- 未登录则引入登录/注册所需的模态框 -->
	<c:if test="${empty sessionScope.user and empty sessionScope.admin}">
<%--		<jsp:include page="/jspfragments/login.jsp" />--%>
		<jsp:include page="/jspfragments/register-user.jsp" />
	</c:if>

	<!-- 页头 -->
	<!--响应式导航栏-->
	<nav class="navbar navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

		</div>

		<div class="collapse navbar-collapse navbar-left"
			id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a style="background-color: #ececec"
					href="${pageContext.request.contextPath}/index.jsp"><span
						class="glyphicon" ></span>首页</a></li>
				<li class="dropdown"><a style="background-color: #ececec"
						href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span
						class="glyphicon"></span> 热门类别 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?">全部</a></li>
						<li></li>
						<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=文学">文学</a></li>
						<li></li>
						<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=运动产品">运动</a></li>
						<li></li>
						<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=电子产品">电子</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<!--搜索栏-->
		<form class="navbar-form navbar-right"
			action="${pageContext.request.contextPath}/servlet/searchItemPageServlet?"
			role="search" method="get">
			<div class="form-group">
				<input name="nameKeyword" type="text" class="form-control"
					placeholder="请输入信息" size="15">
			</div>
			<button type="submit" class="btn btn-outline-primary" style="background-color: #31b0d5">搜索</button>
		</form>

		<!--登录注册/用户中心、退出-->
		<c:if test="${empty sessionScope.user and empty sessionScope.admin}">
			<div class="nav navbar-nav navbar-right">
				<a type="submit" class="btn navbar-btn"
					   style="background-color: #31b0d5;color: #0f0f0f;"
<%--						data-toggle="modal" data-target="#login" --%>
					   href="${pageContext.request.contextPath}/jspfragments/login.jsp">
						登录
					</a>
			</div>
			<div class="nav navbar-nav navbar-right">
				<button type="submit" class="btn navbar-btn"
					 style="background-color: #31b0d5"
					 data-toggle="modal" data-target="#register" href="">
					注册
			</button>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</div>
		</c:if>
		<c:if
			test="${not empty sessionScope.user or not empty sessionScope.admin}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="text-primary">当前用户为，${sessionScope.user.account}${sessionScope.admin.account}</span></a></li>
				<c:if test="${not empty sessionScope.user}">
					<li><a
						href="${pageContext.request.contextPath}/servlet/getShoppingcartServlet"><span
							></span> 购物车</a></li>
					<li><a
						href="${pageContext.request.contextPath}/pages/user/modify-info.jsp"><span
							></span> 个人中心</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.admin}">
					<li><a
						href="${pageContext.request.contextPath}/pages/admin/manage-items.jsp"><span
							class="glyphicon glyphicon-user"></span> 管理中心</a></li>
				</c:if>

				<li><button type="submit" class="btn navbar-btn" style="background-color: #9d9d9d"
						onclick="window.location.href='${pageContext.request.contextPath}/servlet/logoutServlet'">
						<span></span> 退出
					</button></li>
			</ul>
		</c:if>
	</div>
	</nav>


</body>
</html>