<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Kategori</title>
</head>
<body>
    <h1>Tambah Kategori</h1>

    <%-- Ambil data kategori dari parameter POST --%>
    <% String kategori = request.getParameter("kategori"); %>

    <%-- Deklarasi variabel untuk koneksi dan pernyataan SQL --%>
    <% Connection conn = null; %>
    <% PreparedStatement pstmt = null; %>

    <%-- Mengatur informasi koneksi MySQL --%>
    <% String url = "jdbc:mysql://localhost:3310/tokobuku"; %>
    <% String username = ""; %>
    <% String password = ""; %>

    <%-- Proses penambahan kategori --%>
    <% try {
           // Membuat koneksi ke database
           Class.forName("com.mysql.cj.jdbc.Driver");
           conn = DriverManager.getConnection(url, username, password);

           // Menyusun pernyataan SQL
           String sql = "INSERT INTO kategori (id_kategori, nama, desc) VALUES (?)";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, kategori);

           // Menjalankan pernyataan SQL
           pstmt.executeUpdate();
       } catch (SQLException | ClassNotFoundException e) {
           e.printStackTrace();
       } finally {
           // Menutup pernyataan dan koneksi
           try {
               if (pstmt != null) pstmt.close();
               if (conn != null) conn.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
    %>

    <%-- Tampilkan pesan berhasil --%>
    <p>Kategori <strong><%= kategori %></strong> telah ditambahkan.</p>
</body>
</html>
