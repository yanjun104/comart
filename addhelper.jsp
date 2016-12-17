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
							<li><a href="search?keywords="><font size=4>Buy</font></a></li>
							<li><a href="seller.jsp"><font size=4>Sell</font></a></li>
							<c:if test="${sessionScope.user==null}">
								<li><a href="login.jsp"><span
										class="glyphicon glyphicon-user"></span><font size=4>Account</font></a></li>
							</c:if>

							<c:if test="${sessionScope.user!=null}">
								<li><a href="account"><span
										class="glyphicon glyphicon-user"></span><font size=4>${sessionScope.user.username}</font></a></li>
								<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span><font size=4>log out</font></a></li>
							</c:if>
						</ul>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
</nav>
<form id="" action="" method="post">
	<div style="padding: 60px 0px 0px 40px" class="row clearfix">
		<div class="col-md-12 column" style="padding: 20px 0px 0px 20px">
			<div class="col-md-1 column" style="font-size:20px">
				<label>Email:</label>
			</div>
			<div class="col-md-3 column">
				<input type="text" class="form-control input-lg" id="contactName"
					placeholder="" name="contactName"
					onkeypress="if (event.keyCode==13) event.returnValue=false">
			</div>
		</div>
		<div class="col-md-12 column" style="padding: 20px 0px 0px 20px">
			<div class="col-md-1 column" style="font-size:20px">
				<label>Password:</label>
			</div>
			<div class="col-md-3 column">
				<input type="text" class="form-control input-lg" id="contactName"
					placeholder="" name="contactName"
					onkeypress="if (event.keyCode==13) event.returnValue=false">
			</div>
		</div>
		<div class="col-md-12 column" style="padding: 20px 0px 0px 20px">
			<div class="col-md-1 column" style="font-size:20px">
				<label>Name:</label>
			</div>
			<div class="col-md-3 column">
				<input type="text" class="form-control input-lg" id="contactName"
					placeholder="" name="contactName"
					onkeypress="if (event.keyCode==13) event.returnValue=false">
			</div>
		</div>
		<div class="col-md-12 column" style="padding: 20px 0px 0px 30px">
			<label for="name"><h2>Choose services you could offer</h2></label>
			<div class="checkbox" style="padding: 0px 0px 0px 80px">
				<label> <input type="checkbox" value="">store
					leaving students' things temporarily
				</label>
			</div>
			<div class="checkbox" style="padding: 0px 0px 0px 80px">
				<label> <input type="checkbox" value="">transportation
				</label>
			</div>
			<div class="checkbox" style="padding: 0px 0px 0px 80px">
				<label> <input type="checkbox" value="">carrying
				</label>
			</div>
		</div>
		<div class="col-md-12 column" style="padding: 20px 0px 20px 18px">
			<div class="col-md-11 column">
				<textarea class="form-control input-lg" id="description0"
					placeholder="Describe your basic information (school, major, job, etc.) and how you will help student who needs help"
					name="description0" rows="4"></textarea>
			</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
	<div style="padding: 0px 0px 0px 40px" class="row clearfix">
		<div class="col-md-12 column" style="padding: 20px 0px 0px 20px">
			<div class="col-md-1 column" style="font-size:30px">
				<label>Address:</label>
			</div>
			<div class="col-md-4 column">
				<input type="text" class="form-control input-lg" id=""
					placeholder="" name=""
					onkeypress="if (event.keyCode==13) event.returnValue=false">
			</div>
		</div>
		<div class="col-md-12 column" style="padding: 0px 0px 0px 40px">
			<div style="padding: 30px 0px 0px 0px">
				<h1>Contact Information</h1>
				<div class="col-md-12 column" style="padding: 20px 0px 0px 0px">
					<div class="col-md-1 column" style="font-size:20px">
						<label>Phone:</label>
					</div>
					<div class="col-md-3 column">
						<input type="text" class="form-control input-lg" id="phone"
							placeholder="" name="phone"
							onkeypress="if (event.keyCode==13) event.returnValue=false">
					</div>
				</div>
				<div class="col-md-12 column" style="padding: 20px 0px 0px 0px">
					<div class="col-md-1 column" style="font-size:20px">
						<label>Wechat:</label>
					</div>
					<div class="col-md-3 column">
						<input type="text" class="form-control input-lg" id="wechat"
							placeholder="" name="wechat"
							onkeypress="if (event.keyCode==13) event.returnValue=false">
					</div>
				</div>
				<div class="col-md-12 column" style="padding: 20px 0px 0px 0px">
					<div class="col-md-1 column" style="font-size:20px">
						<label>Facebook:</label>
					</div>
					<div class="col-md-3 column">
						<input type="text" class="form-control input-lg" id="facebook"
							placeholder="" name="facebook"
							onkeypress="if (event.keyCode==13) event.returnValue=false">
					</div>
				</div>
				<div class="col-md-12 column" style="padding: 20px 0px 0px 0px">
					<div class="col-md-1 column" style="font-size:20px">
						<label>Email:</label>
					</div>
					<div class="col-md-3 column">
						<input type="text" class="form-control input-lg" id="email"
							placeholder="" name="email"
							onkeypress="if (event.keyCode==13) event.returnValue=false">
					</div>
				</div>
				<div class="col-md-12 column" style="padding: 20px 0px 0px 0px">
					<div class="col-md-1 column" style="font-size:20px">
						<label>Others:</label>
					</div>
					<div class="col-md-3 column">
						<input type="text" class="form-control input-lg" id="others"
							placeholder="" name="others"
							onkeypress="if (event.keyCode==13) event.returnValue=false">
					</div>
					<div class="col-md-1 column"></div>
					<div class="col-md-3 column"><button class="btn-lg btn-info btn-block" type="submit"
					id="fileSubmit">submit</button></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="col-md-12 column" style="padding: 50px 0px 0px 0px">

			<nav class="navbar navbar-inverse navbar-bottom center-block">
				<div class="container">
					<div class="col-md-12 column">
						<div class="col-md-4 column"></div>
						<div class="col-md-4 column">
							<ul class="nav navbar-nav ">
								<li><a href="#"><font size=4>Contact Us</font></a></li>
								<li><a href="#"><font size=4>Feedback</font></a></li>
							</ul>
						</div>
						<div class="col-md-4 column"></div> 	
					</div>
				</div>
			</nav>
		</div>
<body>
</body>
</html>