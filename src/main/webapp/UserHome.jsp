<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    body {
        font-family: Arial, sans-serif;
    }

    .container {
       
        color: white;
       
    }

    .navbar{
         background-color: #337ab7;
        
    }



   .nav-item
   {
   	color:white;
   }
</style>

    <title>User Home</title>
</head>
<body>

<%
    String username = (String) request.getAttribute("loggedInUser");

    if(username == null) {
        username = (String) request.getParameter("loggedInUser");
    }
%>

<nav class="navbar navbar-expand-md navbar">
    <div class="container">
        <a class="navbar-brand text-white" href="#">Hello <b><%= username %></b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="LoginUser.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container mt-4">
    <h2><a href="./RegisterProduct.jsp?uname=<%=username%>" class="btn btn-success">Register new product</a></h2>
    <br><br>


    <div class="text-center">
      <form action="UserHome.jsp?loggedInUser=<%=username%>" method="post" class="mb-4">
    <div class="input-group w-50 mx-auto">
        <input type="text" class="form-control" name="p_name" placeholder="Enter Product Name">
        <div class="input-group-append">
            <button type="submit" class="btn btn-primary btn-gradient">Search Product</button>
        </div>
    </div>
</form>


        <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
                           password="Jankipatel@12345" />

        <sql:query dataSource="${dbCon}" var="result">
            select * from registeredproducts WHERE login_id = ?;
            <sql:param value="<%=username%>" />
        </sql:query>

        <h2>Registered Products</h2>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Product Name</th>
                <th>Product Serial Number</th>
                <th>Purchase Date</th>
                <th>Add a Claim</th>
                <th>View Claims</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="col" items="${result.rows}">
                <tr>
                    <td><c:out value="${col.productname}"></c:out></td>
                    <td><c:out value="${col.serialno}"></c:out></td>
                    <td><c:out value="${col.Purchasedate}"></c:out></td>
                    <td><a href="./SubmitProductClaim.jsp?uname=<%=username%>&prodSrNum=${col.serialno}" class="btn btn-primary">Add a claim</a></td>
                    <td><a href="./ViewClaimsByProduct.jsp?uname=<%=username%>&pname=${col.ProductName}&prodSrNum=${col.serialno}" class="btn btn-secondary">View Claims</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <sql:query dataSource="${dbCon}" var="res">
            select r.ProductName, c.SerialNumber, c.Description, c.DateOfClaim, c.Status from claim c
            JOIN registeredproducts r ON c.serialNumber = r.serialno
            WHERE c.Username = ?;
            <sql:param value="<%=username%>" />
        </sql:query>

        <h2>Product Claims</h2>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Product Name</th>
                <th>Product Serial Number</th>
                <th>Description</th>
                <th>Claim Date</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="coll" items="${res.rows}">
                <tr>
                    <td><c:out value="${coll.ProductName}"></c:out></td>
                    <td><c:out value="${coll.SerialNumber}"></c:out></td>
                    <td><c:out value="${coll.Description}"></c:out></td>
                    <td><c:out value="${coll.DateOfClaim}"></c:out></td>
                    <td><c:out value="${coll.Status}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <br>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
