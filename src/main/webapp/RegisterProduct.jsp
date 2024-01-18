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
            background-image: url('https://img.freepik.com/free-vector/dark-minimal-hexagons-background_79603-1454.jpg?w=900&t=st=1703478827~exp=1703479427~hmac=112b81d68eb9b83cb608230a1282a2f60cf757c93e6786372c3742ef89e76139');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
        }

        .container {
            margin-top: 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.8);
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.8);
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        h2, label {
            color: black;
            font-weight: bold;
        }

        /* Add more styles as needed */
    </style>

    <title>Register Product</title>
</head>
<body>

<% String uname = (String) request.getParameter("uname");%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Hello <%= uname %></a>   
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="UserHome.jsp?loggedInUser=<%=uname%>">Home</a></li>
        <li><a href='LoginUser.jsp'>Logout</a></li>  
    </ul>
  </div>
</nav>

<div class="container text-center">
    <div class="row">
        <!-- Form Container -->
        <div class="col-md-6 col-md-offset-3 form-container">
            <form action="C_RegisterProductServlet" method="POST">
                <h2>Register Product</h2>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" readonly="readonly" value="<%=uname%>" class="form-control">
                </div>
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" name="productName" class="form-control">
                </div>
                <div class="form-group">
                    <label for="productSerialNum">Serial Number</label>
                    <input type="number" name="productSerialNum" min="10001" max="99999" class="form-control">
                </div>
                <div class="form-group">
                    <label for="purchaseDate">Purchase Date</label>
                    <input type="date" name="purchaseDate" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <!-- Search Form and Available Products -->
        <div class="col-md-6">
            <form action="RegisterProduct.jsp?uname=<%=uname%>" method="post">
                <div class="form-group">
                    <label for="p_name">Enter Product Name:</label>
                    <div class="input-group">
                        <input type="text" name="p_name" class="form-control">
                        <span class="input-group-btn">
                            <input type="submit" value="Search Product" class="btn btn-primary">
                        </span>
                    </div>
                </div>
            </form>

            <!-- Rest of the code for Available Products -->
            <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
                    password="Jankipatel@12345" />

            <sql:query dataSource="${dbCon}" var="res">
                    select * from products;
            </sql:query>

            <h2>Available Products</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Product Serial Number</th>
                        <th>Product Name</th>
                        <th>Product Model</th>
                        <th>Product Color</th>
                        <th>Product Company</th>
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
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <a href='UserHome.jsp?loggedInUser=<%=uname%>' class="btn btn-primary">Go Home</a><br/>
            <br>
            <br>
            <br>
        </div>
    </div>
</div>

</body>
</html>
