<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
/*main区域居中*/
.main {
	text-align: center;
	background-color: #fff;
	border-radius: 20px;
	width: 1000px;
	height: 400px;
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.items {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.items img {
	width: 150px;
}

/*去除轮播两边阴影*/
#cl #cr {
	background-image: none;
}
.hr-line-solid{
	border-top:1px solid #444141;
	color:#fff;
	background-color:#FAEBD7;
	height:1px;
	margin:20px 0
}
</style>

</head>
<body>
	<!-- 利用forwardUrl来确定(注册之后)返回的url -->
	<%
		request.setAttribute("forwardUrl", "/index.jsp"); //map
	%>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />
	<!-- 产品展示 -->
	<div style="margin-top: 30px">
		<h1 class="text-center" style="font-family: 幼圆">热门商品展示</h1>
	</div>

	<div class="hr-line-solid"></div>
	<div class="container items" style="background-color: #c5c4c4">
		<div class="row">
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=1"> <img
						style="width: 195px;height: 165px"
					src="${pageContext.request.contextPath}/images/index/1-1.jpg"
					class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br />百年孤独
						</div>
					</div></a>
			</div>

			<div class="col-lg-3 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=2"> <img
						style="width: 195px;height: 165px"
					src="${pageContext.request.contextPath}/images/index/1-2.jpg"
					class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br />平凡的世界
						</div>
					</div></a>
			</div>

			<div class="col-lg-3 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=9"> <img
						style="width: 195px;height: 165px"
					src="${pageContext.request.contextPath}/images/index/3-1.jpg"
					class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br/>AirPods
						</div>
					</div></a>
			</div>


			<div class="col-lg-3 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=3"> <img
						style="width: 195px;height: 165px"
						src="${pageContext.request.contextPath}/images/index/3-4.jpg"
						class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br/>RedmiK60
						</div>
					</div></a>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=4"> <img
						style="width: 195px;height: 165px"
						src="${pageContext.request.contextPath}/images/item/3-6.png"
						class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br />小米note12
						</div>
					</div></a>
			</div>
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=6"> <img
						style="width: 195px;height: 165px"
						src="${pageContext.request.contextPath}/images/index/2-1.jpg"
						class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br/>梅西球衣
						</div>
					</div></a>
			</div>
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=7"> <img
						style="width: 195px;height: 165px"
						src="${pageContext.request.contextPath}/images/index/2-2.jpg"
						class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br />c罗球衣
						</div>
					</div></a>
			</div>

			<div class="col-lg-3 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=8"> <img
						style="width: 195px;height: 165px"
						src="${pageContext.request.contextPath}/images/index/2-3.jpg"
						class="img-thumbnail">
					<div class="caption">
						<div class="text-muted">
							<br />莫德里奇球衣
						</div>
					</div></a>
			</div>
		</div>
		<br><br>
	</div>
	<br><br>

	<!-- 页脚 -->
	<jsp:include page="/jspfragments/footer.jsp" />
</body>
</html>