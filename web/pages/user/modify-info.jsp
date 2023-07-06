<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/verify-modify-user.js"></script>

	<style>

	</style>
</head>
<body>
	
	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<br />

	<div class="container">
		<div class="row">
			<!-- 左侧菜单栏 -->
			<div class="col-md-2">
					<li class="dropdown-header" style="background-color: #ececec"><a style="background-color: #ececec"
											href="#" class="dropdown-toggle btn "
											data-toggle="dropdown"><span
							class="glyphicon"></span> 修改更多信息 <b class="caret"></b>
										</a>
						<ul class="dropdown-menu" style="left: 10%">
							<li class="alert-success"><a
								href="${pageContext.request.contextPath}/pages/user/modify-info.jsp">
									<span ></span> 修改信息
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/pages/user/modify-password.jsp"><span
									></span> 修改密码</a></li>
							<li class="nav-divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/pages/user/history-orders.jsp">
									<span ></span> 历史订单
							</a></li>
						</ul>
					</li>
			</div>
			<!-- 右侧主体 -->
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading" >修改个人信息</div>
					<div class="panel-body">
						<form
							action="${pageContext.request.contextPath}/servlet/modifyInfoServlet"
							onSubmit="return checkModifyInfo()" method="post">
							<div class="form-group has-feedback">
								<div class="input-group">
									<span class="input-group-addon"><span
										>用&nbsp;&nbsp;户&nbsp;&nbsp;名</span></span> <input id="account"
										name="account" class="form-control" readonly="readonly"
										type="text" value="${sessionScope.user.account}">
								</div>
							</div>

							<div class="form-group has-feedback" id="modified-tel-div">
								<div class="input-group">
									<span class="input-group-addon"><span
										>手机号码</span></span> <input name="tel"
										id="modified-tel" class="form-control" placeholder="请输入手机号码"
										maxlength="11" type="text" value="${sessionScope.user.tel}">
								</div>
								<span style="color: red; display: none;" class="tips"></span> <span
									style="display: none;"
									class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span style="display: none;"
									class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback" id="modified-email-div">
								<div class="input-group">
									<span class="input-group-addon"><span
										>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span></span> <input
										name="email" id="modified-email" class="form-control"
										type="email" placeholder="例如:123@123.com"
										value="${sessionScope.user.email}">
								</div>
								<span style="color: red; display: none;" class="tips"></span> <span
									style="display: none;"
									class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span style="display: none;"
									class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>

							<div class="text-right">
								<button class="btn btn-outline-primary" type="submit">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</button>
								<button class="btn btn-outline-primary" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改成功弹框 -->
	<div id="modify-info-success" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>

				<div class="modal-title">
					<h1 class="text-center">修改成功</h1>
				</div>

				<!-- 主体 -->
				<div class="modal-body">
					<center>
						<div class="">
							<button class="btn btn-primary" type="submit"
								data-dismiss="modal">确&nbsp;&nbsp;定</button>
						</div>
					</center>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改成功后提示 -->
	<c:if test="${not empty requestScope.modifyInfoSuccess}">
		<script>
			$('#modify-info-success').modal("show");
		</script>
	</c:if>

</body>
</html>