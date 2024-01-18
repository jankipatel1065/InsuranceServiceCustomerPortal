<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="Style.css"> <!-- Include your custom stylesheet here -->
    <title>View User Products And Claims</title>
</head>

<body>
    <% 
    String adminname = (String) request.getParameter("loggedInAdmin");
    String username = (String) request.getParameter("userName");
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

    <div class="container">
        <h5 class="text-center">You are logged in as an Administrator</h5>
        <hr>

        <div class="text-center">
            <form action="ViewUserProductsAndClaims.jsp?loggedInAdmin=<%=adminname%>&userName=<%=username%>" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" name="p_name" placeholder="Enter Product Name">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">Search Product</button>
                    </span>
                </div>
            </form>

            <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/java_proj_db" user="root" password="Lalit@123" />

            <sql:query dataSource="${dbCon}" var="res">
                SELECT * FROM registeredproducts WHERE login_id = ?;
                <sql:param value="<%=username%>" />
            </sql:query>

            <h2 class="mt-4"><%=username%>'s Registered Products</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Product Serial Number</th>
                        <th>Purchase Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="coll" items="${res.rows}">
                        <c:set var="pn" value="${coll.ProductName}" />
                        <c:set var="entered_pname" value="${param.p_name}" />

                        <c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
                            <tr>
                                <td><c:out value="${coll.ProductName}"></c:out></td>
                                <td><c:out value="${coll.serialno}"></c:out></td>
                                <td><c:out value="${coll.PurchaseDate}"></c:out></td>
                                <td>
                                    <button class="btn btn-info" data-toggle="modal" data-target="#productModal<%= coll.serialno %>">Details</button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Product Details Modal -->
        <c:forEach var="coll" items="${res.rows}">
            <div class="modal fade" id="productModal<%= coll.serialno %>" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Product Details</h4>
                        </div>
                        <div class="modal-body">
                            <p><strong>Product Name:</strong> <%= coll.ProductName %></p>
                            <p><strong>Serial Number:</strong> <%= coll.serialno %></p>
                            <p><strong>Purchase Date:</strong> <%= coll.PurchaseDate %></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="text-center mt-4">
            <sql:query dataSource="${dbCon}" var="rslt">
                select * from claim WHERE Username = ?;
                <sql:param value="<%=username%>" />
            </sql:query>

            <h2><%=username%>'s Product Claims Submitted</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product Serial Number</th>
                        <th>Description</th>
                        <th>Claim Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${rslt.rows}" var="cc">
                        <tr>
                            <td><c:out value="${cc.SerialNumber}"></c:out></td>
                            <td><c:out value="${cc.Description}"></c:out></td>
                            <td><c:out value="${cc.DateOfClaim}"></c:out></td>
                            <td><c:out value="${cc.Status}"></c:out></td>

                            <c:set var="status" value="${cc.Status}" />
                            <c:choose>
                                <c:when test="${(status == 'Pending')}">
                                    <td>
                                        <a class="btn btn-link"
                                            href="./UpdateClaimStatus.jsp?loggedInAdmin=<%=adminname%>&prodSrNum=${cc.SerialNumber}&userName=${cc.Username}&claimId=${cc.ClaimId}">Approve/Reject</a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>Approve/Reject</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <a class="btn btn-primary" href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Go Home</a><br />
            <br><br><br>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>
