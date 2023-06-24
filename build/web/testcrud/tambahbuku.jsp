<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Buku</title>
</head>
<body>
    <h1>Tambah Buku</h1>

    <%-- Ambil data buku dari parameter POST --%>
    <% String id = request.getParameter("id_buku"); %>
    <% String judul = request.getParameter("title"); %>
    <% String pengarang = request.getParameter("author"); %>
    <% String harga = request.getParameter("price"); %>
    <% String kategori = request.getParameter("id_kategori"); %>
     <% String gambar = request.getParameter("image"); %>

    <%-- Deklarasi variabel untuk koneksi dan pernyataan SQL --%>
    <% Connection conn = null; %>
    <% PreparedStatement pstmt = null; %>

    <%-- Mengatur informasi koneksi MySQL --%>
    <% String url = "jdbc:mysql://localhost:3310/TokoBuku"; %>
    <% String username = "root"; %>
    <% String password = ""; %>

    <%-- Proses penambahan buku --%>
    <% try {
           // Membuat koneksi ke database
           Class.forName("com.mysql.cj.jdbc.Driver");
           conn = DriverManager.getConnection(url, username, password);

           // Menyusun pernyataan SQL
           String sql = "INSERT INTO buku (id_buku, title, author, description, price, id_kategori, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           pstmt.setString(2, judul);
           pstmt.setString(3, pengarang);
           pstmt.setString(4, deskripsi);
           pstmt.setString(5, harga);
           pstmt.setString(6, kategori);
           pstmt.setString(7, gambar);

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
    <p>Buku dengan judul <strong><%= judul %></strong> telah ditambahkan.</p>
</body>
</html>
