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


<body>

	<!-- Top content -->

	<div class="inner-bg" style="padding:80px 0px 0px 0px">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4 ">
					<div class="form-top">
						<div class="col-md-12 column">
							<div class="col-md-3 column"></div>
							<div class="col-md-9 column">
								<h1>Sign in</h1>
							</div>
						</div>
					</div>
					<div class="form-bottom" style="padding:100px 0px 0px 0px">
						<form role="form" name="login-form" action="login" method="post">
							<div id="loginValidate" style="padding:10px 0px 0px 0px"></div>
							<div class="form-group">
								<label for="form-username">Email</label> <input type="text"
									name="email" placeholder="" class="form-username form-control"
									id="email">
							</div>
							<div id="emailValidate" style="padding:10px 0px 0px 0px"></div>
							<div class="form-group">
								<label for="form-password">Password</label> <input
									type="password" name="password" placeholder=""
									class="form-password form-control" id="password">
							</div>
							<div id="passwordValidate" style="padding:10px 0px 0px 0px">
							</div>
							<div class="row" style="padding:10px 0px 30px 0px">
								<div class="col-md-12 column">
									<button type="button" class="btn btn-primary btn-lg btn-block"
										onclick="loginSubmit()">Sign in</button>
								</div>
							</div>
						</form>
						<h4>--------------------New to here?----------------------</h4>
						<form action="register">
							<div class="row" style="padding:20px 0px 0px 0px">
								<div class="col-md-12 column">
									<button type="submit" class="btn btn-lg btn-block btn-success">create
										your account</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function loginValidate() {
			var isEmailEmpty = true;
			var isPasswordEmpty = true;
			var isEmailExists = false;
			var isMatched = false;
			if (document.getElementById("email").value.length == 0) {
				isEmailEmpty = true;
				isEmailExists = false;
				isPasswordEmpty = true;
				isMatched = false;
				document.getElementById("emailValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter your email</div>";
			} else {
				document.getElementById("emailValidate").innerHTML = "";
				isEmailEmpty = false;
				if (document.getElementById("password").value.length == 0) {
					isPasswordEmpty = true;
					document.getElementById("passwordValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter your password</div>";
				} else {
					isPasswordEmpty = false;
					document.getElementById("passwordValidate").innerHTML = "";
					//1.get instance of XMLHttpRequest
					var xhr = getXHR();
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4) {
							if (xhr.status == 200) {
								if (xhr.responseText == "not exists") {
									document.getElementById("loginValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>We can not find an account with that email address</div>"
									isEmailExists = false;
								}
								if (xhr.responseText == "not match") {
									document.getElementById("loginValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Your password is incorrect</div>";
									isEmailExists = true;
									isMatched = false;
								}
								if (xhr.responseText == "match") {
									document.getElementById("loginValidate").innerHTML = "";
									isEmailExists = true;
									isMatched = true;
								}
							}
						}

					}
					//2.connect to the server  
					xhr.open("POST", "login" + "?time=" + new Date().getTime(),
							false);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					//3.send request to the server  
					xhr.send("email=" + document.getElementById("email").value
							+ "&password="
							+ document.getElementById("password").value
							+ "&isMatchValidate=yes");
				}
			}
			return isEmailExists && !isEmailEmpty && !isPasswordEmpty
					&& isMatched;
		}

		function loginSubmit() {
			if (loginValidate()) {
				var form = document.getElementsByName("login-form")[0];
				form.submit();
			}
		}
	</script>
</body>

</html>