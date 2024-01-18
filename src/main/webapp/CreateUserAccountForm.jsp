<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User Account</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Add custom CSS -->
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/elegant-line-abstract-background-wave-design-swoosh-speed-wave-modern-art_666745-215.jpg?w=996');
            background-repeat: no-repeat;
            background-size: cover;
            color: #333;
        }

        .container {
            margin-top: 40px;
            max-width: 500px;
            padding: 15px;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            font-size: 1.8em;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
            color: #555;
        }

        .form-control {
            border-color: #ccc;
            border-radius: 3px;
            padding: 10px;
        }

        .error-message {
            color: #ff0000;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .btn-primary {
            background-color: #8B1000;
            border-color: #555;
            color: white;
            font-weight: bold;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #444;
            border-color: #444;
        }

        .center-text {
            text-align: center;
            margin-top: 15px;
            color: #555;
        }

        .text-center {
            color: #8B0000;
        }

        .focused {
            background-color: #8B5900;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="C_UserAccountServlet" method="POST" onsubmit="return validateForm()" novalidate>
            <h2 class="text-center">Register User Account</h2>
            <div class="form-group">
                <label for="Username">Username</label>
                <input type="text" name="Username" class="form-control" required onfocus="highlightInput(this)"
                    onblur="removeHighlight(this)">
                <div id="username-error" class="error-message"></div>
            </div>
             <div class="form-group">
                <label for="Password">Password</label>
                <input type="password" name="Password" class="form-control" required
                      
                       onfocus="highlightInput(this)" onblur="removeHighlight(this)">
                <div id="password-error" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="Phone">Phone</label>
                <input type="tel" name="Phone" class="form-control" maxlength="10" required onfocus="highlightInput(this)"
                    onblur="removeHighlight(this)">
                <div id="phone-error" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" name="Email" class="form-control" required onfocus="highlightInput(this)"
                    onblur="removeHighlight(this)">
                <div id="email-error" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="Address">Address</label>
                <input type="text" name="Address" class="form-control" required onfocus="highlightInput(this)"
                    onblur="removeHighlight(this)">
                <div id="address-error" class="error-message"></div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
        <p class="center-text">
            <a href="./LoginUser.jsp">Go Back</a>
        </p>
    </div>

    <!-- Move the script to the end of the body -->
   <script>
    document.addEventListener("DOMContentLoaded", function () {
        // Add input event listeners to trigger validation on input change
        var inputFields = document.querySelectorAll(".form-control");
        inputFields.forEach(function (field) {
            field.addEventListener("input", function () {
                validateForm();
            });
        });
    });

    function validateForm() {
        console.log("validateForm function called");
        var valid = true;

        var username = document.forms[0]["Username"].value;
        var password = document.forms[0]["Password"].value;
        var phone = document.forms[0]["Phone"].value;
        var email = document.forms[0]["Email"].value;
        var address = document.forms[0]["Address"].value;

        // Reset error messages
        document.getElementById("username-error").innerHTML = "";
        document.getElementById("password-error").innerHTML = "";
        document.getElementById("phone-error").innerHTML = "";
        document.getElementById("email-error").innerHTML = "";
        document.getElementById("address-error").innerHTML = "";

        // Validate username
        if (username.length < 6) {
            document.getElementById("username-error").innerHTML = "Username should be at least 6 characters";
            valid = false;
        }

        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        var trimmedPassword = password.trim();
        if (!passwordRegex.test(trimmedPassword)) {
            console.log("Password does not match the regex"); // Add this line
            document.getElementById("password-error").innerHTML = "Password should be at least 6 characters and include at least one letter and one digit";
            valid = false;
        }


        // Validate phone number
        if (phone.length !== 10 || isNaN(phone)) {
            document.getElementById("phone-error").innerHTML = "Invalid phone number";
            valid = false;
        }

        // Validate email (you can add more sophisticated email validation if needed)
         var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById("email-error").innerHTML = "Invalid email address";
            valid = false;
        }

        // Validate address
        if (address.trim() === "") {
            document.getElementById("address-error").innerHTML = "Address is required";
            valid = false;
        }

        // Change button color based on validation result
        var submitButton = document.querySelector(".btn-primary");
        submitButton.classList.remove("btn-danger"); // Remove the danger class
        if (!valid) {
            submitButton.classList.add("btn-danger"); // Add the danger class
        } else {
            submitButton.classList.remove("btn-danger");
        }

        return valid;
    }
</script>

</body>
</html>
