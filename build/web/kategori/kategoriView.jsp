<jsp:useBean id="TokoBuku" scope="page" class="TokoBuku.kategoriBean" />
<jsp:setProperty name="TokoBuku" property="*" />
<%
 int mulai=0, jumlah=10;
 Object[][] listJSPTokoBuku = null;
 listJSPTokoBuku=TokoBuku.listData(mulai,jumlah);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>guestbook</title>
    </head>
    <body>
        <h1>Guest List </h1>
        <table border="1">

        <tr>
            <td>id</td>
            <td>Name</td>
            <td>Description</td>
            <td colspan="2">Action</td>
        </tr>
             <% if (listJSPTokoBuku != null){for (int i=0; i<listJSPTokoBuku.length; i++){
             int no=i+1;
             String id=listJSPTokoBuku[i][0].toString();
             String nm=listJSPTokoBuku[i][1].toString();
             String desc=listJSPTokoBuku[i][2].toString();
             

            //out.print("<tr><td>"+no+"</td><td>"+listGuestBook[i][1].toString()+"</td><td>"+listGuestBook[i][2].toString()+"</td><td>"+listGuestBook[i][3].toString()+"</td><td>"+listGuestBook[i][4].toString()+"</td></tr>");
            %>
            <tr>
            <td> <%=no%></td>
            <td> <%=nm%></td>
            <td> <%=desc%></td>

            <td> 
                <a href="guestBookEdit.jsp?id=<%=id%>">edit</a>
                <a href="delete.jsp?id=<%=id%>">Delete</a>
            </td>

             </tr>
            <%
            }
            }
            %>
        </table>
        <p></p>
       <a href="kategori.jsp"> GUEST BOOK </a>

    </body>
</html>
