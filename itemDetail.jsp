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
					<li><a href="index"><font size=4>Home</font></a></li>
					<li class="active"><a href="search?keywords="><font size=4>Buy</font></a></li>
					<li><a href="seller.jsp"><font size=4>Sell</font></a></li>
					<c:if test="${sessionScope.user==null}">
						<li><a href="login.jsp"><span
								class="glyphicon glyphicon-user"></span><font size=4>
									Account</font></a></li>
					</c:if>

					<c:if test="${sessionScope.user!=null}">
						<li><a href="account"><span
								class="glyphicon glyphicon-user"></span><font size=4>${sessionScope.user.username}</font></a></li>
						<li><a href="logout"><span
								class="glyphicon glyphicon-log-out"></span><font size=4>
									log out</font></a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
</nav>
<body>
	<div class="col-md-12 column" style="padding: 80px 0px 0px 40px">
		<div class="col-md-5 column"></div>
		<div class="col-md-2 column">
			<form action="account" method="post">
				<input type="hidden" value="${requestScope.item.itemId}" name="item">
				<button class="default btn btn-lg btn-info">Add To My
					Favorite</button>
			</form>
		</div>
		<div class="col-md-5 column"></div>
	</div>
	<div class="col-md-12 column" style="padding: 20px 0px 0px 40px">
		<div class="col-md-2 column">
			<strong style="font-size:30px">${requestScope.item.itemName}</strong>
		</div>
		<div class="col-md-10 column" style="font-size:25px">${requestScope.item.headline}</div>
	</div>
	<div class="col-md-12 column" style="padding: 20px 0px 0px 50px">
		<article>
			<p>
				<strong style="font-size:30px">Description</strong>
			</p>
			<p>
				<font size=5>${requestScope.item.description}</font>
			</p>
		</article>
	</div>
	<div class="col-md-12 column" style="padding: 20px 0px 0px 40px">
		<div class="col-md-2 column">
			<strong style="font-size:30px">Location:</strong>
		</div>
		<div class="col-md-10 column" style="font-size:25px">${requestScope.item.location.address}</div>
	</div>
	<div class="col-md-12 column" style="padding: 20px 0px 60px 40px">
		<div class="col-md-2 column">
			<strong style="font-size:30px">Contact</strong>
		</div>
		<div class="col-md-2 column" style="font-size:25px">
			<button class="default btn" data-toggle="modal"
				data-target="#contactInfo" onclick="count()">Show Contact
				Information</button>
		</div>
		<div class="col-md-8 column" style="font-size:25px"></div>
	</div>
	<c:forEach var="pic" items="${requestScope.item.pics}">
		<div class="row" style="padding: 20px 0px 60px 130px">
			<div class="col-md-12 column">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div style="width:229px;">
						<img src="${pic.fileAddress}" alt="picture">
					</div>
				</div>
				<div class="col-md-6"></div>
			</div>
		</div>
	</c:forEach>
	<div class="col-md-12 column" style="padding: 20px 0px 0px 40px">
		<div class="col-md-5 column"></div>
		<div class="col-md-2 column">
			<form action="account" method="post">
				<input type="hidden" value="${requestScope.item.itemId}" name="item">
				<button class="default btn btn-lg btn-info">Add To My
					Favorite</button>
			</form>
		</div>
		<div class="col-md-5 column"></div>
	</div>
	<div class="col-md-12 column" style="padding: 20px 0px 0px 40px">
		<strong style="font-size:30px">Seller’s other products</strong>
	</div>


	<div class="modal fade" id="contactInfo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Contact Information</h4>
				</div>
				<div class="modal-body">
					<h4>seller name: ${requestScope.item.contact.contactName}</h4>
					<h4>phone: ${requestScope.item.contact.phone}</h4>
					<h4>wechat: ${requestScope.item.contact.wechat}</h4>
					<h4>facebook: ${requestScope.item.contact.facebook}</h4>
					<h4>email: ${requestScope.item.contact.email}</h4>
					<c:if test="${requestScope.item.delivery==0}">
						<h4>delivery: Not included</h4>
					</c:if>
					<c:if test="${requestScope.item.delivery==1}">
						<h4>delivery: Included</h4>
					</c:if>
					<c:if test="${requestScope.item.delivery==2}">
						<h4>delivery: Only small product</h4>
					</c:if>
				</div>
				<div class="modal-footer">
					<h4>If you find what you are looking for, we will be happy for
						your $0.5 - $2 donation to help us improve the service. :)</h4>
					<h4>Payment methods: Paypal: utdcomart@gmail.com Chase
						(Quickpay)/Wells Fargo (Surepay)/BOA: First name: comart Last
						name: utd (name:comart) Email: utdcomart@gmail.com Wechat：
						Alipay：18310709139</h4>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script type="text/javascript">
		function count() {
			//1.get instance of XMLHttpRequest
			var xhr = getXHR();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
					}
				}

			}
			//2.connect to the server  
			xhr.open("POST", "itemDetail" + "?time=" + new Date().getTime(),
					false);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			//3.send request to the server  
			xhr.send("isCount=yes&id=" + "${requestScope.item.itemId}");
		}
	</script>
</body>
</html>
