<%-- 
    Document   : inde.html
    Created on : Jun 20, 2023, 7:05:22 PM
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
        <h1>Hello World!</h1>
           <%
    response.setHeader("Refresh", "3; URL=http://localhost:8080/JSPTokoBuku/login.jsp");
        %>
    </body>
</html>
