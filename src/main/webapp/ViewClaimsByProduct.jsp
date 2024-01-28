<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.navbar-custom {
        background-color: #337ab7; /* Choose your desired background color */
        color: #fff; /* Text color */
        font-weight: bold; /* Bold font */
    }

    .navbar-custom .navbar-brand,
    .navbar-custom .navbar-nav a {
        color: #fff; /* Text color for brand and links */
    }

    .navbar-custom .navbar-nav a:hover {
        color: blue; /* Change color on hover */
    }

</style>
<title>User Product Claims</title>
</head>
<body>
	<% String uname = (String) request.getParameter("uname");%>
	<% String prodName = (String) request.getParameter("pname"); %>
	<% String prodSerialNum = (String) request.getParameter("prodSrNum"); %>
	
<nav class="navbar navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand text-white" href="#">Hello <%= uname %></a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="UserHome.jsp?loggedInUser=<%=uname%>" class="text-white">Home</a></li>
            <li><a href='LoginUser.jsp' class="text-white">Logout</a></li>
        </ul>
    </div>
</nav>
<br>

	<div align="center">
		<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
			password="Jankipatel@12345" />

		<sql:query dataSource="${dbCon}" var="result">
			select * from claim WHERE username = ? AND serialNumber = ?;
			<sql:param value="<%=uname%>" />
			<sql:param value="<%=prodSerialNum%>" />
		</sql:query>

			<div class="container mt-4">
    <h2><b>Product Claims</b></h2>
    <div class="table-responsive">
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
                <c:forEach var="col" items="${result.rows}">
                    <tr>
                        <td><c:out value="<%=prodName%>"></c:out></td>
                        <td><c:out value="${col.serialNumber}"></c:out></td>
                        <td><c:out value="${col.Description}"></c:out></td>
                        <td><c:out value="${col.DateOfClaim}"></c:out></td>
                        <td><c:out value="${col.Status}"></c:out></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<br>
		<a href='UserHome.jsp?loggedInUser=<%=uname%>'>Go Home</a><br/>
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>