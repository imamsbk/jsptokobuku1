<%-- 
    Document   : login
    Created on : Jun 22, 2023, 10:48:21 PM
    Author     : LENOVO
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
    <div class="login-container">
        <h2>Login Form</h2>
        <form id="login-form" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>
        <div class="register-link">
            Don't have an account? <a href="register.jsp">Register</a>
        </div>
    </div>
    
    <%
        // Mendapatkan nilai parameter dari form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Koneksi ke database
        String url = "jdbc:mysql://localhost:3310/tokobuku"; // Ganti dengan URL database Anda
        String dbUsername = "root"; // Ganti dengan username database Anda
        String dbPassword = ""; // Ganti dengan password database Anda
        String driver = "com.mysql.jdbc.Driver";

        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Mengecek apakah username dan password valid
            String sql = "SELECT * FROM login WHERE username=? AND password=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                // Jika login sukses
                response.sendRedirect("dashboard.jsp");
                out.println("<p>Welcome, " + result.getString("username") + "!</p>");
                
            } else {
                // Jika login gagal
                out.println("<h2>Login Failed</h2>");
                out.println("<p>Invalid username or password.</p>");
            }

            // Menutup koneksi ke database
            statement.close();
            conn.close();
        } catch (Exception e) {
            // Menangani exception
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    %>
    
    <style>
        .login-container,
        .register-container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .register-link,
        .login-link {
            margin-top: 10px;
            text-align: center;
        }
    </style>
    

</body>
</html>
