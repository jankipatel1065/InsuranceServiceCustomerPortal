<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="Style.css">
    <style>
        .navbar {
            margin-bottom: 0;
            background-color: black;
            font-weight: bold;
        }

        .navbar-brand {
            font-size: 24px;
            color: white;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        h2 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f7f7f7;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            width: auto;
            padding: 10px 20px;
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        a {
            color: #337ab7;
        }

        a:hover {
            text-decoration: none;
            color: #23527c;
        }
    </style>
    <title>Update Claim Status</title>
</head>
<body>

    <%
        String adminname = (String) request.getParameter("loggedInAdmin");
        String prodSrNum = (String) request.getParameter("prodSrNum");
        String uName = (String) request.getParameter("userName");
        String claimId = (String) request.getParameter("claimId");
    %>

    <nav class="navbar">
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

    <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
        password="Jankipatel@12345" />

    <div class="container">
        <div align="center">
            <form action="UpdateClaimDB.jsp" method="post">
                <input type="hidden" name="loggedInAdmin" value="<%=adminname%>">
                <input type="hidden" name="claimId" value="<%=claimId%>">
                <h2>Update Claim Status</h2>
                <table class="table table-bordered" style="width: 40%">
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="user_name" readonly="readonly" value="<%=uName%>"></td>
                    </tr>
                    <tr>
                        <td>Product Serial Number</td>
                        <td><input type="number" name="prodSerialNum" readonly="readonly" value="<%=prodSrNum%>"></td>
                    </tr>
                    <tr>
                        <td>Claim Status</td>
                        <td>
                            <input type="radio" name="prodStatus" value="Approved" checked="checked">
                            <label>Approved</label>
                            <input type="radio" name="prodStatus" value="Rejected">
                            <label>Rejected</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" width="100%"><input type="submit" value="Update Claim Status"></td>
                    </tr>
                </table>
            </form>

            <br/><br/>

            <a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Go Home</a><br />
        </div>
    </div>
</body>
</html>
