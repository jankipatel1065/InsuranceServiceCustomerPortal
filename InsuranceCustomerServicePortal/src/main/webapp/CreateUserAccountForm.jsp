<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create User Account</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- Add custom CSS -->
<style>
body {
	background-color: #f2f2f2;
	color: #333;
}

.container {
	margin-top: 40px;
	max-width: 500px;
	padding: 15px;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #333; /* Change the title color */
	font-size: 1.8em;
	margin-bottom: 30px;
}

.form-group label {
	font-weight: bold;
	color: #555;
}

.form-control {
	border-color: #ccc;
	border-radius: 3px;
	padding: 10px;
}

.btn-primary {
	background-color: #555; /* Change the button color */
	border-color: #555;
	color: white;
	font-weight: bold;
	width: 100%;
}

.btn-primary:hover {
	background-color: #444; /* Change the button hover color */
	border-color: #444;
}

.center-text {
	text-align: center;
	margin-top: 15px;
	color: #555;
}
</style>
</head>
<body>
	<div class="container">
		<form action="C_UserAccountServlet" method="POST">
			<h2 class="text-center">Register User Account</h2>
			<div class="form-group">
				<label for="Username">Username</label>
				<input type="text" name="Username" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="Password">Password</label>
				<input type="password" name="Password" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="Phone">Phone</label>
				<input type="tel" name="Phone" class="form-control" maxlength="10" required>
			</div>
			<div class="form-group">
				<label for="Email">Email</label>
				<input type="email" name="Email" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="Address">Address</label>
				<input type="text" name="Address" class="form-control" required>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
		<p class="center-text">
			<a href="./LoginUser.jsp">Go Back</a>
		</p>
	</div>
</body>
</html>
