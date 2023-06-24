<jsp:useBean id="TokoBuku" scope="page" class="TokoBuku.bukuBean" />
<jsp:setProperty name="TokoBuku" property="*" />
<%
 int mulai=0, jumlah=10;
 Object[][] listbuku = null;
 listbuku = TokoBuku.listData1(mulai,jumlah);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>guestbook</title>
    </head>
    <body>
        <h1>Category List </h1>
        <table border="1">

        <tr><td>No</td>
            <td>Title</td>
            <td>Author</td>
            <td>Description</td>
            <td>Price</td>
            <td>id kategori</td>
            <td>Image</td>
            <td
            colspan="2">Action</td>
        </tr>
             <% if (listbuku != null){for (int i=0; i<listbuku.length; i++){
             int no=i+1;
             String id=listbuku[i][0].toString();
             String tl=listbuku[i][1].toString();
             String aut=listbuku[i][2].toString();
             String dsc=listbuku[i][3].toString();
             String prc=listbuku[i][4].toString();
             String idc=listbuku[i][5].toString();
             String gmb=listbuku[i][6].toString();
             

            //out.print("<tr><td>"+no+"</td><td>"+listGuestBook[i][1].toString()+"</td><td>"+listGuestBook[i][2].toString()+"</td><td>"+listGuestBook[i][3].toString()+"</td><td>"+listGuestBook[i][4].toString()+"</td></tr>");
            %>
            <tr>
            <td> <%=no%></td>
            <td> <%=tl%></td>
            <td> <%=aut%></td>
            <td> <%=dsc%></td>
            <td> <%=prc%></td>
            <td> <%=idc%></td>
            <td> <%=gmb%></td>
            

            <td> 
                <a href="kategoriEdit.jsp?id=<%=id%>">edit</a>
                <a href="delete1.jsp?id=<%=id%>">Delete</a>
            </td>

             </tr>
            <%
            }
            }
            %>
        </table>
        <p></p>
       <a href="buku.jsp"> book list</a>

    </body>
</html>
