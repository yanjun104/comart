<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron">
		<nav class="navbar navbar-inverse navbar-fixed-top class center-block"
			role="navigation">
			<div class="container">
				<div class="col-md-12 column">
					<div class="col-md-4 column"></div>
					<div class="col-md-6 column">
						<ul class="nav navbar-nav ">
							<li class="active"><a href="index"><font size=4>Home</font></a></li>
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

		<div class="row clearfix" style="padding:0px 0px 0px 0px">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="carousel slide" id="carousel-854907">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#carousel-854907"></li>
								<li data-slide-to="1" data-target="#carousel-854907"></li>
								<li data-slide-to="2" data-target="#carousel-854907"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img alt="" src="pictures/website/a.jpg"
										ondragstart="return false;"
										oncontextmenu="self.event.returnValue=false" />
									<div class="carousel-caption"></div>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-854907"
								data-slide="prev"><span
								class="glyphicon glyphicon-chevron-left"></span></a> <a
								class="right carousel-control" href="#carousel-854907"
								data-slide="next"><span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="padding: 20px 0px 0px 0px" class="row clearfix">
			<div class="col-md-12 column">
				<form class="form-horizontal" name="search" id="search" role="form"
					action="search" method="get">
					<div class="col-md-2 column">
						<div class="dropdown">
							<button type="button"
								class="btn btn-info dropdown-toggle btn-lg btn-block"
								id="dropdownMenu1" data-toggle="dropdown">
								<font size=5>Categories</font> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu menu-top" style="min-width:100%">
								<li class="dropdown-submenu"><a tabindex="-1">Books</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Textbooks">Textbooks</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Kitchen &
										Dining</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Bowl">Bowl</a></li>
										<li><a tabindex="-1" href="search?category=Plate">Plate</a></li>
										<li><a tabindex="-1" href="search?category=Chopstic">Chopstic</a></li>
										<li><a tabindex="-1"
											href="search?category=Knife & Fork & Spoon">Knife & Fork
												& Spoon</a></li>
										<li><a tabindex="-1" href="search?category=Pot">Pot</a></li>
										<li><a tabindex="-1"
											href="search?category=Microwave ovens">Microwave ovens</a></li>
										<li><a tabindex="-1" href="search?category=Blenders">Blenders</a></li>
										<li><a tabindex="-1" href="search?category=Teakettles">Teakettles</a></li>
										<li><a tabindex="-1" href="search?category=Desk & Table">Desk
												& Table</a></li>
										<li><a tabindex="-1"
											href="search?category=Chairs & Stools">Chairs & Stools</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabinde x="-1">Home
										Furnitures</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Mattress">Mattress</a></li>
										<li><a tabindex="-1"
											href="search?category=Bed Box Spring">Bed Box Spring</a></li>
										<li><a tabindex="-1" href="search?category=Bed Frame">Bed
												Frame</a></li>
										<li><a tabindex="-1" href="search?category=Nightstand">Nightstand</a></li>
										<li><a tabindex="-1" href="search?category=Cabinet">Cabinet</a></li>
										<li><a tabindex="-1" href="search?category=Sofa">Sofa</a></li>
										<li><a tabindex="-1" href="search?category=Bookshelf">Bookshelf</a></li>
										<li><a tabindex="-1"
											href="search?category=Chair & Stools">Chair & Stools</a></li>
										<li><a tabindex="-1" href="search?category=Desk & Table">Desk
												& Table</a></li>
										<li><a tabindex="-1" href="search?category=Shop Rack">Shop
												Rack</a></li>
										<li><a tabindex="-1" href="search?category=Lamps">Lamps</a></li>
										<li><a tabindex="-1" href="search?category=Garment Rack">Garment
												Rack</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Cleaning</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Sweeping">Sweeping</a></li>
										<li><a tabindex="-1" href="search?category=Vacuum">Vacuum</a></li>
										<li><a tabindex="-1" href="search?category=Dust Can">Dust
												Can</a></li>
										<li><a tabindex="-1" href="search?category=Mop">Mop</a></li>
										<li><a tabindex="-1" href="search?category=Bucket">Bucket</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Electronics</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Laptop">Laptop</a></li>
										<li><a tabindex="-1" href="search?category=Cellphone">Cellphone</a></li>
										<li><a tabindex="-1"
											href="search?category=Speakers & Headphones">Speakers &
												Headphones</a></li>
										<li><a tabindex="-1" href="search?category=Video Games">Video
												Games</a></li>
										<li><a tabindex="-1" href="search?category=Camera">Camera</a></li>
										<li><a tabindex="-1" href="search?category=TV">TV</a></li>
										<li><a tabindex="-1"
											href="search?category=Screen Moitors">Screen Moitors</a></li>
										<li><a tabindex="-1" href="search?category=Routers">Routers</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Office &
										Study</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Printers">Printers</a></li>
										<li><a tabindex="-1" href="search?category=Bookshelf">Bookshelf</a></li>
										<li><a tabindex="-1" href="search?category=Lamps">Lamps</a></li>
										<li><a tabindex="-1" href="search?category=Stapler">Stapler</a></li>
										<li><a tabindex="-1" href="search?category=Paper">Paper</a></li>
										<li><a tabindex="-1" href="search?category=Desk & Table">Desk
												& Table</a></li>
										<li><a tabindex="-1"
											href="search?category=Chair & Stools">Chair & Stools</a></li>
										<li><a tabindex="-1"
											href="search?category=Video Projectors">Video Projectors</a></li>
										<li><a tabindex="-1" href="search?category=Calculators">Calculators</a></li>
										<li><a tabindex="-1"
											href="search?category=Chair & Stools">Chair & Stools</a></li>
										<li><a tabindex="-1"
											href="search?category=Video Projectors">Video Projectors</a></li>
										<li><a tabindex="-1" href="search?category=Calculators">Calculators</a></li>
										<li><a tabindex="-1"
											href="search?category=Screen Monitors">Screen Monitors</a></li>
										<li><a tabindex="-1" href="search?category=Routers">Routers</a></li>
										<li><a tabindex="-1" href="search?category=Pen">Pen</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Appliance</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Washers">Washers</a></li>
										<li><a tabindex="-1" href="search?category=Dryers">Dryers</a></li>
										<li><a tabindex="-1" href="search?category=Refrigeritor">Refrigeritor</a></li>
										<li><a tabindex="-1"
											href="search?category=Screen Monitors">Screen Monitors</a></li>
										<li><a tabindex="-1" href="search?category=TV">TV</a></li>
										<li><a tabindex="-1"
											href="search?category=Microwave Ovens">Microwave Ovens</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Transportation</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Vehicles">Vehicles</a></li>
										<li><a tabindex="-1" href="search?category=Bikes">Bikes</a></li>
										<li><a tabindex="-1"
											href="search?category=UTD Parking stickers">UTD Parking
												stickers</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Music
										Instruments</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Guitars">Guitars</a></li>
										<li><a tabindex="-1" href="search?category=Piano">Piano</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1">Others</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="search?category=Hangers">Hangers</a></li>
										<li><a tabindex="-1" href="search?category=Weight Scales">Weight
												Scales</a></li>
										<li><a tabindex="-1"
											href="search?category=UTD Parking stickers">UTD Parking
												stickers</a></li>
										<li><a tabindex="-1" href="search?category=Cap & Gown">Cap
												& Gown</a></li>
										<li><a tabindex="-1" href="search?category=Umbrellas">Umbrellas</a></li>
										<li><a tabindex="-1" href="search?category=Packing boxes">Packing
												boxes</a></li>
										<li><a tabindex="-1"
											href="search?category=shower Curtains">shower Curtains</a></li>
										<li><a tabindex="-1"
											href="search?category=Mats & Carpets">Mats & Carpets</a></li>
									</ul></li>
							</ul>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="col-md-10 column">
						<div class="input-group">
							<input type="text" class="form-control input-lg" id=""
								placeholder="search the items you need" name="keywords" style="height: 60px;  padding: 10px 16px;  font-size: 26px;  line-height: 1.33; 
      border-radius: 6px;">
							<span class="input-group-btn">
								<button type="button" class="btn btn-default btn-lg"
									onclick="submit()" style="height: 60px;">search</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div style="padding: 50px 0px 0px 0px" class="row clearfix">
			<div class="col-md-12 column">
				<div class="col-md-2 column"></div>
				<div class="col-md-7 column">
						<h3>Have a car? extra space? or even only strength/time? Join us to help UTD students </h3>
						<h3>for a good chance to make friends and money!</h3>
				</div>
				<div class="col-md-3 column">
					<a href="addhelper.jsp"><button type="button" class="btn btn-default btn-lg btn-info">Become a Helper</button></a>
				</div>
			</div>
		</div>
		<div style="padding: 100px 0px 0px 0px" class="row clearfix">
			<div class="col-md-12 column">
				<div class="col-md-2 column"></div>
				<div class="col-md-3 column">
					<img src="pictures/website/transportation.jpg" class="img-circle">
					<div class="caption">
						<div style="padding: 0px 0px 0px 50px">
							<h3>Transportation Helper</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 column">
					<img src="pictures/website/helper.jpg" class="img-circle">
					<div class="caption">
						<div style="padding: 0px 150px 0px 0px">
							<h3>Storage Helper</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 column">
					<img src="pictures/website/strength.jpg" class="img-circle">
					<div class="caption">
						<div style="padding: 0px 0px 0px 90px">
							<h3>Moving Helper</h3>
						</div>
					</div>
				</div>
				<div class="col-md-1 column"></div>
			</div>
			<div class="col-md-12 column" style="padding: 50px 0px 0px 0px">
				<div class="col-md-5 column"></div>
				<div class="col-md-2 column">
					<a href="searchhelper.jsp"><button class="btn-lg btn-info btn-block">Find a Helper</button></a>
				</div>
				<div class="col-md-5 column"></div>
			</div>
		</div>
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
	</div>
</body>
<script type="text/javascript">

</script>
</html>
