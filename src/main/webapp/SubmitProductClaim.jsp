<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Submit Product Claim</title>
</head>
<body>


<% String uname = (String) request.getParameter("uname");%>
<% String prodSerialNum = (String) request.getParameter("prodSrNum");%>

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

<div class="container text-center mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="C_SubmitProductClaimServlet" method="POST">
                <h2>Submit Product Claim</h2>
                <div class="table-responsive">
                    <table class="table table-bordered" style="width: 100%">
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username" readonly="readonly" value="<%=uname%>" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Product Serial Number</td>
                            <td><input type="number" name="prodSerialNumber" readonly="readonly" value="<%=prodSerialNum%>" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Date of Claim</td>
                            <td><input type="date" name="claimDate" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Description of Issue</td>
                            <td><input type="text" name="issueDescription" class="form-control"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Submit" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <br>
            <a href='UserHome.jsp?loggedInUser=<%=uname%>' class="btn btn-secondary">Go Home</a><br/>
        </div>
    </div>
</div>

</body>
<link rel="stylesheet" href="Style.css">
</html>