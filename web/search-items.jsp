<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.items {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.items img {
	width: 150px;
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

	<!-- 无itemsPage进入时，重新请求getUsersPagesServlet -->
	<c:if test="${empty itemsPage}">
		<script>
			window.location.href = '${pageContext.request.contextPath}/servlet/searchItemPageServlet';
		</script>
	</c:if>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<div style="margin-top: 30px">
		<h1 class="text-center" style="font-family: 幼圆">商品检索展示</h1>
	</div>
	<div class="hr-line-solid"></div>
	<div class="container">
		<div class="panel panel-primary ">
			<!-- 头部 -->
			<div class="panel-heading" style="height: 50px">
				<div class="pull-left">
					<font size="4" style="line-height: 35px">结&nbsp&nbsp果</font>
				</div>
			</div>
			<!-- 主列表 -->
			<div class="panel-body items" style="background-color: #9d9d9d">
				<% int count = 0;%>
				<c:forEach var="item" items="${requestScope.itemsPage.list}">
					<% if (count%3 == 0){
						out.println("<div class=\"row\"></div>");
						count = 0;
					}%>
					<div class="col-xs-4">
						<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=${item.itemId}" class="thumbnail">
							<img style="width: 195px;height: 165px"
							 src="${pageContext.request.contextPath}${item.imageUrl}"
							class="img-thumbnail">
						<div class="caption">
							<div class="text-muted">
								<br/>${item.name}
							</div>
						</div>
						</a>
					</div>
					<% count = count + 1;%>
				</c:forEach>
				<div class="row"></div>
				<p>&nbsp;</p>
				<nav>
				<center>第[${itemsPage.currentPage}]页/共${itemsPage.totalPage}页</center>
				<ul class="pager">
					<c:if test="${itemsPage.currentPage>1 }">
						<li class="icon-next"><a class="btn btn-outline-success btn-sm"
								href="${itemsPage.url}&currentPage=1">第一页</a></li>
						<li class="icon-next"><a class="btn btn-outline-success btn-sm"
							href="${itemsPage.url}&currentPage=${itemsPage.currentPage-1}">上一页</a></li>
					</c:if>
					<c:if test="${itemsPage.currentPage<itemsPage.totalPage}">
						<li class="icon-next"><a class="btn btn-outline-success btn-sm"
							href="${itemsPage.url}&currentPage=${itemsPage.totalPage}">最后一页</a></li>
						<li class="icon-next"><a class="btn btn-outline-success btn-sm"
							href="${itemsPage.url }&currentPage=${itemsPage.currentPage+1}">下一页</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>


</body>
</html>