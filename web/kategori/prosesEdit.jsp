<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3310/guestbook";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String name=request.getParameter("name");
String address=request.getParameter("address");
String company=request.getParameter("company");
String email=request.getParameter("email");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update guest_book set name=?,address=?,company=?,email=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, address);
ps.setString(3, company);
ps.setString(4, email);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<%
response.setHeader("Refresh", "3; URL=http://localhost:8080/GuestBook/guestBookView.jsp");
%>