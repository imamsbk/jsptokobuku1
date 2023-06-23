<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Result</title>
    </head>
    <body>
        <%
            // Mendapatkan nilai parameter dari form
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Koneksi ke database
            String url = "jdbc:mysql://localhost:3306/tokobuku"; // Ganti dengan URL database Anda
            String dbUsername = "root"; // Ganti dengan username database Anda
            String dbPassword = ""; // Ganti dengan password database Anda
            String driver = "com.mysql.jdbc.Driver";

            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Cek apakah username sudah digunakan
                String checkSql = "SELECT * FROM login WHERE username=?";
                PreparedStatement checkStatement = conn.prepareStatement(checkSql);
                checkStatement.setString(1, username);
                ResultSet checkResult = checkStatement.executeQuery();

                if (checkResult.next()) {
                    // Jika username sudah digunakan
                    out.println("<h2>Registration Failed</h2>");
                    out.println("<p>Username already exists. Please choose a different username.</p>");
                } else {
                    // Jika username belum digunakan, simpan data ke database
                    String insertSql = "INSERT INTO login (username, password) VALUES (?, ?)";
                    PreparedStatement insertStatement = conn.prepareStatement(insertSql);
                    insertStatement.setString(1, username);
                    insertStatement.setString(2, password);
                    int rows = insertStatement.executeUpdate();

                    if (rows > 0) {
                        // Jika registrasi sukses
                        out.println("<h2>Registration Successful!</h2>");
                        out.println("<p>Thank you for registering.</p>");
                    } else {
                        // Jika registrasi gagal
                        out.println("<h2>Registration Failed</h2>");
                        out.println("<p>Unable to register. Please try again.</p>");
                    }

                    // Menutup koneksi ke database
                    insertStatement.close();
                }

                // Menutup koneksi ke database
                checkStatement.close();
                conn.close();
            } catch (Exception e) {
                // Menangani exception
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }
        %>
        <%
    response.setHeader("Refresh", "3; URL=http://localhost:8080/JSPTokoBuku/login.jsp");
        %>
    </body>
</html>