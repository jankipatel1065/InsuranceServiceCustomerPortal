<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <title>Update Product</title>
</head>
<body>

<% 
String adminname = (String) request.getParameter("loggedInAdmin");
String prodSrNum = (String) request.getParameter("prodSrNum");
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
<hr><br>

<div class="container text-center">
	<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
			password="Jankipatel@12345" />
			
	<sql:query dataSource="${dbCon}" var="result">
		select * from products WHERE ProductSerialNumber = ?;
		<sql:param value="<%=prodSrNum%>" />
	</sql:query>
	
	<c:forEach var="col" items="${result.rows}">	
		<form action="C_UpdateProductServlet" method="POST">
			<input type="hidden" name="loggedInAdmin" value="<%=adminname%>">
			<h2>Update Product</h2>
			<table class="table" style="width: 40%">
				<tr>
					<td>Product Serial Number</td>
					<td><input type="number" name="prodSerialNum" readonly="readonly" value="<%=prodSrNum%>" class="form-control"></td>
				</tr>
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodName" value="${col.ProductName}" class="form-control"></td>
				</tr>
				<tr>
					<td>Product Model</td>
					<td><input type="text" name="prodModel" value="${col.ProductModel}" class="form-control"></td>
				</tr>
				<tr>
					<td>Product Color</td>
					<td><input type="text" name="prodColor" value="${col.ProductColor}" class="form-control"></td>
				</tr>
				<tr>
					<td>Product Company</td>
					<td><input type="text" name="prodCompany" value="${col.ProductCompany}" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Submit" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
	</c:forEach>
	<br>
	<a href='ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>' class="btn btn-primary">Go Back</a><br/>
</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>
