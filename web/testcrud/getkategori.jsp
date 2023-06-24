<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3310/tokobuku";
    String username = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String sql = "SELECT * FROM kategori";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            String kategori = rs.getString("nama_kategori");
%>
            <option value="<%= kategori %>"><%= kategori %></option>
<%
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
