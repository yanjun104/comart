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
							<li class="active"><a href="search?keywords="><font size=4>Buy</font></a></li>
							<li><a href="seller.jsp"><font size=4>Sell</font></a></li>
							<c:if test="${sessionScope.user==null}">
								<li><a href="login.jsp"><span
										class="glyphicon glyphicon-user"></span><font size=4> Account</font></a></li>
							</c:if>

							<c:if test="${sessionScope.user!=null}">
								<li><a href="account"><span
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
	<div style="padding: 70px 0px 0px 0px" class="row clearfix">

		<form class="form-horizontal" role="form" action="search" method="get">
			<div class="col-md-2 column">
				<div class="dropdown">
					<button type="button"
						class="btn dropdown-toggle btn-lg btn-block btn-info"
						id="dropdownMenu1" data-toggle="dropdown">
						Categories
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
									href="search?category=Knife & Fork & Spoon">Knife & Fork &
										Spoon</a></li>
								<li><a tabindex="-1" href="search?category=Pot">Pot</a></li>
								<li><a tabindex="-1" href="search?category=Microwave ovens">Microwave
										ovens</a></li>
								<li><a tabindex="-1" href="search?category=Blenders">Blenders</a></li>
								<li><a tabindex="-1" href="search?category=Teakettles">Teakettles</a></li>
								<li><a tabindex="-1" href="search?category=Desk & Table">Desk
										& Table</a></li>
								<li><a tabindex="-1" href="search?category=Chairs & Stools">Chairs
										& Stools</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a tabindex="-1">Home
								Furnitures</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="search?category=Mattress">Mattress</a></li>
								<li><a tabindex="-1" href="search?category=Bed Box Spring">Bed
										Box Spring</a></li>
								<li><a tabindex="-1" href="search?category=Bed Frame">Bed
										Frame</a></li>
								<li><a tabindex="-1" href="search?category=Nightstand">Nightstand</a></li>
								<li><a tabindex="-1" href="search?category=Cabinet">Cabinet</a></li>
								<li><a tabindex="-1" href="search?category=Sofa">Sofa</a></li>
								<li><a tabindex="-1" href="search?category=Bookshelf">Bookshelf</a></li>
								<li><a tabindex="-1" href="search?category=Chair & Stools">Chair
										& Stools</a></li>
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
								<li><a tabindex="-1" href="search?category=Screen Moitors">Screen
										Moitors</a></li>
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
								<li><a tabindex="-1" href="search?category=Chair & Stools">Chair
										& Stools</a></li>
								<li><a tabindex="-1"
									href="search?category=Video Projectors">Video Projectors</a></li>
								<li><a tabindex="-1" href="search?category=Calculators">Calculators</a></li>
								<li><a tabindex="-1" href="search?category=Chair & Stools">Chair
										& Stools</a></li>
								<li><a tabindex="-1"
									href="search?category=Video Projectors">Video Projectors</a></li>
								<li><a tabindex="-1" href="search?category=Calculators">Calculators</a></li>
								<li><a tabindex="-1" href="search?category=Screen Monitors">Screen
										Monitors</a></li>
								<li><a tabindex="-1" href="search?category=Routers">Routers</a></li>
								<li><a tabindex="-1" href="search?category=Pen">Pen</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a tabindex="-1">Appliance</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="search?category=Washers">Washers</a></li>
								<li><a tabindex="-1" href="search?category=Dryers">Dryers</a></li>
								<li><a tabindex="-1" href="search?category=Refrigeritor">Refrigeritor</a></li>
								<li><a tabindex="-1" href="search?category=Screen Monitors">Screen
										Monitors</a></li>
								<li><a tabindex="-1" href="search?category=TV">TV</a></li>
								<li><a tabindex="-1" href="search?category=Microwave Ovens">Microwave
										Ovens</a></li>
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
								<li><a tabindex="-1" href="search?category=shower Curtains">shower
										Curtains</a></li>
								<li><a tabindex="-1" href="search?category=Mats & Carpets">Mats
										& Carpets</a></li>
							</ul></li>
					</ul>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="col-md-9 column">
				<input type="text" class="form-control input-lg" id=""
					placeholder="search the items you need" name="keywords">
			</div>
			<div class="col-md-1 column">
				<button type="button" class="btn btn-default btn-lg"
					onclick="submit()">search</button>
			</div>
		</form>
	</div>





	<div class="row">
		<div class="col-md-2" style="padding: 0px 0px 0px 40px">
		<!-- 	<label for="name"><h2>Location</h2></label>
			<div class="checkbox">
				<label> <input type="checkbox" value="">on campus
				</label>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="">MQ
				</label>
			</div>-->
			<label for="name"><h2>Delivery</h2></label> 
			<div class="checkbox">
				<label> <input type="checkbox" value="">Included
				</label>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="">Only small
					product
				</label>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="">Not included
				</label>
			</div>
		</div>
		<div class="col-md-10" style="padding: 20px 30px 0px 0px">
			<div class="row">
				<div class="col-md-9"></div>
				<div class="col-md-3">
					<form role="form" action="search" method="get" name="sort-form">
						<div class="form-group" id="orderSelect">
						</div>
					</form>
				</div>
			</div>

			<div class="row" style="padding: 30px 30px 0px 0px">
				<c:forEach var="item" items="${requestScope.items}">
					<div class="col-md-2">
						<div class="thumbnail">
							<div style="width:229px;height:229px;">
								<a href="itemDetail?id=${item.itemId}"><img
									src="${item.coverPic.fileAddress}" alt="picture"></a>
							</div>
							<div class="caption">
								<h3>${item.itemName}</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
		var selected1 = "";
		var selected2 = "";
		var selected3 = "";
		var selected4 = "";
		if("${requestScope.sortBy}"!=null && "${requestScope.sortBy}" != ""){
			if("${requestScope.sortBy}"=="1"){
				selected1 = 'selected = "selected" ';
			}
			else if("${requestScope.sortBy}"=="2"){
				selected2 = 'selected = "selected" ';
			}
			if("${requestScope.sortBy}"=="3"){
				selected3 = 'selected = "selected" ';
			}
			if("${requestScope.sortBy}"=="4"){
				selected4 = 'selected = "selected" ';
			}
		}
			$("#orderSelect").replaceWith('<label for="name">sorted by</label> <select class="form-control"'
								+'onchange="sortSearch()" name="sort">'
								+'<option value="1" '+ selected1 +'>Post Time: New to Old</option>'
								+'<option value="2" '+ selected2 +'>Contact Info Times Viewed: Low to'
									+' High</option>'
								+'<option value="3" '+ selected3 +'>Price: Low to High</option>'
								+'<option value="4" '+ selected4 +'>Price: High to Low</option>'
							+'</select> <input type="hidden" name="keywords"'
							+'	value="${requestScope.usedKeywords}"> <input '
								+'type="hidden" name="category" '
								+'value="${requestScope.usedCategory}">');
		});
		function sortSearch() {
			document.getElementsByName("sort-form")[0].submit();
		}
	</script>




</body>

</html>
