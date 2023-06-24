<%-- 
    Document   : index
    Created on : Jun 5, 2023, 10:14:18 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tambahkan Buku Baru</h1>
 <form name="login" action="bukuProcess.jsp" method="post">
 <table width="200" border="1">

 <tr>
 <td>judul</td>
 <td><input type="text" name="title"></td>
 </tr>
 <tr>
 <td>pengarang</td>
 <td><input type="text" name="author"></td>
 </tr>
 <tr>
 <td>deskripsi</td>
 <td><input type="text" name="description"></td>
 </tr>
 <tr>
 <td>harga</td>
 <td><input type="number" name="price"></td>
 </tr>
 <tr>
 <td>kategori id</td>
 <td><input type="number" name="idkategori"></td>
 </tr>
 <tr>
 <td>gambar</td>
 <td><input type="text" name="image"></td>
 </tr>
 <tr>
 <td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
 </tr>
 </table>
 <h2><a href="bukuView.jsp" > View Books </a></h2>
    </body>
</html>
