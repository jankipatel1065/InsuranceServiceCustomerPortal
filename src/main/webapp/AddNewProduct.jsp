<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Add New Product</title>
</head>
<body>
<% 
String adminname = (String) request.getParameter("loggedInAdmin");
%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Hello <%= adminname %></a>    
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Home</a></li>
      <li><a href="./ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>">View All Products</a></li>
      <li><a href='LoginAdmin.jsp'>Logout</a></li>     
    </ul>
  </div>
</nav>
<h5>You are logged in as an Administrator</h5>
<hr>
<br>
<div class="container text-center">
	<form action="C_AddProductServlet" method="POST">
		<input type="hidden" name="loggedInAdmin" value="<%=adminname%>">
		<h2>Add New Product</h2>
		<table class="table" style="width: 40%">
			<tr>
				<td>Product Serial Number</td>
				<td><input id="prodSerNum" type="number" name="prodSerialNum" min="10001" max="99999" class="form-control"></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="prodName" class="form-control"></td>
			</tr>
			<tr>
				<td>Product Model</td>
				<td><input type="text" name="prodModel" class="form-control"></td>
			</tr>
			<tr>
				<td>Product Color</td>
				<td><input type="text" name="prodColor" class="form-control"></td>
			</tr>
			<tr>
				<td>Product Company</td>
				<td><input type="text" name="prodCompany" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Submit" class="btn btn-primary"></td>
			</tr>
		</table>
	</form>
	<br>
	<a href='ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>' class="btn btn-primary">Go Back</a><br/>
</div>
</body>
<link rel="stylesheet" href="Style.css">
<script type="text/javascript">
	function generateProductNumber(min, max) {
		var num = Math.floor(Math.random() * (max - min + 1)) + min;
		document.getElementById('prodSerNum').value=num;
	}

	window.onload = function() {
		generateProductNumber(10001, 99999);
	};
</script>
</html>
