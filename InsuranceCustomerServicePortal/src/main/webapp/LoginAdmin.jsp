<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Admin</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- Add custom CSS -->
<style>
body {
	background-color: #212529;
}

.container {
	margin-top: 40px;
	max-width: 500px;
	padding: 15px;
	border-radius: 5px;
	background-color: #fff;
}

h1 {
	color: #007bff;
	font-size: 1.5em;
	margin-bottom: 30px;
}

.form-control {
	border-color: #ccc;
	border-radius: 3px;
	padding: 10px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Login Admin</h1>
		<form action="C_AdminLoginServlet" method="POST">
			<div class="form-group">
				<label for="adminname">Admin Name</label>
				<input type="text" name="adminname" class="form-control" id="adminname">
			</div>
			<div class="form-group">
				<label for="a_password">Password</label>
				<input type="password" name="a_password" class="form-control" id="a_password">
			</div>
			<div class="form-group">
				<input type="submit" value="Submit" class="btn btn-primary">
			</div>
			<br>
			<a href="./LoginUser.jsp">Login as a User</a>		
		</form>
	</div>
</body>
</html>
