<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login User</title>

    <!-- Include Bootstrap CSS -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

   

    body

    {

    background-color: #f2f2f2;

    }

        /* Add border and shadow to the form */

        .login-form {

            border: 1px solid #ccc;

            border-radius: 8px;

            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

            padding: 20px;

            background-color: #fff;

        }

 

        /* Center-align the links */

        .center-links {

            text-align: center;

            margin-top: 15px;

        }

 

        /* Style the links */

        .center-links a {

            display: inline-block;

            margin: 5px;

            padding: 8px 20px;

            border: 1px solid #007bff;

            border-radius: 4px;

            color: #007bff;

            text-decoration: none;

            transition: background-color 0.3s, color 0.3s;

        }

 

        .center-links a:hover {

            background-color: #007bff;

            color: #fff;

        }

    </style>

</head>

<body>

    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-6">

                <h1 class="text-center">Login User</h1>

                <form action="C_UserLoginServlet" method="POST" class="login-form">

                    <div class="mb-3">

                        <label for="username" class="form-label">Username</label>

                        <input type="text" class="form-control" id="username" name="username">

                    </div>

                    <div class="mb-3">

                        <label for="u_password" class="form-label">Password</label>

                        <input type="password" class="form-control" id="u_password" name="u_password">

                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>

                </form>

                <div class="center-links">

                    <a href="./CreateUserAccountForm.jsp">Register new user</a>

                    <a href="./LoginAdmin.jsp">Login as an Admin</a>

                </div>

            </div>

        </div>

    </div>

 

    <!-- Include Bootstrap JS (Optional) -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>