<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'myAccount.jsp' starting page</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top class center-block"
		role="navigation">
	<div class="container">
		<div class="col-md-12 column">
			<div class="col-md-4 column"></div>
			<div class="col-md-6 column">
				<ul class="nav navbar-nav ">
						<li><a href="index"><font size=4>Home</font></a></li>
						<li><a href="search?keywords="><font size=4>Buy</font></a></li>
						<li><a href="seller.jsp"><font size=4>Sell</font></a></li>
						<c:if test="${sessionScope.user==null}">
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-user"></span><font size=4> Account</font></a></li>
						</c:if>

						<c:if test="${sessionScope.user!=null}">
							<li class="active"><a href="account"><span
										class="glyphicon glyphicon-user"></span><font size=4>${sessionScope.user.username}</font></a></li>
							<li><a href="logout"><span
									class="glyphicon glyphicon-log-out"></span><font size=4> log out</font></a></li>
						</c:if>
					</ul>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
	</nav>
	<div class="row" style="padding:40px 0px 0px 0px">
		<div class="col-xs-6 col-md-offset-5">
			<h1>my post</h1>
		</div>
	</div>
	<div class="row">
		<c:forEach var="item" items="${sessionScope.postItems}">
			<div class="col-md-2">
				<div class="thumbnail">
					<div style="width:229px;height:229px;">
						<a href="itemDetail?id=${item.itemId}"><img
							src="${item.coverPic.fileAddress}" alt="picture"></a>
					</div>
					<div class="caption">
						<form action="account" method="post">
						<h3>${item.itemName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>delete</button></h3>
						<input type="hidden" name="delete" value="${item.itemId}">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="col-xs-6 col-md-offset-5">
		<h1>my favorite</h1>
	</div>
	<div class="row">
		<c:forEach var="item" items="${sessionScope.favItems}">
			<div class="col-md-2">
				<div class="thumbnail">
					<div style="width:229px;height:229px;">
						<a href="itemDetail?id=${item.itemId}"><img
							src="${item.coverPic.fileAddress}" alt="picture"></a>
					</div>
					<div class="caption">
						<button>delete</button></h3>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
