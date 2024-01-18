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
    .text-center
    {
    	color:white;
    }

    body {
        background-image: url('https://img.freepik.com/free-vector/abstract-blue-light-pipe-speed-zoom-black-background-technology_1142-9530.jpg?w=996&t=st=1703451316~exp=1703451916~hmac=0243ea69f5dc082d4ec3ee385cea6c13adde3e1798a36a2bae9573cfe12c932f'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed; /* This ensures that the background image stays fixed while scrolling */
        background-color: #f2f2f2; /* Fallback color if the image is not available */
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
    
      label {
        color: #007bff; /* Label color */
    }

    input.form-control {
        background-color: #f8f9fa; /* Textbox background color */
        color: #495057; /* Textbox text color */
    }

    /* Style the submit button */

    .btn-primary {
        background-color: #007bff; /* Button background color */
        border-color: #007bff; /* Button border color */
        color: #fff; /* Button text color */
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Button background color on hover */
        border-color: #0056b3; /* Button border color on hover */
        color: #fff; /* Button text color on hover */
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
