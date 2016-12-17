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
<link rel="stylesheet" href="css/mycss/dropdown.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/util.js"></script>
</head>
<nav class="navbar navbar-inverse navbar-fixed-top class center-block"
	role="navigation">
	<div class="container">
		<div class="col-md-12 column">
			<div class="col-md-4 column"></div>
			<div class="col-md-6 column">
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
						<li><a href="account"><span
								class="glyphicon glyphicon-user"></span>${sessionScope.user.username}</a></li>
						<li><a href="logout"><span
								class="glyphicon glyphicon-log-out"></span> log out</a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
</nav>
<div class="col-md-12 column" style="padding: 60px 0px 0px 30px">
				 <input type="checkbox" value="">&nbsp;&nbsp;store
					leaving students' things temporarily
				<input type="checkbox" value="">&nbsp;&nbsp;transportation
				<input type="checkbox" value="">&nbsp;&nbsp;carrying
			</div>
		</div>
<body>
</body>
</html>
