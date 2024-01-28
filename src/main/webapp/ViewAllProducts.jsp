<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    <title>View All Products</title>
</head>
<body>

<% 
String adminname = (String) request.getParameter("loggedInAdmin");
%>

<nav class="navbar navbar">
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

<h2><a href="./AddNewProduct.jsp?loggedInAdmin=<%=adminname%>" class="btn btn-primary">Add New Product</a></h2>
<br>
<div class="container text-center">
	<form action="ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>" method="post">
		<table class="table" style="width: 40%">
			<tr>
				<td>Enter Product Name:</td>
				<td><input type="text" name="p_name" class="form-control">&nbsp;&nbsp;&nbsp;<input type="submit" value="Search Product" class="btn btn-primary"></td>
			</tr>
		</table>
	</form>
	
	<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
			password="Jankipatel@12345" />
	
	<sql:query dataSource="${dbCon}" var="res">
			select * from products;
	</sql:query>

	<h2>All Products</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Product Serial Number</th>
				<th>Product Name</th>
				<th>Product Model</th>
				<th>Product Color</th>
				<th>Product Company</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="coll" items="${res.rows}">
				<c:set var="pn" value="${coll.ProductName}" />
				<c:set var="entered_pname" value="${param.p_name}" />
				
				<c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
					<tr>
					    <td><c:out value="${coll.ProductSerialNumber}"></c:out></td>
						<td><c:out value="${coll.ProductName}"></c:out></td>
						<td><c:out value="${coll.ProductModel}"></c:out></td>
						<td><c:out value="${coll.ProductColor}"></c:out></td>	
						<td><c:out value="${coll.ProductCompany}"></c:out></td>	
						<td><a href="./UpdateProduct.jsp?loggedInAdmin=<%=adminname%>&prodSrNum=${coll.ProductSerialNumber}" class="btn btn-info">Update</a></td>				
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>' class="btn btn-primary">Go Home</a><br/>
	<br><br>
</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>
