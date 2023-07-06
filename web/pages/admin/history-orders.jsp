<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#item img {
	width: 30px;
}
.btn {
        background-color: 	DeepSkyBlue; /* 设置按钮背景颜色 */
        color: white; /* 设置按钮文字颜色 */
        padding: 10px 20px; /* 设置按钮内边距 */
        border: none; /* 移除按钮边框 */
        cursor: pointer; /* 鼠标悬停样式 */
        border-radius: 5px; /* 设置按钮圆角 */
        font-size: 16px; /* 设置按钮文字大小 */
    }

</style>
</head>
<body>
	<!-- 无itemsPage且没有操作失败,进入时，重新请求getUsersPagesServlet -->
	<c:if test="${empty ordersPage}">
		<script>
			window.location.href = '${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet';
		</script>
	</c:if>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<br />

	<div class="container">
		<div class="row">
			<!-- 左侧菜单栏 -->
			<!-- 左侧菜单栏 -->
			<div class="col-md-2">
				<li class="dropdown-header" style="background-color: #ececec">
					<a style="background-color: #ececec" href="#" class="dropdown-toggle btn "
					   data-toggle="dropdown"><span
							class="glyphicon"></span>查看更多<b class="caret"></b>
					</a>
					<ul class="dropdown-menu" style="left: 10%">
						<li><a
								href="${pageContext.request.contextPath}/pages/admin/manage-items.jsp">
							<span></span> 商品管理</a></li>
						<li class="nav-divider"></li>
						<li class="alert-success"><a
								href="${pageContext.request.contextPath}/pages/admin/history-orders.jsp">
							<span ></span> 订单管理
						</a></li>
					</ul>
				</li>
			</div>
			<!-- 右侧主体 -->
			<div class="col-md-10">
				<!-- 下半部分 -->
				<div class="panel panel-default">
					<div class="panel-heading" style="height: 55px">
						<div class="pull-left">
							<font size="4" style="line-height: 35px">历史订单</font>
						</div>
					</div>
					<div class="panel-body">
						<!--搜索栏-->
						<center>
							<form class="navbar-form "
								action="${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet"
								role="search" method="get">
								<div class="form-group">
									<div class="btn-group  pull-left" data-toggle="buttons">
										<label class="btn btn-default active"> <input
											name="status" value="account" type="radio" checked>用户名
										</label> <label class="btn btn-default"> <input name="status"
											value="orderId" type="radio"> 订单号
										</label>
									</div>
									<input name="keyword" type="text" class="form-control"
										placeholder="Search">
								</div>
								<button type="submit" class="btn btn-primary">搜索</button>
							</form>
						</center>
						<br />
						<!-- 表格 -->
						<table class="table table-striped" style="text-align: center">
							<tr>
								<td>订单编号</td>
								<td>用户</td>
								<td>总计</td>
								<td>创建时间</td>
								<td>查看详情</td>
								<td>收货地址</td>
								<td>发货状态</td>
								<td>点击发货</td>
							</tr>
							<c:forEach var="order" items="${requestScope.ordersPage.list}">
								<tr>
									<td>${order.orderId}</td>
									<td>${order.account}</td>
									<td>${order.orderTotal}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.createdTime}"/></td>
									<!-- 查看详情 -->
									<td><form action="${pageContext.request.contextPath}/servlet/getOrderDetailServlet" method="post">
											<input type="hidden" name="orderId" value="${order.orderId}" />
											<button class="btn btn-info" type="submit">
												<span class="glyphicon glyphicon-zoom-in"></span>
											</button>
										</form></td>
										<td>
										${order.address}</td>
										<td>${order.state}</td>
										<td><form action="${pageContext.request.contextPath}/servlet/updateOrderServlet" method="post"><input type="hidden" name="orderId" value="${order.orderId}" />
										<button type="submit" class="btn" onclick="toggleElement('${order.state}')">发货</button>
										</form>
										</td>
								</tr>
							</c:forEach>
						</table>
						<center>第[${ordersPage.currentPage}]页/共${ordersPage.totalPage}页</center>
						<nav>
						<ul class="pager">
							<c:if test="${ordersPage.currentPage>1 }">
								<li class="previous"><a
									href="${ordersPage.url}&currentPage=1">首页</a></li>
								<li class="previous"><a
									href="${ordersPage.url}&currentPage=${ordersPage.currentPage-1}">上一页</a></li>
							</c:if>
							<c:if test="${ordersPage.currentPage<ordersPage.totalPage}">
								<li class="next"><a
									href="${ordersPage.url }&currentPage=${ordersPage.totalPage}">尾页</a></li>
								<li class="next"><a
									href="${ordersPage.url }&currentPage=${ordersPage.currentPage+1}">下一页</a></li>
							</c:if>
						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 订单详情弹框 -->
	<div id="order-detail" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-title">
					<h1 class="text-center">订单详情</h1>
				</div>
				<!-- 主体 -->
				<div class="modal-body" id="item">
					<table class="table table-striped" style="text-align: center">
						<tr>
							<td>商品</td>
							<td>商品名</td>
							<td>类型</td>
							<td>数量</td>
							<td>单价</td>
							<td>小计</td>
						</tr>

						<c:forEach var="item" items="${requestScope.list}">
							<tr>
								<td><img
									src="${pageContext.request.contextPath}${item.imageUrl}"></td>
								<td>${item.name}</td>
								<td>${item.type}</td>
								<td>${item.number}</td>
								<td>${item.price}</td>
								<td>${item.number*item.price}</td>
						</c:forEach>
					</table>

					<center><font size="4"><strong>总价：${total}&nbsp;&nbsp;&nbsp;&nbsp;</strong></font><br/><br/>

						<button class="btn btn-primary" data-dismiss="modal">关&nbsp;&nbsp;闭</button>
					</center>
				</div>
			</div>
		</div>
	</div>

	<!-- 获取订单详情后提示 -->
	<c:if test="${not empty list}">
		<script>
			$('#order-detail').modal("show");
		</script>
	</c:if>

 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js">
    </script>

    <script>
       function toggleElement(date){
        if(date==="已发货"){
               alert("该商品已发货")
             }else{

              alert("发货成功")
             }
         }
  </script>
</body>
</html>