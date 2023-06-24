<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/tokobuku", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM kategori WHERE id="+id);
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<%
response.setHeader("Refresh", "3; URL=http://localhost:8080/jsptokobuku1/kategori/kategoriView.jsp");
%>