<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Register Form</title>
</head>
<body>
    <div class="register-container">
        <h2>Register Form</h2>
        <form id="register-form" method="post" action="registerprocess.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Register">
        </form>
        <div class="login-link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>
    
     
</body>
</html>