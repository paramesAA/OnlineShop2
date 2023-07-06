<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/verify-modify-user.js"></script>

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
						<li ><a
								href="${pageContext.request.contextPath}/pages/user/modify-info.jsp">
							<span ></span> 修改信息
						</a></li>
						<li class="alert-success"><a
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
					<div class="panel-heading">修改密码</div>
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/servlet/modifyPasswordServlet"
							onSubmit="return checkModifyPassword()"
							method="post">

							<div class="form-group has-feedback" id="modified-password-div">
								<div class="input-group">
									<span class="input-group-addon"><span
										>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span></span><input id="modified-password"
										name="password" class="form-control" placeholder="请输入密码"
										maxlength="20" type="password">
								</div>
								<span style="color: red; display: none;" class="tips"></span> <span
									style="display: none;"
									class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span style="display: none;"
									class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>

							<div class="form-group has-feedback" id="modified-passwordConfirm-div">
								<div class="input-group">
									<span class="input-group-addon"><span
										>确认密码</span></span> <input
										id="modified-passwordConfirm" name="passwordConfirm"
										class="form-control" placeholder="请再次输入密码" maxlength="20"
										type="password">
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
	<div id="modify-password-success" class="modal fade">
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
	<c:if test="${not empty requestScope.modifyPasswordSuccess}">
		<script>
			$('#modify-password-success').modal("show");
		</script>
	</c:if>

</body>
</html>