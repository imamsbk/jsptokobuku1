<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="TokoBuku" scope="page" class="TokoBuku.kategoriBean" />
<jsp:setProperty name="TokoBuku" property="*" />

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<% response.setHeader("Refresh", "3; URL=http://localhost:8080/JSPTokoBuku/kategori/kategoriView.jsp");
%>

<%
String message = "";
String id_kategori = request.getParameter("id_kategori") ;
String name = request.getParameter("name") ;
String desc = request.getParameter("desc") ;

//jika name, address, company dan email tidak (“”) maka
if((!id_kategori.equals("")) & (!name.equals("")) & (!desc.equals(""))){
    if(TokoBuku.simpan()){
        message = "input success ";
        }else{
            message = "Error" ;
        }
    }else{
        message="Field nama, alamat, company dan email tidak boleh kosong";
}
//lakukan insert data ke database
//jika berhasil message = "Thank you " + name + " for Registering "
;
//jika tidak set message = "Error" ;
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>guestbook</title>
    </head>
    <body>
        <h2><%=message%>
        <br>
        <a href="kategori.jsp"> kategori </a>
        <br>
        <a href="kategoriView.jsp"> VIEW kategori </a>
        </h2
    </body>
</html>

