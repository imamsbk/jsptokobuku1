<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Toko Buku</title>
</head>
<body>
    <h1>Toko Buku</h1>

    <h2>Form Kategori</h2>
    <form action="TambahKategori.jsp" method="post">
        <label for="kategori">Kategori:</label>
        <input type="text" id="kategori" name="kategori" required><br><br>
        <input type="submit" value="Tambah Kategori">
    </form>

    <h2>Form Buku</h2>
    <form action="TambahBuku.jsp" method="post">
        <label for="judul">Judul:</label>
        <input type="text" id="judul" name="judul" required><br><br>
        
        <label for="pengarang">Pengarang:</label>
        <input type="text" id="pengarang" name="pengarang" required><br><br>
        
        <label for="kategori">Kategori:</label>
        <select name="kategori">
            <%-- Mendapatkan daftar kategori dari database dan menampilkannya dalam dropdown --%>
            <%@ include file="GetKategori.jsp" %>
        </select><br><br>
        
        <input type="submit" value="Tambah Buku">
    </form>
</body>
</html>
