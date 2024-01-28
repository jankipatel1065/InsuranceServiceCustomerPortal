<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="Style.css"> <!-- Add your custom styles here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .navbar {
            margin-bottom: 0;
            background-color: black;
             font-weight:bold;
        }

        .navbar-brand {
            font-size: 24px;
            color: white;
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
    </style>
</head>
<body>
    <% 
        String adminname = (String) request.getAttribute("loggedInAdmin");
        if(adminname == null) {
            adminname = (String) request.getParameter("loggedInAdmin");
        }
    %>

    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Hello <%= adminname %></a>    
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="./ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>">View All Products</a></li>
                <li><a href='LoginAdmin.jsp'>Logout</a></li>      
            </ul>
        </div>
    </nav>

    <h5>You are logged in as an Administrator</h5>
    <hr>

    <div class="container">
        <div align="center">
            <form action="AdminHome.jsp?loggedInAdmin=<%=adminname%>" method="post">
                <table class="table table-bordered" style="width: 40%">
                    <tr>
                        <td>Enter Username:</td>
                        <td>
                            <input type="text" name="u_name" class="form-control">
                            <input type="submit" value="Search User Account" class="btn btn-primary">
                        </td>                    
                    </tr>
                </table>
            </form>

            <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/abcdatabase" user="root"
                password="Jankipatel@12345" />
                
            <sql:query dataSource="${dbCon}" var="result">
                select * from user;
            </sql:query>

            <h2>All Registered Users</h2>
            <table class="table table-bordered ">
                <tr>
                    <th>Username</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                </tr>

                <c:forEach var="col" items="${result.rows}">
                    <c:set var="un" value="${col.Username}" />
                    <c:set var="entered_uname" value="${param.u_name}" />

                    <c:if test="${fn:containsIgnoreCase(un, entered_uname)}">
                        <tr>                            
                            <td>
                                <a href="./ViewUserProductsAndClaims.jsp?loggedInAdmin=<%=adminname%>&userName=${col.Username}">
                                    <c:out value="${col.Username}" />
                                </a>
                            </td>
                            <td><c:out value="${col.Phone}"></c:out></td>
                            <td><c:out value="${col.Email}"></c:out></td>
                            <td><c:out value="${col.Address}"></c:out></td>                        
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>    
        <br>

        <div align="center">
            <form action="AdminHome.jsp?loggedInAdmin=<%=adminname%>" method="post">
                <table class="table table-bordered" style="width: 40%">
                    <tr>
                        <td>Enter Product Name:</td>
                        <td>
                            <input type="text" name="p_name" class="form-control">
                            <input type="submit" value="Search Product" class="btn btn-primary">
                        </td>                    
                    </tr>
                </table>
            </form>    
            <sql:query dataSource="${dbCon}" var="res">
                select * from registeredproducts;
            </sql:query>

            <h2>All Registered Products</h2>
            <table class="table table-bordered">
                <tr>
                    <th>Username</th>
                    <th>Product Name</th>
                    <th>Product Serial Number</th>
                    <th>Purchase Date</th>
                </tr>

                <c:forEach var="coll" items="${res.rows}">
                    <c:set var="pn" value="${coll.ProductName}" />
                    <c:set var="entered_pname" value="${param.p_name}" />

                    <c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
                        <tr>
                            <td><c:out value="${coll.login_id}"></c:out></td>                            
                            <td><c:out value="${coll.ProductName}"></c:out></td>
                            <td><c:out value="${coll.Serialno}"></c:out></td>
                            <td><c:out value="${coll.PurchaseDate}"></c:out></td>                                                
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
        
        <br>
        
        <div align="center">    
            <sql:query dataSource="${dbCon}" var="rslt">
                select * from claim;
            </sql:query>

            <h2>All Product Claims Submitted</h2>
            <table class="table table-bordered">
                <tr>
                    <th>Username</th>
                    <th>Product Serial Number</th>
                    <th>Description</th>
                    <th>Claim Date</th>
                    <th>Status</th>
                    <th></th>
                </tr>

                <c:forEach var="cc" items="${rslt.rows}">
                    <tr>                    
                        <td><c:out value="${cc.Username}"></c:out></td>
                        <td><c:out value="${cc.SerialNumber}"></c:out></td>
                        <td><c:out value="${cc.Description}"></c:out></td>
                        <td><c:out value="${cc.DateOfClaim}"></c:out></td>
                        <td><c:out value="${cc.Status}"></c:out></td>                            

                        <c:set var="status" value="${cc.Status}"/>
                        <c:choose>
                            <c:when test="${(status == 'Pending')}">
                                <td>
                                    <a href="./UpdateClaimStatus.jsp?loggedInAdmin=<%=adminname%>&prodSrNum=${cc.SerialNumber}&userName=${cc.Username}&claimId=${cc.ClaimId}" class="btn btn-primary">
                                        Approve/Reject
                                    </a>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>Approve/Reject</td>
                            </c:otherwise>
                        </c:choose>                                                        
                    </tr>
                </c:forEach>
            </table>
            <br><br><br>
        </div>
    </div>
</body>
</html>
