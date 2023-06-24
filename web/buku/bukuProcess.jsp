<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Kategori</title>
   
</head>
<body>
    <% 
        // Ambil data dari form
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int idkategori = Integer.parseInt(request.getParameter("idkategori"));
        String image = request.getParameter("image");
        

        // Konfigurasi koneksi database
        String url = "jdbc:mysql://localhost:3310/tokobuku";
        String username = "root";
        String password = "";

        try {
            // Buat koneksi ke database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Buat pernyataan SQL untuk memasukkan data kategori ke dalam tabel
            String sql = "INSERT INTO buku (title, author, description, price, id_kategori, image) VALUES (?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, description);
            statement.setInt(4, price);
            statement.setInt(5, idkategori);
            statement.setString(6, image);
            

            // Jalankan pernyataan SQL
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h1>Data kategori berhasil disimpan.</h1>");
            } else {
                out.println("<h1>Gagal menyimpan data kategori.</h1>");
            }

            // Tutup koneksi ke database
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println("<h1>Terjadi kesalahan: " + e.getMessage() + "</h1>");
        }
    %>
    
     <% response.setHeader("Refresh", "2; URL=http://localhost:8080/jsptokobuku1/buku/bukuView.jsp"); %>
</body>
</html>
