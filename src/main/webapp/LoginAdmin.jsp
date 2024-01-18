<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Admin</title>
  <!-- Add Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <!-- Add custom CSS -->
  <style>
    body {
      background: linear-gradient(to right, #003366, #004080, #0059b3, #0073e6);
      color: #fff;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .container {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
      max-width: 400px;
      width: 100%;
      text-align: center;
    }

    h1 {
      color: #007bff;
      font-size: 2em;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-size: 0.9em;
      margin-bottom: 5px;
      color: #333;
    }

    .form-control {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 10px;
      width: 100%;
      box-sizing: border-box;
      transition: border-color 0.3s;
    }

    .form-control:focus {
      border-color: #007bff;
    }

    .btn-primary {
      background-color: #007bff;
      border: 1px solid #007bff;
      color: white;
      font-weight: bold;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      border: 1px solid #0056b3;
    }

    a {
      color: #007bff;
      text-decoration: none;
      font-size: 0.9em;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Login Admin</h1>
    <form action="C_AdminLoginServlet" method="POST" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="adminname">Admin Name</label>
        <input type="text" name="adminname" class="form-control" id="adminname" required onfocus="handleFocus(this)">
      </div>
      <div class="form-group">
        <label for="a_password">Password</label>
        <input type="password" name="a_password" class="form-control" id="a_password" required onfocus="handleFocus(this)">
      </div>
      <div class="form-group">
        <input type="submit" value="Submit" class="btn btn-primary" onclick="submitForm()">
      </div>
      <div>
        <a href="./LoginUser.jsp">Login as a User</a>
      </div>
    </form>

    <script>
      function handleFocus(element) {
        element.style.borderColor = "#007bff";
      }

      function validateForm() {
        var adminName = document.getElementById("adminname").value;
        var password = document.getElementById("a_password").value;

        if (adminName.trim() === "" || password.trim() === "") {
          alert("Please fill in all fields");
          return false;
        }

        // You can add more advanced validation logic here if needed.

        return true;
      }

      function submitForm() {
        // You can add additional actions before submitting the form.
      }
    </script>
  </div>
</body>
</html>
