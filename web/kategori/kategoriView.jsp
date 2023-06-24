<jsp:useBean id="JSPTokoBuku" scope="page" class="TokoBuku.KategoriBean" />
<jsp:setProperty name="JSPTokoBuku" property="*" />
<%
 int mulai=0, jumlah=10;
 Object[][] listGuestBook = null;
 listGuestBook=guestBook.listData(mulai,jumlah);
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

        <tr><td>No</td><td>Name</td><td>Address</td><td>Company</td><td>Email</td>
            <td
            colspan="2">Action</td>
        </tr>
             <% if (listGuestBook != null){for (int i=0; i<listGuestBook.length; i++){
             int no=i+1;
             String id=listGuestBook[i][0].toString();
             String nm=listGuestBook[i][1].toString();
             String adr=listGuestBook[i][2].toString();
             String comp=listGuestBook[i][3].toString();
             String email=listGuestBook[i][4].toString();

            //out.print("<tr><td>"+no+"</td><td>"+listGuestBook[i][1].toString()+"</td><td>"+listGuestBook[i][2].toString()+"</td><td>"+listGuestBook[i][3].toString()+"</td><td>"+listGuestBook[i][4].toString()+"</td></tr>");
            %>
            <tr>
            <td> <%=nso%></td>
            <td> <%=nm%></td>
            <td> <%=adr%></td>
            <td><%=comp%></td>
            <td> <%=email%></td>

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
       <a href="index.jsp"> GUEST BOOK </a>

    </body>
</html>
