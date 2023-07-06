<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style>
	body {
		padding-top: 50px;
		/*background-image: linear-gradient(120deg, #fdfbfb 100%, #ebedee 100%);*/
		/*background: url("../images/index/background.jpg") no-repeat 0px 0px;*/
	}

</style>
<!-- 用户/管理员登录 -->
</head>
<body>

	<!-- 登录窗口 -->
<%--	<div id="login" class="modal fade">--%>
	<div id="login" class="container">
		<div class="panel-heading">
			<h1 class="text-center">登录</h1>
		</div>
		<!-- 登录表单 -->
		<div class="panel-group">
			<form class="form-horizontal"
				  style="width:25%;margin-left: 38%"
				  action="${pageContext.request.contextPath}/servlet/loginServlet"
				  method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">用户名</span> <input
							id="login-account" name="account" class="form-control"
							placeholder="请输入用户名" maxlength="20" type="text">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码</span> <input
							id="login-password" name="password" class="form-control"
							placeholder="请输入密码" maxlength="20" type="password">
					</div>
				</div>

				<div class="btn-group" data-toggle="buttons" style="margin-left: 13%">
					<label class="btn btn-default active">
						<input name="status" value="user" type="radio" checked>用户(默认)
					</label>
					<label class="btn btn-default">
					<input name="status" value="admin" type="radio"> 卖家
					</label>
				</div>
				<br><br>
				<div class="nav navbar-nav" style="margin-left: 27%">
					<span class="text-danger">${requestScope.loginError}</span>
					<button class="btn btn-default" type="submit">登录</button>
					<button class="btn btn-default" data-dismiss="modal">取消</button>
					<a href="${pageContext.request.contextPath}/index.jsp" data-target="#register">
						<strong>回主页注册</strong>
					</a>
				</div>


			</form>
		</div>

	</div>

	<!-- 登录失败之后返回，重新打开模态框 -->
	<c:if test="${not empty loginError}">
		<script>
			$('#login').modal("show");
		</script>
	</c:if>

</body>
</html>