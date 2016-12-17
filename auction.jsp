<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top class center-block"
		role="navigation">
		<div class="container">
			<div class="col-md-12 column">
				<div class="col-md-4 column"></div>
				<div class="col-md-4 column">
					<ul class="nav navbar-nav ">
							<li class="active"><a href="index">Home</a></li>
							<li><a href="search?keywords=">Buy</a></li>
							<li><a href="seller.jsp">Sell</a></li>
							<li><a href="auction.jsp">Auction</a></li>
							<c:if test="${sessionScope.user==null}">
								<li><a href="login.jsp"><span
										class="glyphicon glyphicon-user"></span> Account</a></li>
							</c:if>

							<c:if test="${sessionScope.user!=null}">
								<li><a href="xxx"><span
										class="glyphicon glyphicon-user"></span>${sessionScope.user.username}</a></li>
								<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span> log out</a></li>
							</c:if>
						</ul>
				</div>
				<div class="col-md-4 column"></div>
			</div>
		</div>
	</nav>
	<div style="padding: 70px 0px 0px 40px" class="row clearfix">
	<h1>Building...ing...</h1>
	</div>
</body>
</html>
