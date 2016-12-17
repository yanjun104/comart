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
							<div class="col-md-1 column"></div>
							<div class="col-md-11 column">
								<h1>Create account</h1>
							</div>
						</div>
					</div>
					<div class="form-bottom" style="padding:100px 0px 0px 0px">
						<form role="form" name="register" action="register" method="post">
							<div class="form-group">
								<label>Your name</label> <input type="text" name="username"
									class="form-control" id="username">
								<div id="nameValidate" style="padding:10px 0px 0px 0px"></div>
							</div>
							<div class="form-group">
								<label>Email</label> <input type="text" name="email"
									class="form-control" id="email" onblur="registeredValidate()">
								<input type="hidden" name="isValidate" value="no">
								<div id="emailValidate" style="padding:10px 0px 0px 0px">
								</div>
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" name="password"
									placeholder="at least 6 characters"
									class="form-password form-control" id="password">
								<div id="passwordValidate" style="padding:10px 0px 0px 0px">
								</div>
							</div>
							<div class="form-group">
								<label>Password again</label> <input type="password"
									name="password" class="form-password form-control"
									id="repassword">
								<div id="repasswordValidate" style="padding:10px 0px 0px 0px">
								</div>
							</div>
							<div class="row" style="padding:10px 0px 0px 0px">
								<div class="col-md-12 column">
									<button type="button" onclick="registerSubmit()"
										class="btn btn-primary btn-lg btn-block">create your
										account</button>
								</div>
							</div>
						</form>
						<div class="row" style="padding:20px 0px 0px 20px">
							Already have an account? <a href="login.jsp">Sign in</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var isEmailExists = false;
		function validate() {
			var nameValidate = true;
			var emailValidate = true;
			var passwordValidate = true;
			var repasswordValidate = true;
			var userName = document.getElementById("username").value;
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var repassword = document.getElementById("repassword").value;
			document.getElementById("nameValidate").innerHTML = "";
			document.getElementById("emailValidate").innerHTML = "";
			document.getElementById("passwordValidate").innerHTML = "";
			document.getElementById("repasswordValidate").innerHTML = "";
			if (userName.length == 0) {
				document.getElementById("nameValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter your name</div>"
				nameValidate = false;
			}
			if (email.length == 0) {
				document.getElementById("emailValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter your email</div>"
				emailValidate = false;
			} else {
				var tag = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
				if (!tag.test(email)) {
					document.getElementById("emailValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter valid email</div>"
					alert();
					emailValidate = false;
				} else {
					registeredValidate();
				}
			}
			if (password.length == 0) {
				document.getElementById("passwordValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Please enter password</div>"
				passwordValidate = false;
			} else if ((password.length < 6) && (password.length > 0)) {
				document.getElementById("passwordValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Password must be at least 6 characters</div>"
				passwordValidate = false;
			} else {
				if (password != repassword) {
					document.getElementById("repasswordValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>password must match</div>"
					repasswordValidate = false;
				}
			}
			//			alert(nameValidate && emailValidate && passwordValidate
			//					&& repasswordValidate);
			//			alert(nameValidate && emailValidate && passwordValidate
			//					&& repasswordValidate && !isEmailExists);
			return nameValidate && emailValidate && passwordValidate
					&& repasswordValidate && !isEmailExists;
		}
		function registeredValidate() {
			if (document.getElementById("email").value.length != 0) {
				//1.get instance of XMLHttpRequest
				var xhr = getXHR();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							if (xhr.responseText == "true") {
								isEmailExists = true;
								document.getElementById("emailValidate").innerHTML = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>The email has been registered</div>"
							} else {
								document.getElementById("emailValidate").innerHTML = "";
								isEmailExists = false;
							}
						}
					}

				}
				//2.connect to the server  
				xhr.open("POST", "register" + "?time=" + new Date().getTime(),
						false);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				//3.send request to the server  
				xhr.send("email=" + document.getElementById("email").value
						+ "&isValidate=yes");
			}
		}
		function registerSubmit() {
			if (validate()) {
				var form = document.getElementsByName("register")[0];
				form.submit();
			}
		}
	</script>

</body>

</html>